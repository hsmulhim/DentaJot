import 'package:flutter/material.dart';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../components/history_card.dart';
import '../models/appointment_model.dart';

class TimeLineScreen extends StatelessWidget {
  const TimeLineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff6fa2cd),
          title: const Text("Appointment Timeline"),
        ),
        body: FutureBuilder(
          future: getAppontment(), // Replace with your Supabase fetch function
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text("No appointments found."));
            } else {
              return buildTimeline(snapshot.data!);
            }
          },
        ),
      ),
    );
  }

  Widget buildTimeline(List appointments) {
    final List<Appointment> appointmentsObjects = [];

    for (var element in appointments) {
      appointmentsObjects.add(Appointment.fromJson(element));
    }
    return ListView.builder(
      itemCount: appointmentsObjects.length,
      itemBuilder: (BuildContext context, int index) {
        final Appointment appointment = appointmentsObjects[index];

        return TimelineTile(
          beforeLineStyle: const LineStyle(color: Color(0xff003253)),
          alignment: TimelineAlign.manual,
          lineXY: 0.1,
          isFirst: index == 0,
          isLast: index == appointments.length - 1,
          indicatorStyle: const IndicatorStyle(
            width: 20,
            color: Color(0xfff97b65),
          ),
          endChild: AppointmentsCards(
            appointment: appointment,
          ),
        );
      },
    );
  }

  Future getAppontment() async {
    final List appontmentList = await Supabase.instance.client
        .from("Appointment")
        .select()
        .eq('patientId', "e3ba839c-8e5e-4aec-8cda-aef123f41134");
    print(appontmentList);
    return appontmentList;
  }

//   Future<List<Appointment>> fetchUserAppointments() async {
//     List<Appointment> appointments = [
//       Appointment(
//         title: "Appointment 1",
//         description: "Description of Appointment 1",
//         date: DateTime(2023, 9, 15, 10, 0),
//       ),
//       Appointment(
//         title: "Appointment 2",
//         description: "Description of Appointment 2",
//         date: DateTime(2023, 9, 20, 15, 30),
//       ),
//       Appointment(
//         title: "Appointment 77",
//         description: "Description of Appointment 2",
//         date: DateTime(2023, 9, 20, 15, 30),
//       ),
//       Appointment(
//         title: "Appointment 29",
//         description: "Description of Appointment 2",
//         date: DateTime(2023, 9, 20, 15, 30),
//       ),
//       // Add more appointments as needed
//     ];

//     return appointments;
//   }
}
