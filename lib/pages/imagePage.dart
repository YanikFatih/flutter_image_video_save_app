import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_video_app/service/db_adapter.dart';
import 'package:image_video_app/service/hive_service.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  DatabaseAdapter databaseAdapter = HiveService();

  void initState(){
    super.initState();
    /*LoadImage();*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: const Text(
          'Image Libary',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
            padding: const EdgeInsets.only(right: 10, left: 10, top: 8),
            child: FutureBuilder<List<Uint8List>?>(
              future: _readImagesFromDatabase(),
              builder: (context, AsyncSnapshot<List<Uint8List>?> snapshot) {
                if (snapshot.hasError) {
                  return Text("Error appeared ${snapshot.error}");
                }

                if (snapshot.hasData) {
                  if (snapshot.data == null) return const Text("Nothing to show");

                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => Image.memory(
                      snapshot.data![index],
                    ),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _pickImage();
        },
        child: Icon(Icons.add, color:Colors.white,),
        backgroundColor: Colors.grey[400],
      ),
    );
  }

  Future<void> _pickImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    Uint8List imageBytes = await image.readAsBytes();
    databaseAdapter.storeImage(imageBytes);
  }

  Future<List<Uint8List>?> _readImagesFromDatabase() async {
    return databaseAdapter.getImages();
  }
}
