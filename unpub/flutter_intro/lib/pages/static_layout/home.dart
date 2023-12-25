import 'package:flutter/material.dart';
import 'package:flutter_intro/pages/static_layout/form_validation.dart';
import 'package:flutter_intro/pages/static_layout/todomenu.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
        flexibleSpace: const SafeArea(
          child: Icon(
            Icons.photo_camera,
            size: 100.0,
            color: Colors.black,
          ),
        ),
        bottom: const ToDoMenuWidget(),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: ColumnWidget(), //columnWidget
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          print("PLAY!");
        },
        icon: const Icon(Icons.play_arrow_sharp),
        label: const Text("Play"),
        backgroundColor: Colors.lightGreen.shade100,
      ),
      bottomNavigationBar: BottomAppBar(
        height: 50,
        notchMargin: 10.0,
        color: Colors.lightGreen.shade100,
        child: const Row(
          children: <Widget>[
            Icon(Icons.pause),
            Icon(Icons.stop),
            Icon(Icons.access_time),
          ],
        ),
      ),
    );
  }
}

class ColumnText extends StatelessWidget {
  final int id;
  const ColumnText(this.id, {super.key});

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.all(10.0), child: Text("Column text $id"));
}

class RowText extends StatelessWidget {
  final int id;

  const RowText(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          "Row text $id",
          textAlign: TextAlign.left,
        ));
  }
}

class OutlinedText extends RowText {
  const OutlinedText(super.id, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        super.build(context),
        const Divider(
          color: Colors.black,
        )
      ],
    );
  }
}

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OutlinedText(1),
        const OutlinedText(2),
        const OutlinedText(3),
        const RowWidget(),
        _buildlButtonBar(),
        _buildImageAndDecorator(context),
        const RowWithTextField(),
        const FormValidation(),
      ],
    );
  }
}

class RowWidget extends StatelessWidget {
  const RowWidget({super.key});

  @override
  Widget build(BuildContext context) => const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [ColumnText(1), ColumnText(2), ColumnText(3)],
      );
}

Widget _buildlButtonBar() => Container(
      color: Colors.white24,
      child: ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.map)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.brush)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.airport_shuttle))
        ],
      ),
    );

Widget _buildImageAndDecorator(BuildContext context) =>
    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      sampleNetworkImage,
      const Text(style: TextStyle(fontSize: 20.0), "< Picture | Decorator >"),
      sampleDecorator(context),
    ]);

Widget sampleNetworkImage = Image.network(
  'https://images.unsplash.com/photo-1503886431344-f3104b82a8be?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80',
  width: 150.0,
);

Widget sampleDecorator(BuildContext context) => Container(
    height: MediaQuery.of(context).size.height * 0.3,
    width: MediaQuery.of(context).size.width * 0.3,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(20.0)),
      color: Colors.orange,
      boxShadow: [
        BoxShadow(
            color: Colors.blue.shade200,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10))
      ],
    ));

class RowWithTextField extends StatelessWidget {
  const RowWithTextField({super.key});

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.grey.shade100, fontSize: 16.0),
            decoration: const InputDecoration(
                labelText: "Label",
                labelStyle: TextStyle(color: Colors.purple),
                border: UnderlineInputBorder()),
          ),
          const Divider(),
          TextFormField(
            decoration: const InputDecoration(labelText: "Enter text"),
          )
        ],
      );
}
