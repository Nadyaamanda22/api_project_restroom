import 'package:flutter/material.dart';

class RestroomDetailScreen extends StatelessWidget {
  final Map restroom;

  const RestroomDetailScreen({super.key, required this.restroom});

  String formatDate(dynamic dateInput) {
  try {
    if (dateInput == null) return 'Unknown';
    DateTime parsedDate = DateTime.parse(dateInput);
    
    String day = parsedDate.day.toString().padLeft(2, '0');
    String month = parsedDate.month.toString().padLeft(2, '0');
    String year = parsedDate.year.toString();
    String hour = parsedDate.hour.toString().padLeft(2, '0');
    String minute = parsedDate.minute.toString().padLeft(2, '0');
    
    return "$day/$month/$year $hour:$minute";
  } catch (e) {
    return 'Invalid date';
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restroom['name'] ?? 'Restroom Details'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restroom['name'] ?? 'Restroom Name',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${restroom['street']}, ${restroom['city']}, ${restroom['state']}, ${restroom['country']}',
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Directions: ${restroom['directions'] ?? 'No directions provided'}',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Location',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const Divider(),
                      Text(
                        'Latitude: ${restroom['latitude'] ?? 'Unknown'}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Longitude: ${restroom['longitude'] ?? 'Unknown'}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Icon(
                            restroom['accessible'] ? Icons.accessible : Icons.block,
                            color: restroom['accessible'] ? Colors.green : Colors.red,
                            size: 40,
                          ),
                          const SizedBox(height: 4),
                          const Text('Accessible', style: TextStyle(fontSize: 12)),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            restroom['changing_table'] ? Icons.baby_changing_station : Icons.block,
                            color: restroom['changing_table'] ? Colors.blue : Colors.red,
                            size: 40,
                          ),
                          const SizedBox(height: 4),
                          const Text('Changing Table', style: TextStyle(fontSize: 12)),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            restroom['unisex'] ? Icons.transgender : Icons.block,
                            color: restroom['unisex'] ? Colors.purple : Colors.red,
                            size: 40,
                          ),
                          const SizedBox(height: 4),
                          const Text('Unisex', style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Comments',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const Divider(),
                      Text(
                        restroom['comment'] ?? 'No comments available',
                        style: TextStyle(color: Colors.grey[800]),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.thumb_up, color: Colors.green),
                          const SizedBox(width: 8),
                          Text(
                            'Upvotes: ${restroom['upvote'] ?? 0}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.thumb_down, color: Colors.red),
                          const SizedBox(width: 8),
                          Text(
                            'Downvotes: ${restroom['downvote'] ?? 0}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Timestamps',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const Divider(),
                      Text(
                        'Created At: ${formatDate(restroom['created_at'])}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Updated At: ${formatDate(restroom['updated_at'])}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
