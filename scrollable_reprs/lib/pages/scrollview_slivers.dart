import 'package:flutter/material.dart';

class ScrollViewSliversPage extends StatelessWidget {
  const ScrollViewSliversPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.grid_on),
            onPressed: () {
              print("kek");
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.view_list),
              onPressed: () {},
            ),
          ],
          title: const Text(
            "Scroll View Custom Slivers",
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: const CustomScrollView(
          slivers: [
            SliverAppBarWidget(),
            SliverListWidget(),
            SliverGridWidget()
          ],
        ),
      );
}

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) => const SliverAppBar(
        backgroundColor: Colors.transparent,
        forceElevated: true,
        expandedHeight: 250.0,
        flexibleSpace: FlexibleSpaceBar(
          title: Text(
            "Parallax",
            style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
                decorationColor: Colors.black),
          ),
          centerTitle: true,
          background: Image(
            image: AssetImage("assets/images/mountains.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
      );
}

class SliverListWidget extends StatelessWidget {
  const SliverListWidget({super.key});

  @override
  Widget build(BuildContext context) => SliverList(
      delegate: SliverChildListDelegate(List.generate(
          10,
          (index) => ListTile(
                leading: CircleAvatar(
                    backgroundColor: Colors.lightGreen,
                    foregroundColor: Colors.white,
                    child: Text("$index")),
                title: Text("Tile $index"),
                subtitle: Text("Subtitle $index"),
                trailing: const Icon(Icons.star_border),
              ))));
}

class SliverGridWidget extends StatelessWidget {
  const SliverGridWidget({super.key});

  @override
  Widget build(BuildContext context) => SliverSafeArea(
          sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) => Card(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.child_friendly,
                      size: 48.0,
                      color: Colors.amber,
                    ),
                    const Divider(),
                    Text("Grid card $index")
                  ],
                )),
            childCount: 12),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      ));
}
