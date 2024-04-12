import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ManagerServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Services'),
      ),
      body: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('services').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Center(child: Text('No services found'));
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var service = snapshot.data!.docs[index];
                    return ListTile(
                         leading: CircleAvatar(
        backgroundImage: NetworkImage(service['photo']), // Load image from URL
      ),
                      title: Text(service['name']),
                      subtitle: Text('Duration: ${service['duration']}, Price: \$${service['price']}'),
                      // Display more fields as needed
                    );
                  },
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
             
               Navigator.pushNamed(context, "/add_service_page");
              },
              child: Text('Create Service'),
            ),
          ),
        ],
      ),
    );
  }
}


