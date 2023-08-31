import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class VoiceNotePage extends StatefulWidget {
  const VoiceNotePage({super.key});

  @override
  State<VoiceNotePage> createState() => _VoiceNotePageState();
}

class _VoiceNotePageState extends State<VoiceNotePage> {

  late Record audioRecord;
  late AudioPlayer audioPlayer;
  bool isRecording = false;
  String audioPath = '';
  late Timer timer;

  @override
  void initState() {
    audioPlayer = AudioPlayer();
    audioRecord = Record();
    super.initState();
  }
  @override
  void dispose() {
    audioRecord.dispose();
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> startRecording() async {
    try{
      if(await audioRecord.hasPermission()){
        await audioRecord.start();
        setState(() {
          isRecording = true;
        });
      }
    }catch(e){
      print("Error Start Recording: $e");
    }
  }

  Future<void> stopRecording() async {
    try{
      String? path = await audioRecord.stop();
      print(path);
      setState(() {
        isRecording = false;
        audioPath = path!;
      });
    }catch(e){
      print("Error Stop Recording: $e");
    }
  }

  Future<void> playRecording() async {
    try{
      Source urlSource = UrlSource(audioPath);
      await audioPlayer.play(urlSource);
    }catch(e){
      print('Error playing record: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.mic_none),
        backgroundColor: Colors.grey[300],
        title: const Text(
          "Record You Voice",
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
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(175, 50),
                backgroundColor: isRecording ? Colors.red : Colors.white,
                foregroundColor: isRecording ? Colors.white : Colors.black,
              ),
              icon: Icon(isRecording ? Icons.stop : Icons.mic),
              label: Text(
                isRecording ? 'Stop' : 'Start',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              onPressed: isRecording ? stopRecording : startRecording,
            ),
            SizedBox(height: 30),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(175, 50),
                backgroundColor: Colors.grey[300],
                foregroundColor: Colors.grey[700]
              ),
              icon: Icon(Icons.play_circle),
              label: Text(
                'Play',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              onPressed: playRecording,
            )
          ],
        ),
      )
    );
  }
}
