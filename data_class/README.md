# Freezed & Equatable или Kotlin data class в Dart

Это будет короткий обзор на то, как и зачем в Dart делают то, что в Kotlin скрывается за `data class`

## Непосредственно `data class`

Само собой, [документация](https://kotlinlang.org/docs/data-classes.html)

Сначала поймем, что вообще скрывается за этими ключевыми словами (необходимое для данной темы):
    - генерация пары `.equals()`, `.hashCode()`
    - генерация `.toString()` (вида `"User(name=John, age=42)"` для `data class User(val name: String, val age: Int)`, например)
    - генерация `.copy()` 
    - доступ к полям конструктора в виде `.componentN()`, где `N = 0, 1, ...`
    - гарантии и требования, которые важны в контексте Kotlin (вроде полей класса, объявленных вне конструктора, переиспользования методов, описанных выше и другого)

## Аналог в Dart 

Такого нет. И тут не поможет огромное множество комбинаций модификаторов - как `abstract base interfrace` не пиши, не будет `data class`

## Ну нет и не надо. Или не так? 

Смотрим на вот такой пример:

```dart
class User {
  final String name;
  const User({required this.name});
}

void noEqualFail() {
  final bob = User(name: "Bob");
  print(bob == User(name: "Bob"));
}

void noToString() {
  final bob = User(name: "Bob");
  print(bob);
}
```

Вызовы функций напечатают 
```
false
Instance of 'User'
```
соответственно. А нам всё-таки хочется `true` и `User(name: "Bob")` (ну или что-то подобное, в случае `toString()`)

Ручное решение, само собой, существует:
```dart
@override
bool operator ==(Object other) =>
    identical(this, other) || // да, это проверка на равенство ссылок
    other is Person &&
    runtimeType == other.runtimeType &&
    name == other.name;
```

## Решение 0: Equatable

`dart pub add equatable` для установки

[Документация](https://pub.dev/packages/equatable) слишком хороша, чтобы не сослаться на нее (по сути это просто перевод)

Аналогичный пример: 
```dart 
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  const User({required this.name});

  @override
  List<Object> get props => [name];

  @override
  bool get stringify => true;
}

void eqExample() {
  final bob = User(name: "Bob");
  print(bob == User(name: "Bob"));
}

void strExample() {
  final bob = User(name: "Bob");
  print(bob);
}
```

Переопределяем `List<Object> get props => [name];` чтобы понимать, по каким полям сравнивать два объекта

Чтобы пакет за нас определял (или не определял, по умолчанию) `String toString(){ ... }`, переопределяем `bool get stringify => true;`

Можно написать `EquatableConfig.stringify = true;` чтобы для всех классов соответствующий метод был `true`

Тонкость, о которой лучше читать в доке: `EquatableMixin`. В Dart (как и в Kotlin) можно отнаследоваться от нескольких интерфейсов, но не от нескольких реализаций => проблема, так как от `Equatable` мы наследуемся. Решение - написать `class A extends B with EquatableMixin`. Мы снова сможем переопределить `List<Object> get props` и всё, по сути, останется точно так же, как когда мы наследовались.

## Тут и остановимся? 

`Equatable` сделал за нас `.equals(), .hashCode(), toString()`, но теперь нам понадобились `.copyWith()` и `to/fromJson()`

## Решение 1: Freezed 

Для установки: 
```
dart pub add freezed_annotation
dart pub add --dev build_runner
dart pub add --dev freezed
# если хотим генерировать .toJson()
dart pub add json_annotation
dart pub add --dev json_serializable
```

Да-да, генерация кода решит нам все проблемы. Дальше произойдет немного магии, так что замедлимся:

### Простой случай

Хотим: `User(String name, int age)`

Кодим (у меня это файл `freezed_example.dart`, отсюда такие импорты): 

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_example.freezed.dart'; // пока тут ошибка
part 'freezed_example.g.dart'; // тут тоже ошибка

@freezed
class User with _$User {
  const factory User({required String name, required int age}) = _User;
  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
```

Генерируем код: `dart run build_runner build` => получим два файла (как раз исправятся ошибки). 

Запустим примеры: 
```dart 
void eqExample() {
  final bob = User(name: "Bob", age: 100);
  print(bob == User(name: "Bob", age: 100));
}

void strExample() {
  final bob = User(name: "Bob", age: 100);
  print(bob);
}

void jsonExample() {
  final bobJson = User(name: "Bob", age: 100).toJson();
  print("Json ['name'] is ${bobJson['name']}");
  final bobFromJson = User.fromJson(bobJson);
  print(bobFromJson);
}
```

Увидим ожидаемое:
```
true
User(name: Bob, age: 100)
Json ['name'] is Bob
User(name: Bob, age: 100)
```

Теперь будем разбираться, что ж мы такого написали: 

`import 'package:freezed_annotation/freezed_annotation.dart';` даёт `@freezed`

`part` это Dart фича - можно думать о ней, как о возможности разбить файл на несколько. Почему не `import`? `_Класс` будет как бы приватным внутри файла и импорт не покажет его, а вот `part` покажет

`_$Класс` - это миксин, который нам сгенерируют. `Класс`, который мы делаем изначально будет своего рода API в этот миксин, в котором вся логика и будет происходить. 

`const factory User({required String name, required int age}) = _User;` делает нам сам класс - два именованных поля. У `@freezed` нет требований к тому, чтобы параметры были именованными, можно как угодно

`factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);` добавляет, внезапно, `fromJson(obj)`

### Мутабельность

То, что мы только что сделали дало нам класс. Из нюансов - иммутабельный. То есть в примере выше не получится сделать 

```dart
@freezed 
class User with _$User {

}
var bob = User(name: "Bob", age: 100);
bob.age += 1; // ошибка
```

Если нам все-таки нужна изменяемость: заменяем `@freezed -> @unfreezed`. Рассмотрим для того же `User` с `@unfreezed` вот такую штуку:

```dart
factory User({required final String name, required int age}) =_User;
```

`@unfreezed` даст нам изменяемость, но мы написали `final` возле `name`, поэтому `age` мы сможем менять, а `name` - нет.

### Методы и геттеры

Хотим `.becomeOlder()` для пользователя. Просто так сделать это не получится - нужен хак, он же - приватный конструктор

В класс допишем:

```dart
User._();

void becomeOlder() {
    age += 1;
    print("Im older now");
}
```

Теперь можно сделать 

```dart
void becomeOlderExample() {
  final bob = User(name: "Bob", age: 10);
  bob.becomeOlder();
  print("Bob is now ${bob.age}");
}
```
И увидеть, соответственно

```
Im older now
Bob is now 11
```

Тут, конечно, требуется пояснение: зачем мы это делали. Говоря грубо, за нас генерируется не самая тривиальная иерархия классов (см. `file_name.freezed.dart`) и когда мы сами не делаем приватный конструктор, генератор не создаем его за нас в одном из классов, что потом поломает нам доступ к полям класса. Короче говоря, хотим метод - добавляем приватный конструктор и всё тут.

### .copyWith()

В простом случае всё снова понятно: 

```dart
void copyWithExample() {
  final bob = User(name: "Bob", age: 10);
  print(bob); // User(name: Bob, age: 10)
  final notBob = bob.copyWith(age: 12);
  print(notBob); // User(name: Bob, age: 12)
  notBob.age += 2;
  print(bob); // User(name: Bob, age: 10)
  print(notBob); // User(name: Bob, age: 14)
  final alice = notBob.copyWith(name: "Alice");
  print(alice); // User(name: Alice, age: 14)
}
```

Но на самом деле это более сильный инструмент: когда `freezed` класс содержит другие `freezed` классы в качестве полей - можно копировать его с заменой поля у внутреннего объекта. Можно посмотреть на это [тут](https://pub.dev/packages/freezed#going-further-deep-copy)

*Ремарка:* freezed содержит еще несколько крутых фичей (см. [документацию](https://pub.dev/packages/freezed)), но они очень специфичны и как будто overkill, который идейно будет перегружать код

## Вместо заключения

Решения, очевидно, разные. Кажется, их можно комбинировать по необходимости: нужно только `==` - Equatable, нужно что-то больше - Freezed.

Будет интересно посмотреть на комбинацию Injectable + Freezed в виде задачи!