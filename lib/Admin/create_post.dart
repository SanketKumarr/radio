import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as Im;
import 'package:uuid/uuid.dart';

final storageRef = FirebaseStorage.instance.ref();

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  File? image;
  bool isUploading = false;
  final ImagePicker _picker = ImagePicker();
  String postId = Uuid().v4();

  buildSplashScreen() {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          child: Text("Create post"),
          textColor: Colors.white,
          color: Color(0xff242a54),
          onPressed: () => handleChooseFromGallery(),
        ),
      ),
    );
  }

  handleChooseFromGallery() async {
    // Navigator.pop(context);
    final image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    if (image == null) return;
    final imageTemp = File(image.path);

    setState(() {
      this.image = imageTemp;
    });
  }

  clearImage() {
    setState(() {
      image = null;
    });
  }

  compressImage() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image? ImageFile = Im.decodeImage(image!.readAsBytesSync());
    final compressedImageImage = File('$path/img_$postId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(ImageFile!, quality: 70));
    setState(() {
      image = compressedImageImage;
    });
  }

  uploadImage(imageFile) async {
    UploadTask uploadTask =
        storageRef.child("post_$postId.jpg").putFile(imageFile);
    TaskSnapshot storageSnap = await uploadTask.whenComplete(() {});
  }

  handleSubmit() async {
    setState(() {
      isUploading = true;
    });
    await compressImage();
    await uploadImage(image);
  }

  uploadForm() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            clearImage();
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
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(image!),
                      fit: BoxFit.cover,
                    ),
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
                    maxLines: 5,
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
                isUploading ? null : () => handleSubmit();
              },
              color: Color(0xff242a54),
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return image == null ? buildSplashScreen() : uploadForm();
  }
}
