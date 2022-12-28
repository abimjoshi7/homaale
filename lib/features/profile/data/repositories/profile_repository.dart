// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/networking/models/response/tasker_profile_res.dart';
import 'package:cipher/networking/network_helper.dart';

class ProfileRepository {
  final NetworkHelper networkHelper;
  ProfileRepository({
    required this.networkHelper,
  });

  Future<TaskerProfileRes> fetchTaskerProfile() async {
    return await networkHelper.getTaskerProfile();
  }
}
