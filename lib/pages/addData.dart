import 'dart:io';
import 'dart:typed_data';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_video_app/pages/photoPage.dart';
import 'package:image_video_app/pages/voiceNotePage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:record/record.dart';
import 'package:audioplayers/audioplayers.dart';

class addData extends StatefulWidget {
  const addData({super.key});

  @override
  State<addData> createState() => _addDataState();
}

class _addDataState extends State<addData> {

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
                Navigator.push(context, MaterialPageRoute(builder: (context) => PhotoPage()));
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
