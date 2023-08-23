import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: CarouselSliderDashboardScreen()));

class CarouselSliderDashboardScreen extends StatelessWidget {
  final TextEditingController urlController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  void _addImageUrl() async {
    final String imageUrl = urlController.text;
    final String imageDescription = descriptionController.text;
    if (imageUrl.isNotEmpty && imageDescription.isNotEmpty) {
      await FirebaseFirestore.instance.collection('image_urls').add({
        'url': imageUrl,
        'description': imageDescription,
      });
      urlController.clear();
      descriptionController.clear();
    }
  }

  void _deleteImageUrl(String documentId) async {
    await FirebaseFirestore.instance
        .collection('image_urls')
        .doc(documentId)
        .delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildAddImageUrlForm(),
              SizedBox(height: 24),
              Text('Image URLs:'),
              _buildImageList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddImageUrlForm() {
    return Column(
      children: [
        TextField(
          controller: urlController,
          decoration: InputDecoration(labelText: 'Image URL'),
        ),
        SizedBox(height: 16),
        TextField(
          controller: descriptionController,
          decoration: InputDecoration(labelText: 'Image Description'),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: _addImageUrl,
          child: Text('Add Image URL'),
        ),
      ],
    );
  }

  Widget _buildImageList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('image_urls').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        final List<QueryDocumentSnapshot> documents = snapshot.data!.docs;

        return ListView.builder(
          shrinkWrap: true,
          itemCount: documents.length,
          itemBuilder: (context, index) {
            final document = documents[index];
            final imageUrl = document['url'] as String;
            final description = document['description'] as String;
            final documentId = document.id;

            return ListTile(
              title: Text(description),
              subtitle: Text(description),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => _deleteImageUrl(documentId),
              ),
            );
          },
        );
      },
    );
  }
}
