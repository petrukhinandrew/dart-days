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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AuthScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Column(children: [
      IconButton(
          icon: const Icon(Icons.home),
          iconSize: 128.0,
          onPressed: () {
            print("Print is not the solution for debug");
          }),
    ]))));
  }
}

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: AuthForm()),
    );
  }
}

class AuthForm extends StatelessWidget {
  AuthForm({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.value.text;
      final password = _passwordController.value.text;
      print("email: $email, password: $password");
    }
  }

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
                expands: false,
                decoration: const InputDecoration(hintText: 'Email')),
            TextFormField(
                controller: _passwordController,
                validator:
                    (value) => // то же самое, что и выше, только в другом виде
                        (value == null || value.isEmpty)
                            ? 'Please enter your password'
                            : null, // это, кстати, тернарный оператор
                obscuringCharacter: ";", // так делать не нужно, но можно
                obscureText: true,
                decoration: const InputDecoration(hintText: 'Password')),
            ElevatedButton(
                onPressed: () => _handleSubmit(), child: const Text("Login"))
          ],
        ));
  }
}
