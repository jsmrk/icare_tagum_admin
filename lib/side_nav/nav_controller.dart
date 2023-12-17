import 'package:get/get.dart';
import 'package:icare_tagum_admin/manage_concern/manage_concern.dart';
import 'package:icare_tagum_admin/write_update/write_update.dart';

class NavController extends GetxController {
  RxInt index = 0.obs;

  var pages = [
    ManageConcern(),
    WriteUpdate(),
  ];
}
