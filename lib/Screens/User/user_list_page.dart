import 'package:flutter/material.dart';
import 'package:namma_guest/Model/paying_guest_list_model.dart';
import 'package:namma_guest/Screens/User/list_item.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  String _searchQuery = '';
  String _selectedFilter = 'All';
  final List<PayingGuestListModel> _items = List.generate(100, (index) =>
    PayingGuestListModel(
      name: 'Item $index',
      rating: index % 5 + 1.0,
      isVerified: index % 2 == 0,
      distance: index * 0.1,
      guestType: index % 3 == 0 ? 'PG' : 'ROOMS',
    )
  );
  List<PayingGuestListModel> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = _items;
  }

  void _filterItems(String query) {
    setState(() {
      _searchQuery = query;
      _filteredItems = _items
          .where((item) =>
      item.name.toLowerCase().contains(query.toLowerCase()) &&
          (_selectedFilter == 'All' || item.name.contains(_selectedFilter)))
          .toList();
    });
  }

  void _selectFilter(String filter) {
    setState(() {
      _selectedFilter = filter;
      _filterItems(_searchQuery);
    });
  }

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
          title: const Text('OpenStreetMap Example')
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: _filterItems,
                        decoration: const InputDecoration(
                          hintText: 'Search...',
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: _onFilterPress(),
                      style: ElevatedButton.styleFrom(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Icon(
                        Icons.filter_alt_outlined,
                        color: Colors.black45,
                      )
                  )
                ],
              ),
              // List View
              Expanded(
                child: ListView.builder(
                  itemCount: _filteredItems.length,
                  itemBuilder: (context, index) {
                    return ListGuestItem(model: _filteredItems[index]);
                  },
                ),
              ),
            ],
          ),
        ]
      ),
    );
  }

  _onFilterPress() {}
}
