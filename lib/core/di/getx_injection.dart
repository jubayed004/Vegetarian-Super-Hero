import 'package:get/get.dart';
import 'package:vegetarian_super_hero/features/other/controller/other_controller.dart';

import 'package:vegetarian_super_hero/share/controller/language_controller.dart';
import 'package:vegetarian_super_hero/features/auth/controller/auth_controller.dart';
import 'package:vegetarian_super_hero/features/input_info/controller/input_info_controller.dart';
void initGetx() {
  //Auth
  Get.lazyPut(() => LanguageController(), fenix: true);
   Get.lazyPut(() => AuthController(), fenix: true);
  // // Get.lazyPut(() => OtpController(), fenix: true);
  // // Get.lazyPut(() => ResetPasswordController(), fenix: true);
  // //
  // //Others
  Get.lazyPut(() => OtherController(), fenix: true);
  // // Get.lazyPut(() => OnboardingController(), fenix: true);
  // // Get.lazyPut(() => CommonController(), fenix: true);
  // //
  // // //Chat
  // // Get.lazyPut(() => ChatController(), fenix: true);
  // //
  // // //Driver
  // // Get.lazyPut(() => TrackParcelController(), fenix: true);
  // //
  // // //Parcel Owner
  // // Get.lazyPut(() => AllCommuterController(), fenix: true);
  // // Get.lazyPut(() => MyParcelController(), fenix: true);
  // // Get.lazyPut(() => RefundController(), fenix: true);
  // //
  // // //Profile
  // Get.lazyPut(() => ProfileController(), fenix: true);
  Get.lazyPut(() => InputInfoController(), fenix: true);
}
