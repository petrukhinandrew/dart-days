# Введение в Flutter

Снова создаем проект
```bash
~$ flutter create first_flutter_project 
Creating project first_flutter_project...
Resolving dependencies in first_flutter_project... (1.3s)
Got dependencies in first_flutter_project.
Wrote 129 files.

All done!
You can find general documentation for Flutter at: https://docs.flutter.dev/
Detailed API documentation is available at: https://api.flutter.dev/
If you prefer video documentation, consider: https://www.youtube.com/c/flutterdev

In order to run your application, type:

  $ cd first_flutter_project
  $ flutter run

Your application code is in first_flutter_project/lib/main.dart.
```

Попробуйте создать `first-flutter-project`. Предупреждаю, ничего не получится, `"flutter-first-project" is not a valid Dart package name.` - проблема в `-`

## Структура проекта и запуск

Entrypoint:
```dart
// lib/main.dart
import 'package:flutter/material.dart'; // это, собственно, подключение flutter

void main() {
  runApp(const MyApp()); // runApp - метод, который принимает .. Widget
}
```

Запускать можно через 
- `flutter run` 
- `flutter build` + `build/{platform}/.../bundle/{executable}`, где `{platform}` - платформа, под которую собирались (зачем собираться под Mobile, если можно тестироваться на десктопной версии?), а `{executable}` - сам исполняемый файл

На моём linux это выглядит как `build/linux/x64/debug/bundle/first_flutter_project`

Конечно, есть много флагов, собирать релиз или дебаг, собирать только под web, запускать конкретный файл (как это было с dart) и т.д... [документация](https://docs.flutter.dev/platform-integration) вместо тысячи слов

## Всё в Flutter - Widget

Тут две опции. Рассматриваем на примере шаблона, который генерирует Flutter

### StatelessWidget

```dart
class MyApp extends StatelessWidget { // наследуем свой новый виджет от Stateless
  const MyApp({super.key}); // const constructor!

  @override // это обязательный метод, он и строит дерево виджетов
  Widget build(BuildContext context) { 
    return MaterialApp( // это конструктор с именоваными параметрами
      title: 'Flutter Demo',
      theme: ThemeData( // снова конструктор с именоваными параметрами
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), // а тут конструктор еще и именованый
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'), // указали домашнюю страницу
    );
  }
}
```

Нужно понять, что поля у *Stateless* могут быть и могут меняться. Только их изменения не будут заметны, если не делать условный `print()`

### StatefullWidget

```dart
class MyHomePage extends StatefulWidget { // снова наследуем новый виджет
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// если вам тоже лень писать всё это руками
// напишите stles или stful и VSCode сделает работу за вас 

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() { // ВАЖНО 1
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( // ВАЖНО 2
      appBar: AppBar( // ВАЖНО 3
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center( // ВАЖНО 4
        child: Column( // ВАЖНО 5
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

В коде появляются `const`:
    - это всё ещё вычисляется в compile-time
    - Stateful тоже может быть const 
    - можете заглянуть в `analysis_options.yaml` и отключить вечные предложения написать `const`

### Важно 1

Без `setState` Stateful превращается в Stateless. Можно думать про эту штуку как про `notify` для фрэймворка, который форсирует перестраивание виджета

Возникает вопрос: произойдет ли одно и то же.

```dart
// 1
setState(() {_counter++;});

// 2 
_counter++;
setState(() {});
```

Произойдет. 1 - это договоренность. Но лучше не делать тяжелых вычислений в `setState` - это всё-таки дорого

### Важно 2

Про `Scaffold` удобно думать как про страницу приложения: мы добавляем туда меню-полоску `AppBar`, саму страницу приложения в `body: `, кнопка (floatingActionButton), которую видно при запуске справа внизу тоже добавляется в `Scaffold` 

### Важно 3

Удобнее всего знать, что меню-полоска существует и при необходимости читать доки. Посмотрите, что такое `actions,` `leading` и какой у них тип. В кратце - так можно добавлять кнопки в начале и в конце

### Важно 4

```dart
Center(child: ...)
```

Так можно заставить какой-то виджет (который надо передать в `child`) быть по центру 

```dart
Padding(padding: EdgeInsets.all(8.0), child: ...)
```

А так можно сделать 8px отступы со всех сторон вокруг `child`. Посмотрите на `EdgeInsets` внимательно, его придётся часто использовать

### Важно 5

```dart
Column(children: [...])
Row(children: [...])
```

Названия говорящие, но тут вместо одног ребенка можно передавать список: они будут расположены столбцом или строкой соответственно.

Важно, что такие штуки не прокручиваются. [За прокруткой сюда](https://docs.flutter.dev/ui/widgets/scrolling). В частности, пока не хочется заморачиваться, посмотрите на [SingleChildScrollView](https://api.flutter.dev/flutter/widgets/SingleChildScrollView-class.html), он относительно прост в использовании

## Кодлаб без таски - не кодлаб 

Очистим шаблон и сделаем форму (регистрации), к которой прикрутим Firebase позже 

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const AuthApp());
}

class AuthApp extends StatelessWidget {
  const AuthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Demo',
      debugShowCheckedModeBanner: false, // эта штука отключит бирку debug справа сверху
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AuthScreen(),
    );
  }
}

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: AuthForm()));
  }
}
```

Ничего нового тут нет, но остановимся на `Scaffold + SafeArea` и `Placeholder`.

`Placeholder` - это просто штука, которая займет все свободное пространство - Flutter версия Kotlin `TODO()`

Внутрь `Scaffold` мы помещаем `SafeArea` по следующей причине: сейчас есть телефоны с "чёлками", вырезами для камер, есть старые с кнопками внизу и всё это надо поддерживать! Чтобы не позволить Flutter отрисовывать виджеты в области "чёлки" мы и используем `SafeArea`. 

Можно попробовать 

```dart
Scaffold(child: SafeArea(child: Text("Any long string")))
//////
Scaffold(child: Text("Any long string"))
```

Кстати, вы уже могли потеряться в таком числе скобочек. Используйте `Ctrl + Shift + R` и посмотрите, что можно сделать автоматически - это х100500 упрощение работы

## HomeScreen

Сразу добавим на будущее, чтобы показывать, когда человек авторизован

```dart
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: IconButton( // нет const конструктора - поэтому не const 
                    icon: const Icon(Icons.home), // а тут const 
                    iconSize: 128.0,
                    onPressed: () {
                      print("Print is not the solution for debug");
                    }))));
  }
}
```

Можно покликать на кнопку и посмотреть на вывод в консоли. Кстати, если вы по привычке перезапускаете прогу - не надо, есть **hot reload** и **hot restart**. Это как перезапуск, только гораздо быстрее. Разница в том, что первый не сбрасывает состояния, а второй - сбрасывает.

*Ремарка:* можно использовать одну страницу одновременно для логина и регистрации. Вряд ли такое понадобится в наших проектах, поэтому сейчас пилим только авторизацию

## Поле для ввода

Форма начинается с поля для ввода

```dart
TextFormField( // эта штука нарисует поле для ввода текста
  controller: TextEditingController(), // поле пока должно остаться загадкой 
  validator: (value) { 
  // тут нужна функция String? -> String?, которая будет проверять корректность того
  // что напечатал пользователь. Можно явно написать (String? value) 
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    return null;
  },
  obscureText: false, // заменять символы на звездочки или нет
  decoration: InputDecoration( hintText: 'Email' ), // так мы делаем тусклый текст в форме
  // последняя запятая - не баг, а фича. со списками так тоже можно
)
```

Для искушенных - [документация к TextFormField](https://api.flutter.dev/flutter/material/TextFormField-class.html)

## Кнопка

Форму надо как-то "сабмитить" 

```dart
ElevatedButton(
  onPressed: () => print("SUBMIT"), // потом напишем правильную штуку
  child: const Text('Login'), // сам текст кнопки. важно, что это не просто строка, а виджет
)
```

## Соберём эти штуки в кучу 

Тут, по идее, нужно объяснить, зачем вообще нужен `Key`, но проще сказать [вот доки](https://api.flutter.dev/flutter/widgets/Widget/key.html), код тоже приложен, так что копипаст + отсутствие заморочек

```dart
class AuthForm extends StatelessWidget {
  AuthForm({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController(); // пока всё еще не ясно, что это
  final TextEditingController _passwordController = TextEditingController(); // нужна еще капля терпения

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                decoration: const InputDecoration(hintText: 'Email')),
            TextFormField(
                controller: _passwordController,
                validator:
                    (value) => // то же самое, что и выше, только в другом виде
                        (value == null || value.isEmpty)
                            ? 'Please enter your password'
                            : null, // это, кстати, тернарный оператор
                obscuringCharacter: ";", // ; лучше * заменит символы пароля, да же?
                obscureText: true,
                decoration: const InputDecoration(hintText: 'Password')),
            ElevatedButton(
                onPressed: () => print("Submit"), child: const Text("Login"))
          ],
        ));
  }
}
```

Ииии.. ничего не работает. Хотя `Submit` всё-таки печатается. Оно и понятно, кроме `print()` мы ничего не делаем

## Побеждаем форму

Коль скоро наш виджет - это класс, можем добавить ему "приватный" метод

```dart
_handleSubmit() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.value.text;
      final password = _passwordController.value.text;
      print("email: $email, password: $password");
    }
  }
```

и вместо `print("Submit")` вызывать `_handleSubmit()`

Сначала радуемся, потом разбираемся. Hot reload => валидация работает, `print()` данных тоже.

Теперь разбор:

В этой строке должно стать понятнее, зачем нам controller

```dart 
final email = _emailController.value.text;
```

Возможно, позже (не в авторизации) пригодится возможность слушать этот контроллер. Да-да, он умеет делать `.addListener()`

Самое интересное: `_formKey.currentState!.validate()` это такой аггрегатор валидации. Он вызвал на двух текстовых полях `validate`, вернул их ответы еще и поля перерисовал, если не написали ничего

В целом, в `TextFormField` можно добавить `onChanged: (value) => _formKey.currentState!.validate()` и на каждом нажатии в это поле валидировать всю форму

## Итог

Форма сделана, валидируется, а что еще нужно? 

Можно сделать самую малость рефакторинга, нарисовать фон, подобрать цвета и **уменьшить размер полей для ввода**.

*Подсказка:* стоит посмотреть на `SizedBox` (так сказать `Container` на минималках)