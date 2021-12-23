import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

import 'package:radio_lnct/Admin/create_post.dart';
import 'package:uuid/uuid.dart';

final interviewRef = FirebaseFirestore.instance.collection('interview');
String interviewId = Uuid().v4();

class CreateInterview extends StatefulWidget {
  const CreateInterview({Key? key}) : super(key: key);

  @override
  _CreateInterviewState createState() => _CreateInterviewState();
}

class _CreateInterviewState extends State<CreateInterview> {
  File? audio;
  bool isUploading = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController hostController = TextEditingController();

  handleChooseFromGallery() async {
    final audio = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp3'],
    );
    if (audio == null) {
      return;
    }
    final file = audio.files.first;
    // openFile(file);
    final audioTemp = File(file.path as String);

    setState(() {
      this.audio = audioTemp;
    });
    // final path = audio.paths;
    print('Path: ${file.path}');
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  clearAudio() {
    setState(() {
      audio = null;
    });
  }

  uploadInterview(audioFile) async {
    UploadTask uploadTask =
        storageRef.child("interview_$interviewId.jpg").putFile(audioFile);
    TaskSnapshot storageSnap = await uploadTask.whenComplete(() {});
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }

  createInterviewInFirestore({required String mediaUrl, required String title, required String host}) {
    interviewRef.add({
      "interviewId": interviewId,
      "title": title,
      "host": host,
      "mediaUrl": mediaUrl,
      "createdAt": FieldValue.serverTimestamp(),
    });
  }

  handleSubmit() async {
    setState(() {
      isUploading = true;
    });
    String mediaUrl = await uploadInterview(audio);
    createInterviewInFirestore(
      title: titleController.text,
      host: hostController.text,
      mediaUrl: mediaUrl,
    );
    setState(() {
      audio = null;
      isUploading = false;
      interviewId = Uuid().v4();
    });
  }

  @override
  Widget build(BuildContext context) {
    return audio == null ? buildSplashScreen() : uploadForm();
  }

  buildSplashScreen() {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () async {
            handleChooseFromGallery();
          },
          child: Text("Create interview"),
          textColor: Colors.white,
          color: Color(0xff242a54),
        ),
      ),
    );
  }

  uploadForm() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            clearAudio();
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
              width: 250,
              child: TextField(
                controller: titleController,
                // maxLines: 5,
                decoration: InputDecoration(
                  hintText: "Title",
                ),
              ),
            ),
            Container(
              width: 250,
              child: TextField(
                controller: hostController,
                // maxLines: 5,
                decoration: InputDecoration(
                  hintText: "Host",
                ),
              ),
            ),
            Center(
              child: MaterialButton(
                child: Text(
                  "Post",
                ),
                onPressed: () {
                  handleSubmit();
                },
                color: Color(0xff242a54),
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
