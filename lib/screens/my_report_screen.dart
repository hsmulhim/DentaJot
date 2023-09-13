import 'dart:io';
import 'package:dental_proj/components/custom_header.dart';
import 'package:dental_proj/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyReportScreen extends StatefulWidget {
  const MyReportScreen({super.key, required this.type});
  final String type;

  @override
  State<MyReportScreen> createState() => _MyReportScreenState();
}

class _MyReportScreenState extends State<MyReportScreen> {
  File? image;
  String? reportImageUrl;

  @override
  void initState() {
    super.initState();
    _fetchReportImageUrl();
  }

  Future<void> _fetchReportImageUrl() async {
    final userData = await SupabaseService().fetchUserData();
    final reportUrl = userData[widget.type] as String?;

    setState(() {
      reportImageUrl = reportUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff6fa2cd),
        elevation: 0,
        title: Text('My ${widget.type}'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0XFFf97b65),
        onPressed: () => _getImage(context),
        child: const Icon(Icons.add),
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
                const SizedBox(
                  height: 200,
                ),
                if (reportImageUrl != null)
                  Center(child: Image.network(reportImageUrl!))
                else
                  const SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _getImage(BuildContext context) async {
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
      await _uploadImageToSupabase();

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(' Added Successfully'),
            content: const Text('Added Successfully '),
            actions: <Widget>[
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
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
      final imageUrl = Supabase.instance.client.storage
          .from("images")
          .getPublicUrl(imagePath);
      print("3");

      await Supabase.instance.client
          .from('Patient')
          .update({widget.type: imageUrl}).eq(
              "patientId", Supabase.instance.client.auth.currentUser!.id);

      setState(() {
        reportImageUrl = imageUrl;
      });
    }
  }
}
