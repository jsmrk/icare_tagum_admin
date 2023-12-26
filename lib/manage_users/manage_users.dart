import 'package:flutter/material.dart';
import 'package:icare_tagum_admin/manage_users/add_user.dart';
import 'package:icare_tagum_admin/manage_users/model/read_user_model.dart';
import 'package:icare_tagum_admin/manage_users/services/delete_user.dart';
import 'package:icare_tagum_admin/manage_users/services/read_user_service.dart';

class ManageUsers extends StatefulWidget {
  const ManageUsers({super.key});

  @override
  State<ManageUsers> createState() => _ManageUsersState();
}

class _ManageUsersState extends State<ManageUsers> {
  // int index = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 5.0,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        margin: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 25),
                  child: const Text(
                    'Manage Users',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: Colors.green),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 15, right: 25),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AddUser(),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        height: 37,
                        width: 175,
                        alignment: Alignment.center,
                        color: Colors.green,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 21,
                            ),
                            SizedBox(width: 7),
                            Text(
                              'Add User',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            StreamBuilder<List<UserDetails>>(
              stream: readUserDetails(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final userDetail = snapshot.data!;
                  return DataTable(
                    border: const TableBorder(
                      horizontalInside: BorderSide(
                        width: 1,
                        color: Colors.white,
                        style: BorderStyle.solid,
                      ),
                    ),
                    headingRowHeight: 45,
                    headingRowColor: const MaterialStatePropertyAll(
                      Color(0xFFF9FAFB),
                    ),
                    headingTextStyle: const TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.grey,
                    ),
                    dataRowMinHeight: 65,
                    dataRowMaxHeight: 65,
                    dataTextStyle: const TextStyle(
                      fontFamily: 'Inter',
                      color: Color.fromARGB(255, 75, 75, 75),
                      fontSize: 13,
                    ),
                    columns: const [
                      // DataColumn(
                      //   label: Text('#'),
                      // ),
                      DataColumn(
                        label: Text('Role'),
                      ),
                      DataColumn(
                        label: Text('Name'),
                      ),
                      DataColumn(
                        label: Text('Email'),
                      ),
                      DataColumn(
                        label: Text('Position'),
                      ),
                      DataColumn(
                        label: Text('Department'),
                      ),
                      DataColumn(
                        label: Text('Date Created'),
                      ),
                      DataColumn(
                        label: Text('Actions'),
                      ),
                    ],
                    rows: userDetail
                        .map((userDetail) => DataRow(
                              cells: [
                                // DataCell(Text('${index++}')),
                                DataCell(Text(userDetail.role)),
                                DataCell(Text(userDetail.name)),
                                DataCell(Text(userDetail.email)),
                                DataCell(Text(userDetail.position)),
                                DataCell(Text(userDetail.department)),
                                DataCell(Text(
                                    userDetail.dateTime.toIso8601String())),
                                DataCell(Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        /* Edit button function */
                                      },
                                      icon: const Icon(
                                        Icons.edit_outlined,
                                        color: Colors.green,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        deleteUser(
                                            context, userDetail.dateTime);
                                      },
                                      icon: const Icon(
                                        Icons.delete_outline_outlined,
                                        color:
                                            Color.fromARGB(255, 250, 119, 110),
                                      ),
                                    ),
                                  ],
                                )),
                              ],
                            ))
                        .toList(),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                return const Stack(
                  children: [
                    Visibility(
                        child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.green,
                      ),
                    ))
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
