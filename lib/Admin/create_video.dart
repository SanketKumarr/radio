import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:radio_lnct/Admin/create_post.dart';
import 'package:uuid/uuid.dart';
import 'package:video_player/video_player.dart';

final videoRef = FirebaseFirestore.instance.collection('videos');
String videoId = Uuid().v4();

class CreateVideo extends StatefulWidget {
  const CreateVideo({Key? key}) : super(key: key);

  @override
  _CreateVideoState createState() => _CreateVideoState();
}

class _CreateVideoState extends State<CreateVideo> {
  File? video;
  TextEditingController captionController = TextEditingController();
  late VideoPlayerController vidController;
  bool isUploading = false;
  String videoId = Uuid().v4();
  late final PlatformFile file;

  handleChooseFromGallery() async {
    final video = await FilePicker.platform.pickFiles(
      type: FileType.video,
      // allowedExtensions: ['mp4'],
    );
    if (video == null) {
      return;
    }
    file = video.files.first;
    // openFile(file);
    final videoTemp = File(file.path as String);

    setState(() {
      this.video = videoTemp;
    });
    // final path = audio.paths;
    print('Path: ${file.path}');
  }

  clearVideo() {
    setState(() {
      video = null;
    });
  }

  uploadVideo(videoFile) async {
    UploadTask uploadTask =
        storageRef.child("video_$videoId.mp4").putFile(videoFile);
    TaskSnapshot storageSnap = await uploadTask.whenComplete(() {});
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }

  createPostInFirestore(
      {required String videoUrl, required String description}) {
    videoRef.add({
      "videoId": videoId,
      "videoUrl": videoUrl,
      "description": description,
      "createdAt": FieldValue.serverTimestamp(),
    });
  }

  handleSubmit() async {
    setState(() {
      isUploading = true;
    });
    String videoUrl = await uploadVideo(video);
    createPostInFirestore(
      videoUrl: videoUrl,
      description: captionController.text,
    );
    captionController.clear();
    setState(() {
      video = null;
      isUploading = false;
      videoId = Uuid().v4();
    });
  }

  uploadForm() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            clearVideo();
          },
        ),
        title: Text(
          "Caption Post",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            isUploading ? LinearProgressIndicator() : Text(""),
            Container(
              height: 220,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Center(
                child: Text(
                  file.name,
                  style: TextStyle(
                    color: Color(0xff242a54),
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ListTile(
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  width: 250,
                  child: TextField(
                    controller: captionController,
                    // maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "Write a caption...",
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            MaterialButton(
              child: Text(
                "Post",
              ),
              onPressed: () {
                handleSubmit();
              },
              color: Color(0xff242a54),
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  buildSplashScreen() {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          child: Text("Create video"),
          textColor: Colors.white,
          color: Color(0xff242a54),
          onPressed: () => handleChooseFromGallery(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return video == null ? buildSplashScreen() : uploadForm();
  }
}

buildSplashScreen() {}
