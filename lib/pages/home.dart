import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_video_app/pages/imagePage.dart';
import 'package:image_video_app/pages/voiceNotePage.dart';
import 'package:video_player/video_player.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  void dispose() {
    /*videoPlayerController?.dispose();*/
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: const Text(
          "Add to Your Library",
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
          children: [
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ImagePage()));
              },
              child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[400],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Icon(Icons.add_photo_alternate, size: 60),
                        SizedBox(height: 5),
                        Text('Photo'),
                      ],
                    ),
                  )
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: (){

              },
              child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[400],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Icon(Icons.video_call_rounded, size: 60),
                        SizedBox(height: 5),
                        Text('Video'),
                      ],
                    ),
                  )
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => VoiceNotePage()));
              },
              child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[400],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Icon(Icons.mic_none_rounded, size: 60),
                        SizedBox(height: 5),
                        Text('Voice'),
                      ],
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
