import 'package:supabase_flutter/supabase_flutter.dart';

import '../../model/profilemodel.dart';


class SupbaseDb {
  //object from subabase instance(DB)
  final supabase= Supabase.instance.client;


  Future insertProfile (Profile profile) async {
    try{
      await supabase.from('registration').insert(profile.toMap());
      print ("Insert Successfully");
    }catch(e){
      throw Exception(e.toString());
    }
  }


  Future<Profile>getUserProfile(String id)async{
    try{
      print ("get Successfully id is $id from db");
      final userProfile =
      await supabase.from('registration').select().eq('id', id).single();
      print ("get Successfully $userProfile");
      return Profile.fromMap(userProfile);
    }catch(e){
      throw Exception(e.toString());
    }
  }
  Future<List<Profile>> getallProfile()async{
    try {
      final profiles =  await supabase.from('registration').select();
      return profiles.map((e)=>Profile.fromMap(e)).toList();
      print("Get All Profile Successfully");
    }catch(e){
      throw Exception(e.toString());

    }
  }
}