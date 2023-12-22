import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icare_tagum_admin/manage_concern/Widgets/edit_concern_btn.dart';

import '../Widgets/edit_concern_textfield.dart';

class EditConcern extends StatefulWidget {
  const EditConcern({super.key});

  @override
  State<EditConcern> createState() => _EditConcernState();
}

class _EditConcernState extends State<EditConcern> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

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
                  EditConcernTextfield(
                    label: const Text('Title'),
                    controller: titleController,
                  ),
                  const SizedBox(height: 23),
                  TextFormField(
                    controller: descriptionController,
                    maxLines: 5,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      labelText: 'Write Report Description',
                      alignLabelWithHint: true,
                      labelStyle: TextStyle(
                          fontFamily: 'Inter',
                          color: Color.fromARGB(255, 76, 76, 76),
                          fontSize: 15),
                      floatingLabelStyle: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 19,
                        color: Colors.green,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 126, 126, 126),
                            width: 1.9), // Thicker border when focused
                      ),
                    ),
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
