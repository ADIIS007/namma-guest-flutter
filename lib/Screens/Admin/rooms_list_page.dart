import 'package:flutter/material.dart';

class RoomsListPage extends StatefulWidget {
  const RoomsListPage({super.key});

  @override
  State<RoomsListPage> createState() => _RoomsListPageState();
}

class _RoomsListPageState extends State<RoomsListPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 40, // Diameter of the circle
              height: 40, // Diameter of the circle
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.purple.shade100, // Background color of the circle
              ),
              child: const Center(
                child: Icon(
                  Icons.home, // Replace with your desired icon
                  color: Colors.purple, // Color of the icon
                  size: 24, // Size of the icon
                ),
              ),
            ),
          ),
          title: const Text('OpenStreetMap Example')),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              PopupMenuButton<String>(
                itemBuilder: (BuildContext context) {
                  return <String>['All', 'Item 1', 'Item 2'].map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.filter_list),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // List View
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: <array>.length,
          //     itemBuilder: (context, index) {
          //       return <List Iten Widget>(model: <arrya>[index]);
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
