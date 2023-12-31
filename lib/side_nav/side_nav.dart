import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icare_tagum_admin/side_nav/services/nav_controller.dart';
import 'package:icare_tagum_admin/side_nav/widgets/nav_listtile.dart';

import 'services/user_detail.dart';

class SideNav extends StatefulWidget {
  static const routeName = '/sidenav-screen';
  const SideNav({super.key});

  @override
  State<SideNav> createState() => _SideNavState();
}

class _SideNavState extends State<SideNav> {
  String? userName;
  String? userRole;

  @override
  void initState() {
    super.initState();
    getUserDetails(
      (userData) => setState(() {
        userName = userData['name'];
        userRole = userData['role'];
      }),
      (error) => print(error), // Handle error silently in this example
    );
  }

  Widget build(BuildContext context) {
    NavController navController = Get.put(NavController());
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                margin: const EdgeInsets.only(top: 15, bottom: 15, right: 3),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 5.0,
                      offset: const Offset(1, 1),
                    ),
                  ],
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
                              onTap: () {
                                if (userRole == 'Administrator') {
                                  navController.index.value = 2;
                                }
                              },
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
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                userName.toString(),
                                style: const TextStyle(
                                    fontFamily: 'Inter',
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              Text(
                                userRole.toString(),
                                style: const TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13),
                              ),
                            ],
                          ),
                          const SizedBox(width: 5),
                          IconButton(
                            onPressed: () {
                              FirebaseAuth.instance.signOut();
                            },
                            icon: const Icon(
                              Icons.logout_rounded,
                              size: 23,
                              color: Colors.black,
                            ),
                          ),
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
