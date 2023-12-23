import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icare_tagum_admin/manage_concern/Widgets/edit_concern_btn.dart';
import 'package:icare_tagum_admin/manage_concern/models/read_concerns_model.dart';
import 'package:intl/intl.dart';

import '../Widgets/edit_concern_textfield.dart';

class EditConcern extends StatefulWidget {
  final ConcernDetails concernDetails;
  const EditConcern(this.concernDetails, {super.key});

  @override
  State<EditConcern> createState() => _EditConcernState();
}

class _EditConcernState extends State<EditConcern> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  String getFormattedDate(ConcernDetails concernDetails) {
    final dateTime = concernDetails.dateTime;
    final formatter = DateFormat('yyyy-MM-dd'); // Customize format as needed
    return formatter.format(dateTime);
  }

  String getFormattedTime(ConcernDetails concernDetails) {
    final dateTime = concernDetails.dateTime;
    final formatter = DateFormat('h:mm a'); // Customize format as needed
    return formatter.format(dateTime);
  }

  Widget smallDetails(String title, String details) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(left: 1.9, bottom: 5),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 13,
              ),
            ),
            TextSpan(
              text: details,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
        left: 713,
        right: 650,
        top: 111,
        bottom: 95,
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
          side: BorderSide.none),
      child: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: .5, sigmaY: .5),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.all(45),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Concern',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  const SizedBox(height: 25),
                  // selectedImages.isNotEmpty
                  //     ? DisplaySelectedImages(selectedImages: selectedImages)
                  //     :
                  Row(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset(
                        'lib/assets/images/sampleimage.png',
                        height: 235,
                        width: 467,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ]),
                  const SizedBox(height: 5),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(widget.concernDetails.title,
                        style: const TextStyle(
                            fontSize: 21,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700)),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        smallDetails(
                            'Author :   ', widget.concernDetails.nickname),
                        smallDetails(
                            '', getFormattedDate(widget.concernDetails)),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        smallDetails(
                            'Urgency :   ', widget.concernDetails.urgency),
                        smallDetails(
                            '', getFormattedTime(widget.concernDetails)),
                      ]),
                  smallDetails('Location :   ', widget.concernDetails.location),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(widget.concernDetails.description,
                        style: const TextStyle(
                            fontSize: 13,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      EditConcernButton(
                        buttonName: 'Cancel',
                        onTap: () {
                          Navigator.pop(context);
                        },
                        tColor: Colors.white,
                        bColor: Colors.grey,
                        icon: Icons.close,
                      ),
                      const SizedBox(width: 35),
                      EditConcernButton(
                        buttonName: 'Add Update',
                        onTap: null,
                        tColor: Colors.white,
                        bColor: Colors.green,
                        icon: Icons.add,
                      ),
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}
