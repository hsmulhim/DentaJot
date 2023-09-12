import 'package:dental_proj/models/patient_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:developer';

final supabase = Supabase.instance.client;

class SupabaseService {
  Future addPatient(Patient patient) async {
    // final supabase = Supabase.instance.client;
    log(patient.toJson().toString());
    await supabase.from('Patient').upsert(patient.toJson());
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

  Future<bool> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  }) async {
    try {
      final response = await Supabase.instance.client.auth.verifyOTP(
        type: OtpType.email,
        token: otp,
        email: email,
      );
      final user = response.user;

      if (user != null) {
        final updatedUser =
            await Supabase.instance.client.auth.updateUser(UserAttributes(
          email: email,
          password: newPassword,
        ));

        if (updatedUser.user == null) {
          return false;
        }

        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  Future<Map> fetchUserData() async {
    final user = supabase.auth.currentUser;

    final response = await supabase
        .from('Patient')
        .select()
        .eq('patientId', user!.id)
        .single();

    return response;
  }
}
