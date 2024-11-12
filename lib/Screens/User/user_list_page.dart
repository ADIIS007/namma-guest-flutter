import 'package:flutter/material.dart';
import 'package:namma_guest/Model/paying_guest_list_model.dart';
import 'package:namma_guest/Screens/User/list_item.dart';

import '../../UI/Elements/SelectionButton.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  double _sizeOfFilterMenu = 0;
  String _searchQuery = '';
  String _selectedRating = '0';
  bool _selectOnlyVerified = false;
  double _selectedDistanceRange = 75.0;
  String _selectedFilter = '0';
  RangeValues _selectedPriceRange = const RangeValues(0.0, 10000.0);
  String _selectedSort = 'N/A';
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
                      onPressed: _onFilterPress,
                      style: ElevatedButton.styleFrom(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Icon(
                        Icons.filter_alt_outlined,
                        color: (_sizeOfFilterMenu == 0) ? Colors.black45 : Colors.deepPurpleAccent,
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
          DraggableScrollableSheet(
              initialChildSize: _sizeOfFilterMenu,
              minChildSize: 0,
              maxChildSize: 0.5,
              builder: (BuildContext context,ScrollController scrollController) {
                return Container(
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(25),
                      border: const Border(
                          top: BorderSide(
                              color: Colors.black
                          )
                      )
                  ),
                  child: ListView(
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text("Sort By"),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                  children: [
                                    SelectionButton(
                                      label: "Popularity",
                                      isSelected: _selectedSort == 'Popularity',
                                    ),
                                    SelectionButton(
                                      label: "Price low to high",
                                      isSelected: _selectedSort == 'Price low to high',
                                    ),
                                    SelectionButton(
                                      label: "Price high to low",
                                      isSelected: _selectedSort == 'Price high to load ',
                                    ),
                                    SelectionButton(
                                      label: "Distance",
                                      isSelected: _selectedSort == 'Distance',
                                    ),
                                    SelectionButton(
                                      label: "Rating",
                                      isSelected: _selectedSort == 'Rating',
                                    ),
                                  ]
                              ),
                            ),
                          ]
                      ),
                      const Divider(
                        color: Colors.black,
                        thickness: 2,
                        indent: 20,
                        endIndent: 20,
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text("Rating"),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                  children: [
                                    SelectionButton(
                                      label: "1+",
                                      isSelected: _selectedSort == '1+',
                                    ),
                                    SelectionButton(
                                      label: "2+",
                                      isSelected: _selectedSort == '2+',
                                    ),
                                    SelectionButton(
                                      label: "3+",
                                      isSelected: _selectedSort == '3+',
                                    ),
                                    SelectionButton(
                                      label: "4+",
                                      isSelected: _selectedSort == '4+',
                                    ),
                                    SelectionButton(
                                      label: "5",
                                      isSelected: _selectedSort == '5',
                                    ),
                                  ]
                              ),
                            ),
                          ]
                      ),
                      const Divider(
                        color: Colors.black,
                        thickness: 2,
                        indent: 20,
                        endIndent: 20,
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text("Select only verified"),
                            Switch(
                                value: _selectOnlyVerified,
                                onChanged: _selectOnlyVerifiedSwitch,
                            )
                          ]
                      ),
                      const Divider(
                        color: Colors.black,
                        thickness: 2,
                        indent: 20,
                        endIndent: 20,
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text("Price ranges"),
                            RangeSlider(
                              values: _selectedPriceRange,
                              min: 0,
                              max: 10000,
                              labels : RangeLabels(
                                '\$${_selectedPriceRange.start.toString()}',
                                '\$${_selectedPriceRange.end.toString()}',
                              ),
                              onChanged: (RangeValues value) {
                                setState(() {
                                  _selectedPriceRange = value;
                                });
                              },
                            ),
                            Text(
                              'Selected Price Range: ${_selectedPriceRange.start.toStringAsFixed(0)} - ${_selectedPriceRange.end.toStringAsFixed(0)}',
                              style: const TextStyle(fontSize: 18),
                            ),
                          ]
                      ),
                      const Divider(
                        color: Colors.black,
                        thickness: 2,
                        indent: 20,
                        endIndent: 20,
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text("Sort By"),
                            Slider(
                              value: _selectedDistanceRange,
                              min: 0,
                              max: 100,
                              label : _selectedDistanceRange.round().toString(),
                              onChanged: (double value) {
                                setState(() {
                                  _selectedDistanceRange = value;
                                });
                              },
                            ),
                            Text(
                              'Selected Distance Range: ${_selectedDistanceRange.toStringAsFixed(0)}',
                              style: const TextStyle(fontSize: 18),
                            ),
                          ]
                      ),
                    ],
                  ),
                );
              }
          )
        ]
      ),
    );
  }

  void _onFilterPress() {
    if(_sizeOfFilterMenu==0) {
      setState(() {
        _sizeOfFilterMenu = 0.4;
      });
    } else {
      setState(() {
        _sizeOfFilterMenu = 0;
      });
    }
  }

  void _selectOnlyVerifiedSwitch(bool value) {
    setState(() {
      _selectOnlyVerified = !_selectOnlyVerified;
    });
  }
}
