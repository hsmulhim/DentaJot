import 'package:dental_proj/screens/appointment_screen.dart';
import 'package:dental_proj/services/supabase.dart';
import 'package:flutter/material.dart';

teeth_function(BuildContext context, int toothId, int teethNum) async {
  final toothData = await fetchTeethName(toothId);

  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => AppointmentScreen(
      teethName: toothData["teeth_name"],
      teethNumber: teethNum,
      toothId: toothId,
    ),
  ));
}
