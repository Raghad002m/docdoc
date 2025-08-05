import 'package:easy_localization/easy_localization.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../model/profilemodel.dart';
import 'supbaseDB.dart';

class mySupabaseAuth {
  final supabase = Supabase.instance.client;

  String? get currentUserId => supabase.auth.currentUser?.id;

  Future<void> signUp(String email, String password, String username,
      String dateBirth, String visionProblem, String Gender) async {
    try {
      final AuthResponse response = await supabase.auth.signUp(
        email: email,
        password: password,
      );

      print("Registered user: ${response.user?.id}");

      if (response.user != null) {
        Profile profile = Profile(
          id: response.user!.id,
          email: email,
          username: username,
          date_birth: dateBirth,
          vision_problem: visionProblem,
          password: password,
          Gender: Gender,

        );

        await SupbaseDb().insertProfile(profile);
        print("Profile saved");
      }
    } catch (e) {
      print("Auth error: $e".tr());
      throw Exception("Authentication failed: ${e.toString()}".tr());
    }
  }
}
