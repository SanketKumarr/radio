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
  File? coverPic;
  bool isUploading = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController hostController = TextEditingController();
  late final PlatformFile file;

  handleChooseFromGallery() async {
    final audio = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp3'],
    );
    if (audio == null) {
      return;
    }
    file = audio.files.first;
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
      coverPic = null;
    });
  }

  uploadInterview(audioFile) async {
    UploadTask uploadTask =
        storageRef.child("interview_$interviewId.mp3").putFile(audioFile);
    TaskSnapshot storageSnap = await uploadTask.whenComplete(() {});
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }

  uploadCoverPic(coverPicFile) async {
    UploadTask uploadTask = storageRef
        .child("interviewCoverPic_$interviewId.mp3")
        .putFile(coverPicFile);
    TaskSnapshot storageSnap = await uploadTask.whenComplete(() {});
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }

  createInterviewInFirestore(
      {required String mediaUrl,
      required String coverPicUrl,
      required String title,
      required String host}) {
    interviewRef.add({
      "interviewId": interviewId,
      "title": title,
      "host": host,
      "mediaUrl": mediaUrl,
      "coverPicUrl": coverPicUrl,
      "createdAt": FieldValue.serverTimestamp(),
    });
  }

  handleSubmit() async {
    setState(() {
      isUploading = true;
    });
    String mediaUrl = await uploadInterview(audio);
    String coverPicUrl = await uploadCoverPic(coverPic);
    createInterviewInFirestore(
      title: titleController.text,
      host: hostController.text,
      mediaUrl: mediaUrl,
      coverPicUrl: coverPicUrl,
    );
    setState(() {
      audio = null;
      coverPic = null;
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
              height: 220,
              width: MediaQuery.of(context).size.width * 0.8,
              child: coverPic == null
                  ? Center(
                      child: Text(
                        "Cover pic not selected,",
                      ),
                    )
                  : Center(
                      child: Container(
                        width: 220,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: FileImage(coverPic!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
            ),
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
                  if (coverPic != null) {
                    handleSubmit();
                  } else {
                    print("pic not selected");
                    const snackBar = SnackBar(
                      content: Text(
                        "Cover pic not selected, select a cover pic first",
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                color: Color(0xff242a54),
                textColor: Colors.white,
              ),
            ),
            Center(
              child: MaterialButton(
                child: Text(
                  "Choose cover pic",
                ),
                color: Color(0xff242a54),
                textColor: Colors.white,
                onPressed: () {
                  handleChooseCoverPic();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  handleChooseCoverPic() async {
    final coverPic = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg'],
    );
    if (coverPic == null) {
      return;
    }
    final file = coverPic.files.first;
    // openFile(file);
    final coverPicTemp = File(file.path as String);

    setState(() {
      this.coverPic = coverPicTemp;
    });

    // final path = audio.paths;
    print('Path: ${file.path}');
  }
}
