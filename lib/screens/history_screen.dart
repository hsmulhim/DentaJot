import 'dart:js';

import 'package:dental_proj/constants/spacings.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';



class HistoryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> data; // قائمة البيانات

  HistoryScreen({required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        final item = data[index];
        final doctorName = item['doctorName'];
        final patientCases = item['patientCases'];
        final appointmentDate = item['appointmentDate'];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[350],
              boxShadow: const [
                BoxShadow(
                  color: Color(0xff2D4CB9),
                  offset: Offset(-3, -3),
                ),
              ],
            ),
            height: 100,
            width: MediaQuery.of(context).size.width - 50,
            child: Row(
              children: [
                const SizedBox(width: 8),
                Column(
                  children: [
                    const SizedBox(height: 32),
                    const Text(
                      "Doctor name",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(doctorName),
                  ],
                ),
                const SizedBox(width: 16),
                Column(
                  children: [
                    const SizedBox(height: 32),
                    const Text(
                      "Patient Cases",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(patientCases),
                  ],
                ),
                const SizedBox(width: 16),
                Column(
                  children: [
                    const SizedBox(height: 32),
                    const Text(
                      "Date",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(appointmentDate),
                  ],
                ),
                const Icon(
                  Icons.keyboard_arrow_right,
                  size: 35,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
