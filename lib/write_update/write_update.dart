import 'package:flutter/material.dart';
import 'package:icare_tagum_admin/login/login_screen.dart';

class WriteUpdate extends StatelessWidget {
  const WriteUpdate({super.key});

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 25),
                  child: const Text(
                    'Government Updates',
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
                      Navigator.pushReplacementNamed(context, ('/'));
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
                              'Write Update',
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
                    label: Text('Title'),
                  ),
                  DataColumn(
                    label: Text('Date'),
                  ),
                  DataColumn(
                    label: Text('Author'),
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
                      Row(
                        children: [
                          IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.edit_outlined,
                              color: Colors.green,
                            ),
                          ),
                          IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.delete_outline_outlined,
                              color: Color.fromARGB(255, 250, 119, 110),
                            ),
                          ),
                        ],
                      ),
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
                      Row(
                        children: [
                          IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.edit_outlined,
                              color: Colors.green,
                            ),
                          ),
                          IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.delete_outline_outlined,
                              color: Color.fromARGB(255, 250, 119, 110),
                            ),
                          ),
                        ],
                      ),
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
                      Row(
                        children: [
                          IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.edit_outlined,
                              color: Colors.green,
                            ),
                          ),
                          IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.delete_outline_outlined,
                              color: Color.fromARGB(255, 250, 119, 110),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ]),
          ],
        ),
      ),
    );
  }
}
