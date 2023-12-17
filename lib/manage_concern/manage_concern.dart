import 'package:flutter/material.dart';

class ManageConcern extends StatelessWidget {
  const ManageConcern({super.key});

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
        margin: const EdgeInsets.all(25),
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
            DataTable(
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
                    fontSize: 13),
                columns: const [
                  DataColumn(
                    label: Text('ID'),
                  ),
                  DataColumn(
                    label: Text('Date'),
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
                    label: Text('Action'),
                  ),
                ],
                rows: [
                  DataRow(cells: [
                    const DataCell(
                      Text('0'),
                    ),
                    DataCell(
                      Text(DateTime.now().toString()),
                    ),
                    const DataCell(
                      Text('High'),
                    ),
                    const DataCell(
                      Text('Not Viewed'),
                    ),
                    const DataCell(
                      Text('Not Yet Assigned'),
                    ),
                    const DataCell(
                      IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.edit_outlined,
                            color: Colors.green,
                          )),
                    ),
                  ]),
                  DataRow(cells: [
                    const DataCell(
                      Text('0'),
                    ),
                    DataCell(
                      Text(DateTime.now().toString()),
                    ),
                    const DataCell(
                      Text('High'),
                    ),
                    const DataCell(
                      Text('Not Viewed'),
                    ),
                    const DataCell(
                      Text('Not Yet Assigned'),
                    ),
                    const DataCell(
                      IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.edit_outlined,
                            color: Colors.green,
                          )),
                    ),
                  ]),
                  DataRow(cells: [
                    const DataCell(
                      Text('0'),
                    ),
                    DataCell(
                      Text(DateTime.now().toString()),
                    ),
                    const DataCell(
                      Text('High'),
                    ),
                    const DataCell(
                      Text('Not Viewed'),
                    ),
                    const DataCell(
                      Text('Not Yet Assigned'),
                    ),
                    const DataCell(
                      IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.edit_outlined,
                            color: Colors.green,
                          )),
                    ),
                  ]),
                ]),
          ],
        ),
      ),
    );
  }
}
