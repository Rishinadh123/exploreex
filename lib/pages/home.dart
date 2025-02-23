import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _destinations = [
    "Paris, France",
    "Tokyo, Japan",
    "New York, USA",
    "Rome, Italy",
    "Sydney, Australia",
    "Cairo, Egypt",
    "Rio de Janeiro, Brazil",
    "London, UK",
  ];

  List<String> _filteredDestinations = [];

  @override
  void initState() {
    super.initState();
    _filteredDestinations = List.from(_destinations);
  }

  void _filterDestinations(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredDestinations = List.from(_destinations);
      } else {
        _filteredDestinations = _destinations
            .where((destination) =>
            destination.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel Guide'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterDestinations,
              decoration: InputDecoration(
                hintText: "Search for destinations...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredDestinations.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.location_on, color: Colors.red),
                    title: Text(_filteredDestinations[index]),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Handle navigation to destination details
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
