import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'restroom_detail_screen.dart';
import 'add_restroom_screen.dart';

class RestroomScreen extends StatefulWidget {
  @override
  _RestroomScreenState createState() => _RestroomScreenState();
}

class _RestroomScreenState extends State<RestroomScreen> {
  List restrooms = [];
  List filteredRestrooms = [];
  String searchTerm = '';

  @override
  void initState() {
    super.initState();
    fetchRestrooms();
  }

  Future<void> fetchRestrooms() async {
    final url = Uri.parse('https://www.refugerestrooms.org/api/v1/restrooms');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        restrooms = data.map((restroom) {
          return {
            'name': restroom['name'],
            'street': restroom['street'],
            'city': restroom['city'],
            'state': restroom['state'],
            'country': restroom['country'],
            'latitude': restroom['latitude'],
            'longitude': restroom['longitude'],
            'directions': restroom['directions'],
            'comment': restroom['comment'],
            'created_at': restroom['created_at'],
            'updated_at': restroom['updated_at'],
            'accessible': restroom['accessible'],
            'changing_table': restroom['changing_table'],
            'unisex': restroom['unisex'],
            'upvote': restroom['upvote'],
            'downvote': restroom['downvote'],
          };
        }).toList();
        filteredRestrooms = restrooms;
      });
    } else {
      throw Exception('Failed to load restrooms');
    }
  }

  void searchRestrooms(String query) {
    setState(() {
      searchTerm = query.toLowerCase();
      filteredRestrooms = restrooms
          .where((restroom) =>
              restroom['name'].toString().toLowerCase().contains(searchTerm) ||
              restroom['city'].toString().toLowerCase().contains(searchTerm) ||
              restroom['directions'].toString().toLowerCase().contains(searchTerm))
          .toList();
    });
  }

  void navigateToAddRestroom() async {
    final newRestroom = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddRestroomScreen()),
    );

    if (newRestroom != null) {
      setState(() {
        restrooms.add(newRestroom);
        filteredRestrooms.add(newRestroom);
      });
    }
  }

  void navigateToRestroomDetails(Map restroom) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RestroomDetailScreen(restroom: restroom)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restroom Finder'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: searchRestrooms,
              decoration: const InputDecoration(
                labelText: 'Search Restrooms',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Restrooms',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            filteredRestrooms.isEmpty
                ? const Center(child: Text('No restrooms found.'))
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: filteredRestrooms.length,
                    itemBuilder: (context, index) {
                      final restroom = filteredRestrooms[index];
                      final upvotes = restroom['upvote'] ?? 0;
                      final downvotes = restroom['downvote'] ?? 0;

                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ListTile(
                          title: Text(restroom['name'] ?? 'Unknown Name'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${restroom['street']}, ${restroom['city']}\nDirections: ${restroom['directions'] ?? 'Not provided'}'),
                              Row(
                                children: [
                                  const Icon(Icons.thumb_up, color: Colors.green),
                                  const SizedBox(width: 4),
                                  Text('$upvotes'),
                                  const SizedBox(width: 16),
                                  const Icon(Icons.thumb_down, color: Colors.red),
                                  const SizedBox(width: 4),
                                  Text('$downvotes'),
                                ],
                              ),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (restroom['accessible'])
                                const Icon(Icons.accessible, color: Colors.green),
                              if (restroom['changing_table'])
                                const Icon(Icons.baby_changing_station, color: Colors.blue),
                              if (restroom['unisex'])
                                const Icon(Icons.transgender, color: Colors.purple),
                            ],
                          ),
                          isThreeLine: true,
                          onTap: () => navigateToRestroomDetails(restroom),
                          contentPadding: const EdgeInsets.all(10.0),
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToAddRestroom,
        child: const Icon(Icons.add),
      ),
    );
  }
}
