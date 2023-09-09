import 'package:supabase_flutter/supabase_flutter.dart';

supabaseCon() async {
  await Supabase.initialize(
    url: "https://mguwylgfdatsdadqsffy.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1ndXd5bGdmZGF0c2RhZHFzZmZ5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTMzODA4ODgsImV4cCI6MjAwODk1Njg4OH0.InTs-O2OiTGEUoyvGZKNESQCJvxGOLx6NavNB5o93WY",
  );
}

Future fetchTeethName(int toothId) async {
  final List response = await Supabase.instance.client
      .from('Teeth')
      .select('teeth_name')
      .eq("tooth_id", toothId);

  print(response.toString());

  return response.first;
}

Future getAppontment(int toothId) async {
  final List appontmentList = await Supabase.instance.client
      .from("Appointment")
      .select()
      .eq('toothId', toothId);

  return appontmentList;
}
