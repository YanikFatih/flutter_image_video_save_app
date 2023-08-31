import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_video_app/pages/addData.dart';
import 'package:video_player/video_player.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  /*PlatformFile? pickedFile;
  String? videoUrl;
  VideoService videoService = VideoService();
  VideoPlayerController? videoPlayerController;*/
  File? _video;
  final picker = ImagePicker();
  VideoPlayerController? videoPlayerController;
  pickVideo() async {
    final video = await picker.pickImage(source: ImageSource.gallery);
    _video = File(video!.path);
    videoPlayerController = VideoPlayerController.file(_video!)..initialize().then((_){
        setState(() {

        });
        videoPlayerController!.play();
      }
    );
  }

  @override
  void dispose() {
    /*videoPlayerController?.dispose();*/
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.menu, color: Colors.black,),
              color: Colors.white,
              itemBuilder: (context){
              return [
                const PopupMenuItem(
                    child: Text("Photos"),
                ),
                const PopupMenuItem(
                  child: Text("Videos"),
                ),
                const PopupMenuItem(
                  child: Text("Voice Notes"),
                ),
              ];
          })
        ],
        title: const Text(
          'Your Libary',
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
          child: ListView.builder(
            itemCount: 4,
            itemBuilder:(BuildContext context, index){
              return ListTile(
                title: Text("video name"),
                subtitle: Text("video description"),
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[400],
                ),
                onTap: (){
                  //detaylı sayfaya yönlendirme
                },
              );
            }
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => addData()));
        },
        child: Icon(Icons.add, color:Colors.white,),
        backgroundColor: Colors.grey[400],
      ),
    );
  }

  /*void pickVid() async {
    videoUrl = videoService.pickVideoFromGallery();
    initializeVideoPlayer();
  }
  void initializeVideoPlayer() {
    videoPlayerController = VideoPlayerController.file(File(videoUrl!))
        ..initialize().then((_){
          setState(() {});
          videoPlayerController!.play();
        });
  }

  Widget videoPreviewWidget() {
    if(videoPlayerController != null) {
      return AspectRatio(
          aspectRatio: videoPlayerController!.value.aspectRatio,
          child: VideoPlayer(videoPlayerController!)
      );
    }else{
      return CircularProgressIndicator(color: Colors.grey[500]);
    }
  }*/
}
