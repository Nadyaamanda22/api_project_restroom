import 'package:flutter/material.dart';
class AddRestroomScreen extends StatefulWidget {
  const AddRestroomScreen({super.key});

  @override
  _AddRestroomScreenState createState() => _AddRestroomScreenState();
}

class _AddRestroomScreenState extends State<AddRestroomScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  final TextEditingController directionsController = TextEditingController();
  final TextEditingController commentController = TextEditingController();
   final TextEditingController createdatController = TextEditingController();

  bool accessible = false;
  bool changingTable = false;
  bool unisex = false;

  void addRestroom() {
    if (_formKey.currentState!.validate()) {
      final newRestroom = {
        'name': nameController.text,
        'street': streetController.text,
        'city': cityController.text,
        'state': stateController.text,
        'country': countryController.text,
        'latitude': latitudeController.text,
        'longitude': longitudeController.text,
        'directions': directionsController.text,
        'accessible': accessible,
        'changing_table': changingTable,
        'unisex': unisex,
        'created_at': DateTime.now().toIso8601String(), 
    'updated_at': DateTime.now().toIso8601String(), 
      };
      Navigator.pop(context, newRestroom); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Restroom'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Restroom Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter restroom name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: streetController,
                decoration: const InputDecoration(labelText: 'Street'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter street';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: cityController,
                decoration: const InputDecoration(labelText: 'City'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter city';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: stateController,
                decoration: const InputDecoration(labelText: 'State'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter state';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: countryController,
                decoration: const InputDecoration(labelText: 'Country'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter country';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: latitudeController,
                decoration: const InputDecoration(labelText: 'Latitude'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter latitude';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: longitudeController,
                decoration: const InputDecoration(labelText: 'Longitude'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter longitude';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: directionsController,
                decoration: const InputDecoration(labelText: 'Directions'),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(Icons.accessible, color: Colors.green),
                  const SizedBox(width: 8),
                  const Text('Accessible'),
                  const Spacer(),
                  Switch(
                    value: accessible,
                    onChanged: (value) {
                      setState(() {
                        accessible = value;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.baby_changing_station, color: Colors.blue),
                  const SizedBox(width: 8),
                  const Text('Changing Table'),
                  const Spacer(),
                  Switch(
                    value: changingTable,
                    onChanged: (value) {
                      setState(() {
                        changingTable = value;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.transgender, color: Colors.purple),
                  const SizedBox(width: 8),
                  const Text('Unisex'),
                  const Spacer(),
                  Switch(
                    value: unisex,
                    onChanged: (value) {
                      setState(() {
                        unisex = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: addRestroom,
                child: const Text('Add Restroom'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}