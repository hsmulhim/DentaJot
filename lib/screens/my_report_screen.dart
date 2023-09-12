import 'dart:developer';
import 'dart:io';

import 'package:dental_proj/components/custom_header.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyReportScreen extends StatefulWidget {
  const MyReportScreen({Key? key});

  @override
  State<MyReportScreen> createState() => _MyReportScreenState();
}

class _MyReportScreenState extends State<MyReportScreen> {
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff2D4CB9),
        elevation: 0,
        title: const Text('My Report'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImage,
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Stack(
          children: [
            CustomPaint(
              painter: HeaderCurvedContainer(),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 200,
                ),
                image != null
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.5,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: FileImage(image!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      maxWidth: 200,
      maxHeight: 200,
      source: ImageSource.gallery,
    );

    if (pickedImage != null) {
      final imageFile = File(pickedImage.path);
      setState(() {
        image = imageFile;
      });
      _uploadImageToSupabase();
    }
  }

  void _clearImage() {
    setState(() {
      image = null;
    });
  }

  Future<void> _uploadImageToSupabase() async {
    if (image != null) {
      final imagePath = '/images/${DateTime.now()}.png';

      await Supabase.instance.client.storage
          .from("images")
          .upload(imagePath, image!);

      print("Image Upload done");
      print("2");
      final imageUrl = await Supabase.instance.client.storage
          .from("images")
          .getPublicUrl(imagePath);
      print("3");
      await Supabase.instance.client
          .from('Patient')
          .update({"report": imageUrl}).eq(
              "patientId", Supabase.instance.client.auth.currentUser!.id);
    }
  }
}
