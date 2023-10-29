import 'package:flutter/material.dart';

class DismissibleHome extends StatefulWidget {
  const DismissibleHome({super.key});

  @override
  State<DismissibleHome> createState() => _DismissibleHomeState();
}

class _DismissibleHomeState extends State<DismissibleHome> {
  Widget _buildListElem(int index) => ListTile(
        title: Text(trips[index].title),
        subtitle: Text(trips[index].location),
        leading: const Icon(Icons.flight),
        trailing: const Icon(Icons.fastfood),
      );
  Widget _buildCompleteTrip() => Container(
        color: Colors.green,
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(
                Icons.done,
                color: Colors.white,
              ),
            ],
          ),
        ),
      );

  Widget _buildRemovedTrip() => Container(
        color: Colors.red,
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Dismissible widget"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: ListView.builder(
            itemCount: trips.length,
            itemBuilder: (ctx, idx) => Dismissible(
              key: Key(trips[idx].id.toString()),
              background: _buildCompleteTrip(),
              secondaryBackground: _buildRemovedTrip(),
              onDismissed: (dir) {
                if (dir == DismissDirection.startToEnd) {
                  _markTripComplete();
                } else {
                  _deleteTrip();
                }
                setState(() {
                  trips.removeAt(idx);
                });
              },
              child: _buildListElem(idx),
            ),
          ),
        ),
      );
  void _markTripComplete() {}
  void _deleteTrip() {}
}

class Trip {
  final int id;
  final String title;
  final String location;
  const Trip(this.id, this.title, this.location);
}

List<Trip> trips = [
  const Trip(0, "lol", "kek"),
  const Trip(1, "title", "location"),
  const Trip(2, "name", "to")
];
