import 'package:dental_proj/components/custom_header.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';

class MyReportScreen extends StatefulWidget {
  const MyReportScreen({super.key});

  @override
  State<MyReportScreen> createState() => _MyReportScreenState();
}

class _MyReportScreenState extends State<MyReportScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff2D4CB9),
          elevation: 0,
          title: Text('My Report'),
        ),
        body: SafeArea(
            top: false,
            bottom: false,
            child: Stack(children: [
              CustomPaint(
                painter: HeaderCurvedContainer(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
              ),
            ])));
  }
  
}
