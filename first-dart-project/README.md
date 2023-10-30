# Введение в Dart

Консольные команды выполняются на `Linux`, на `Windows` `MacOS` отличий быть не должно

Через `~$` будем обозначать команды, которые выполняем

## Узнаем один раз (и больше так не делаем)

Dart умеет запускать любой файл: создадим руками файл `lol.dart` в произвольном месте и напишем туда 
```dart
void main() => print("kek");
```
Затем запустим `dart run lol.dart` и увидим вывод `kek`

## Создаём проект (так делаем)

```bash
~$ dart create first-dart-project

Creating first_dart_project using template console...

  .gitignore
  analysis_options.yaml
  CHANGELOG.md
  pubspec.yaml
  README.md
  bin/first_dart_project.dart
  lib/first_dart_project.dart
  test/first_dart_project_test.dart

Running pub get...                     4.1s
  Resolving dependencies...
  Changed 46 dependencies!

Created project first_dart_project in first-dart-project! In order to get started, run the following commands:

cd first-dart-project
dart run

~$ cd first-dart-project
~$ dart run 

Building package executable... 
Built first_dart_project:first_dart_project.
Hello world: 42!
```

Можно почитать подробнее про [структуру Dart проекта](https://dart.dev/tools/pub/package-layout), но пока важно следующее: 
- Dart файлы не используют `-` в названиях. Только `_`. 
- Entrypoint - функция `void main()`. Она находится в `bin/first_dart_project.dart` (да, вместо `dart run` можно было бы запустить конкретно этот файл)
- Функцию `calculate` импортируем из `lib/first_dart_project.dart`
- Есть тесты - `test/first_dart_project.dart`. Можно запустить через `dart test`. Хотя кто вообще что-то тестирует

## Entrypoint и `=>`

Мы увидели несколько вариантов 
```dart
void main() {
    ... 
}

void main(List<String> arguments) {
    ...
}

void main() => ...;
```

Первые два варианта должны напомнить `C/C++`. Последний - `Kotlin` (там `=` вместо `=>`)

Сразу отметим: в `Kotlin` функция по умолчанию возвращает `Unit`. В `Dart` - `null`.

## Code style

Для текущего `кодлаба` будет достаточно того, что *по кодстайлу* файлы/пакеты называются в `snake_case.dart`, классы - `UpperCamelCase`, функции и переменные - `lowerCamelCase`. Тем не менее, стоит ознакомиться с [Effective Dart](https://dart.dev/effective-dart) - это официальный набор правил/требований к стилю кода и документации.

*Фича:* у Dart и Flutter крутые расширения для VSCode (можно вообще запускаться для десктопа, а потом один раз проверить для мобильной платформы). `Ctrl + Shift + I` можно использовать для автоформатирования, но на каждом сохранении это должно работать автоматически. Еще, если совсем не хочется читать доки, жмите `Ctrl+Space` - VSCode предложит, что можно написать.

## Примитивные типы и переменные

Есть `String, int, double`. Всё. Никаких `char, float, i32, i64, short` и прочего. Ну `dynamic` ещё есть

```dart
String greeting = "Hello, World"; // прямо как в C/C++, даже обязательная точка с запятой
// это, кстати, комментарий
greeting += '!'; // любые кавычки сработают

/// а это уже документация <= три слэша
int documentedInt = 0;

++documentedInt; // больше C-подобия

var inferredDouble = 3.14; // а тут как в Kotlin, тип будет выведен автоматически

dynamic helloPython = "hello from python"; // Да, тут есть динамическая типизация
helloPython = 2.71;
```

Ещё существует `num`, как интерфейс, который реализуют `double` и `int`, можно делать 

```dart 
num x = 9.0;
x += 1;
```

Но свои нюансы, конечно, есть

Операторы привычные: `+=, -=, %=, ++ ...`. `/=` **не сработает** для целых. Для целых `~/` и `~/=`



Type-cast'ы как в Kotlin: `(0.5).toInt()`, `5.toDouble()`. Неявных преобразований нет.

## Nullability

В Dart 3 сделали sound-null. Проще говоря, тут как в Kotlin:
```dart
var notNullInt = 5;
notNullInt = null; // не получится

int? nullableInt = 0;
nullableInt = null; // получится
```

Тип `T` не может быть `null`. `T?` - может.

Детали, касты и т.д. будут рассмотрены далее.

## `const` vs `final`

Все любят иммутабельность: 

```dart
final immutableInt = 123; // тип снова выведен автоматически
const immutableString = "You shall not change me!";
```

Разница в том, что в `const` значение должно быть известно до компиляции, а `final` просто нельзя изменять (Kotlin `val`!) 

## Функции

Опять C. 

```dart
int myFirstIntFunction(int intArg, double doubleArg) {
    return intArg + doubleArg.toInt();
}

double myDoubleFunc(int x = 0) => x.toDouble(); // без явного приведения типа ничего бы не вышло, x все-таки не double
print(myDoubleFunc()); // напечатает 0.0 как значение по умолчанию
```

Что-то Dart все-таки должен был привнести. И привнёс. Больше скобок (где-то радуется команда MPL разработчиков)

```dart
int couldBeChanged(int a, [int b = 0]) => a + b;
print(couldBeChanged(5));
print(couldBeChanged(5, 10));
```

Это указание на то, что `b` - необязательный параметр. Так как тип `b` - не nullable, надо написать значение по умолчанию. Можно было бы сделать `int couldBeChanged(int a, [int? b]) => ...;` - тогда по умолчанию `b == null` и такой случай нужно обрабатывать.

**Flutter-must-have**

Можно заставить программистов именовать аргументы функций!

```dart
int notNamedArgument(int argName) {
    ... 
}

int namedArgument({int? argName}) {
    ... 
}

notNamedArgument(100500);
namedArgument(argName: 100500);

namedArgument(100500); // ошибка
notNamedArgument(argName: 100500); // ошибка
```

Предположим, хочется всё сразу:
    - именовать аргумент
    - не задавать значение по умолчанию 
    - чтобы этот аргумент был не null

`required`!

```dart
int namedArgNotNull({required int x}) => x + 1;

namedArgNotNull(x: 5); // OK
namedArgNotNull(x: null); // ошибка
namedArgNotNull(5); // ошибка
```

### Порядок аргументов

Можно 'смешать' одни скобки и переменные без скобок: 

```
void someFunc(arg1, arg2, ..., [argk, ...])
void someFunc(arg1, arg2, ..., {argk, ...})
void someFunc(arg1, arg2, ..., argn)
void someFunc({arg1, arg2, ..., argn})
```

Нельзя сделать что-то вроде `void someFunc(arg1, [arg2], {arg3})`

**Обязатеьно:** сначала аргументы без скобок, потом в скобках

## Коллекции 

### List, Set, Map

Начало привычное

```dart
var list = [1, 2, 3];
assert(list.length == 3);
assert(list[1] == 2);

List<int> constantList = const [1, 2, 3]; // compile-time константа

var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};

var elements = <String>{}; // Пустой set строк
elements.add('fluorine');

Map<String, String> gifts = { // мапа
  // Key:    Value
  'first': 'partridge',
  'second': 'turtledoves',
};
gifts['fourth'] = 'calling birds'; // вставка
assert(gifts['fifth'] == null); // fifth в мапе нет
assert(gifts.length == 3);
```

### Фичи

То, что назвыается control-flow operator

```dart
var list = [1, 2, 3];
var list2 = [0, ...list]; // вставка 0 в начало
var list3 = [0, ...?list4] // [0]

assert(list2.length == 4);
```

Больше python-like штук

```dart
var listOfInts = [1, 2, 3];
var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
assert(listOfStrings[1] == '#1');

var lolOrKek = ['Lol', 'Or', if (true) 'Kek']; // kek не было бы, если бы был false
```

### Если мало базовых коллекций

Есть `import 'dart:collection';`, там в том числе есть `HashMap`, `HashSet` и удобные привычные функции для обычных коллекций

## Enum

В привычном смысле - они есть

```dart
enum Color { red, green, blue }

final favoriteColor = Color.blue;

if (favoriteColor == Color.blue) {
  print('Your favorite color is blue!');
}

assert(Color.red.index == 0);
assert(Color.green.index == 1);
assert(Color.blue.index == 2);
```

В непривычном смысле - они тоже есть:

```dart
enum Vehicle implements Comparable<Vehicle> {
  car(tires: 4, passengers: 5, carbonPerKilometer: 400),
  bus(tires: 6, passengers: 50, carbonPerKilometer: 800),
  bicycle(tires: 2, passengers: 1, carbonPerKilometer: 0);

  const Vehicle({
    required this.tires,
    required this.passengers,
    required this.carbonPerKilometer,
  });

  final int tires;
  final int passengers;
  final int carbonPerKilometer;

  int get carbonFootprint => (carbonPerKilometer / passengers).round();

  bool get isTwoWheeled => this == Vehicle.bicycle;

  @override
  int compareTo(Vehicle other) => carbonFootprint - other.carbonFootprint;
}
```

Про такое лучше читать в [документации](https://dart.dev/language/enums)

## ООП

Тут будут разобраны самые нужные фичи. 

Если очень хочется `abstract base mixin class` - [читать тут](https://dart.dev/language/class-modifiers). Как сказал один из разработчиков Dart в Podlodka Podcast: 
    
    Пока у вас в команде не 500 программистов или вашей либой не пользуются миллион человек - оно вам не надо.

```dart
class MyFirstClass {
    // просто класс
}
abstract class MyAbstractClass {
    // абстрактный
    // может не иметь реализаций
}
interface class MyInterface {
    // интерфейс
}
```

*Размахивая руками*

Хотим, чтобы А расширял B

```dart
class B {
    void foo() {
        ...
    }
}
class A extends B {
    @override
    void foo() {
        super.foo();
        ...
    }
}
```

Хотим, чтобы А реализовал B

```dart
class B {
    void foo() {
        ...
    }
}
class A implements B {
    @override
    void foo() {
        ... // super.foo() не будет
    }
}
```

*Кажется*, судя по [документации](https://api.dart.dev/be/137507/dart-core/override-constant.html), `@override` - необязательная штука и без нее код должен работать, но тогда в случае наследования ребенок может использовать метод родителя (чего Вам как программистам, конечно, не хочется)

Детали лучше [читать тут](https://dart.dev/language/classes)

### Конструктор

Следующий кусок кода **работать не будет**

```dart
class A {
    int field;    
    A(int newField) { // это конструктор
        field = newField;
    } 
}
```

Можно, но **не нужно**

```dart
class A {
    late int field;    
    
    A(int newField) { 
        field = newField;
    } 
}
```

Можно и **нужно**
```dart
class A {
    int field;    
    A(this.field); 
}
```

В Flutter может пригодиться
```dart
class A {
    int field;    
    A({required this.field});
}
```

### Больше иммутабельности

```dart
class A {
    final int field;    
    const A(this.field); // const constructor!
}

// Теперь можно сделать 
final finalInstanceOfA = const A(5);

// Или просто

var instanceOfA = A(5);
```

## Перегрузки и secondary-конструкторы

Перегрузок методов в Dart нет

```dart
class A {
    void kek(int x) {
        ...
    }
    void kek(double k) { // не kek :(
        ...
    }
}
```

Перегрузки операторов есть, 
```dart
class A {
  
  @override
  bool operator ==(Object other) {
    return false;
  }

}
```
Dart сам предложит `@override` функции `hashCode`


Secondary конструкторов, соответственно, тоже. Но...

```dart
class A {
    late int field;

    A(this.field);

    A.byDouble(double value) {
        field = value.toInt();
    }
}
var howAreYou = A.byDouble(0.5);
```

То же самое можно сделать так: 

```dart
class A {
  int field;

  A(this.field);
  A.byDouble(double value) : field = value.toInt(); // больше C++!
}
```

Это называется **именованый конструктор**. Их может быть сколько угодно

Про другие фичи конструкторов (в том числе переипользование родительских полей и фабрики) [читать тут](https://dart.dev/language/constructors)

## Модификаторы видимости

`static` есть

```dart
class A {
   static void foo() {
    ...
   }
}

A.foo();
```

`private` нет, зато `_` ограничит область видимости до класса/файла

```dart
class A {
    int _x; // видим только внутри А
    void _foo() { // видима только внутри A
    ...
    }
}

var aInstance = A();
aInstance._foo(); // так не получится
```

Спойлер: можно сделать глобальную переменную (как в C/C++) и использовать из другого файла (который нужно импортировать). Но если назвать её `_varName` - она будет видима только в файле, где объявлена. 


## Геттеры

Мотивация - хотим `myClassInstance.value` недоступный для записи, но доступный для чтения

```dart
class A {
  final int _x = 0; // приватное поле
  int get x => _x; // то же поле, доступное только для чтения
}
```

## Что дальше

1. Посмотреть и позапускать файлики в `lib`. Там показаны еще разные фичи!
2. Написать код в `collections.dart`
3. Для Flutter пригодятся `async/await`, `Stream`, `pubspec.yaml` - о них в соответствующем `кодлабе`
4. Читать [роскошную документацию](https://dart.dev/guides). Чего там можно найти? 
    - в Dart как в Kotlin есть функции-расширения
    - есть `mixin class`
    - `switch () {}` - не Haskell pattern-matching, но и не C++ `switch`
    - организация файлов в библиотеки, `show`, `export`
    - тестирование
    - [Effective Dart](https://dart.dev/effective-dart)