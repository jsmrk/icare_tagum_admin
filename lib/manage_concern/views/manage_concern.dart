import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:icare_tagum_admin/manage_concern/models/read_concerns_model.dart';
import 'package:icare_tagum_admin/manage_concern/services/read_concerns_service.dart';
import 'package:icare_tagum_admin/manage_concern/views/edit_concern.dart';
import 'package:icare_tagum_admin/manage_users/model/add_user_model.dart';

class ManageConcern extends StatefulWidget {
  const ManageConcern({super.key});

  @override
  State<ManageConcern> createState() => _ManageConcernState();
}

class _ManageConcernState extends State<ManageConcern> {
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
            Container(
              margin: const EdgeInsets.only(left: 25, top: 15, bottom: 15),
              child: const Text(
                'Manage Concerns',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: Colors.green),
              ),
            ),
            StreamBuilder<List<ConcernDetails>>(
              stream: readConcerns(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final concernDetails = snapshot.data!;
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
                      DataColumn(
                        label: Text('Title'),
                      ),
                      DataColumn(
                        label: Text('Urgency'),
                      ),
                      DataColumn(
                        label: Text('Status'),
                      ),
                      DataColumn(
                        label: Text('Department'),
                      ),
                      DataColumn(
                        label: Text('Date'),
                      ),
                      DataColumn(
                        label: Text('Actions'),
                      ),
                    ],
                    rows: concernDetails
                        .map(
                          (concernDetails) => DataRow(
                            cells: [
                              DataCell(Text(concernDetails.title)),
                              DataCell(Text(concernDetails.urgency)),
                              DataCell(Text(concernDetails.status)),
                              DataCell(Text(concernDetails.department)),
                              DataCell(Text(
                                  concernDetails.dateTime.toIso8601String())),
                              DataCell(IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) =>
                                        EditConcern(concernDetails),
                                  );
                                },
                                icon: const Icon(
                                  Icons.edit_outlined,
                                  color: Colors.green,
                                ),
                              )),
                            ],
                          ),
                        )
                        .toList(),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                // Display a loading indicator while the stream is loading
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.green,
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
