import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icare_tagum_admin/side_nav/nav_controller.dart';
import 'package:icare_tagum_admin/side_nav/widgets/nav_listtile.dart';

class SideNav extends StatelessWidget {
  static const routeName = '/sidenav-screen';
  const SideNav({super.key});

  @override
  Widget build(BuildContext context) {
    NavController navController = Get.put(NavController());
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 35,
                    ),
                    Image.asset('lib/assets/images/logo.png', scale: 13),
                    const SizedBox(
                      height: 35,
                    ),
                    Expanded(
                      child: Obx(
                        () => ListView(
                          children: [
                            NavListTile(
                              title: 'Manage Concerns',
                              icon: Icons.edit_document,
                              onTap: () => navController.index.value = 0,
                              selected: navController.index.value == 0,
                            ),
                            NavListTile(
                              title: 'Manage Updates',
                              onTap: () => navController.index.value = 1,
                              selected: navController.index.value == 1,
                              icon: Icons.create_rounded,
                            ),
                            NavListTile(
                              title: 'Manage Users',
                              onTap: () => navController.index.value = 2,
                              selected: navController.index.value == 2,
                              icon: Icons.manage_accounts,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(bottom: 25, left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            minRadius: 25,
                            maxRadius: 25,
                            backgroundColor:
                                const Color.fromARGB(255, 228, 226, 226),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  25), // Match the radius of CircleAvatar
                              child: Image.asset(
                                'lib/assets/images/dummy.png',
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Jess Mark A. Baguio',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13),
                              ),
                              Text(
                                'Admin',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13),
                              ),
                            ],
                          ),
                          const SizedBox(width: 5),
                          const IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.logout_rounded,
                              size: 23,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 19,
              child: Obx(() => navController.pages[navController.index.value]),
            ),
          ],
        ),
      ),
    );
  }
}
