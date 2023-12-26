import 'package:get/get.dart';
import 'package:icare_tagum_admin/manage_concern/views/manage_concern.dart';
import 'package:icare_tagum_admin/manage_users/manage_users.dart';
import 'package:icare_tagum_admin/write_update/views/manage_updates.dart';
import 'package:icare_tagum_admin/write_update/views/write_update.dart';

class NavController extends GetxController {
  RxInt index = 0.obs;

  var pages = [
    const ManageConcern(),
    const ManageUpdates(),
    const ManageUsers(),
  ];
}
