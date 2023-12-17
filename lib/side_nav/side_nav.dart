import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icare_tagum_admin/side_nav/nav_controller.dart';

class SideNav extends StatelessWidget {
  static const routeName = '/sidenav-screen';
  const SideNav({super.key});

  @override
  Widget build(BuildContext context) {
    NavController navController = Get.put(NavController());
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.grey,
              child: Obx(
                () => ListView(
                  children: [
                    ListTile(
                      title: const Text('Manage Concern'),
                      onTap: () => navController.index.value = 0,
                      selected: navController.index.value == 0,
                    ),
                    ListTile(
                      title: const Text('Create Update'),
                      onTap: () => navController.index.value = 1,
                      selected: navController.index.value == 1,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: Obx(() => navController.pages[navController.index.value]),
          ),
        ],
      ),
    );
  }
}
