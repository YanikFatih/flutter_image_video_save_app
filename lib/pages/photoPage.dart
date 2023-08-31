import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PhotoPage extends StatefulWidget {
  const PhotoPage({super.key});

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  XFile? _image;
  var imagePath;

  void initState(){
    super.initState();
    LoadImage();
  }

  PickImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
      imagePath = _image?.path;
    });
  }

  SaveImage(path) async {
    SharedPreferences saveImage = await SharedPreferences.getInstance();
    saveImage.setString('image', path);
  }

  LoadImage() async {
    SharedPreferences saveImage = await SharedPreferences.getInstance();
     setState(() {
       imagePath =  saveImage.getString('imagePath');
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.add_photo_alternate_outlined),
        backgroundColor: Colors.grey[300],
        title: const Text(
          "Save Image",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(_image != null)
            CircleAvatar(
              backgroundImage: FileImage(File(_image!.path)) ,
              radius: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton.icon(
                    onPressed: PickImage,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 50),
                      backgroundColor: Colors.grey[400],
                      foregroundColor: Colors.black
                    ),
                icon: const Icon(Icons.add_photo_alternate),
                label: const Text(
                  'Pick Image',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () {
                    SaveImage(_image!.path);
                  },
                  child: Text('SAVE'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    foregroundColor: Colors.black
                  ),
                ),

            )
          ],
        ),
      ),
    );
  }


}
