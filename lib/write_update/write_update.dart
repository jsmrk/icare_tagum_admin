// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'dart:ui';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:icare_tagum_admin/write_update/widgets/display_images.dart';
import 'package:icare_tagum_admin/write_update/widgets/write_update_button.dart';
import 'package:icare_tagum_admin/write_update/widgets/write_update_textfield.dart';
import 'package:image_picker/image_picker.dart';

class WriteUpdate extends StatefulWidget {
  WriteUpdate({super.key});

  @override
  State<WriteUpdate> createState() => _WriteUpdateState();
}

class _WriteUpdateState extends State<WriteUpdate> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final authorController = TextEditingController();

  List<File> selectedImages = [];
  final picker = ImagePicker();

  Future getImages() async {
    final pickedFile = await picker.pickMultiImage(
      imageQuality: 100,
      maxHeight: 1000,
      maxWidth: 1000,
    );
    List<XFile> xfilePick = pickedFile;

    if (xfilePick.isNotEmpty) {
      for (var i = 0; i < xfilePick.length; i++) {
        selectedImages.add(File(xfilePick[i].path));
      }
      setState(() {});
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('No Images Selected'),
          content: const Text('Please select at least one image.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  //   Future<void> uploadUpdate() async {
  //   List<String> downloadURLs = [];
  //   try {
  //     for (int index = 0; index < selectedImages.length; index++) {
  //       final storageRef = FirebaseStorage.instance.ref(
  //         'updateImages/${selectedImages[index].path.split('/').last}',
  //       );
  //       final uploadTask = storageRef.putFile(selectedImages[index]);
  //       await uploadTask.whenComplete(() => null);
  //       final downloadURL = await storageRef.getDownloadURL();
  //       downloadURLs.add(downloadURL);
  //     }

  //     readConcern.addConcern(
  //       title: titleController.text,
  //       description: descriptionController.text,
  //       location: locationController.text,
  //       urgency: _selectedUrgency,
  //       imageURLs: downloadURLs,
  //     );

  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text('Concern added successfully'),
  //         backgroundColor: Colors.green,
  //       ),
  //     );

  //     Navigator.pop(context);
  //   } finally {
  //     Navigator.of(context).pop();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
        left: 450,
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
                    'Write Update',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  const SizedBox(height: 25),
                  selectedImages.isNotEmpty
                      ? DisplaySelectedImages(selectedImages: selectedImages)
                      : Row(children: [
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
                    alignment: Alignment.center,
                    child: WriteUpdateButton(
                      bColor: Colors.white,
                      tColor: Colors.grey,
                      icon: Icons.add_a_photo_rounded,
                      buttonName: 'Add Photo',
                      onTap: getImages,
                    ),
                  ),
                  const SizedBox(height: 5),
                  WriteUserTextfield(
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
                      WriteUpdateButton(
                        buttonName: 'Cancel',
                        onTap: () {
                          Navigator.pop(context);
                        },
                        tColor: Colors.white,
                        bColor: Colors.grey,
                        icon: Icons.close,
                      ),
                      const SizedBox(width: 35),
                      WriteUpdateButton(
                        buttonName: 'Add Update',
                        onTap: () {},
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
