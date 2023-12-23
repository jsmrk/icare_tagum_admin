import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
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
  PageController _pageController = PageController();
  int _currentImageIndex = 0;

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
                fontFamily: 'Inter',
                color: Colors.black,
                fontSize: 17,
              ),
            ),
            TextSpan(
              text: details,
              style: const TextStyle(
                fontFamily: 'Inter',
                color: Colors.black,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget displayImages() {
    return Container(
      height: 355,
      width: 635,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.concernDetails.imageURLs!.length,
            onPageChanged: (index) {
              setState(() {
                _currentImageIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  const Center(
                    child: CircularProgressIndicator(
                      color: Colors.green,
                    ), // Display loading indicator initially
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                    child: Image.network(
                      widget.concernDetails.imageURLs![index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          ),
          if (widget.concernDetails.imageURLs!.length > 1)
            Positioned(
              left: 7,
              top: 151,
              child: IconButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.white54),
                ),
                icon: const Icon(Icons.arrow_left),
                onPressed: () {
                  if (_currentImageIndex > 0) {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  }
                },
              ),
            ),
          if (widget.concernDetails.imageURLs!.length > 1)
            Positioned(
              right: 7,
              top: 151,
              child: IconButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.white54),
                ),
                icon: const Icon(Icons.arrow_right),
                onPressed: () {
                  if (_currentImageIndex <
                      widget.concernDetails.imageURLs!.length - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  }
                },
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
        left: 701,
        right: 551,
        top: 75,
        bottom: 65,
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
              padding: const EdgeInsets.only(
                  left: 39, right: 39, top: 17, bottom: 17),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Stack(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    widget.concernDetails.imageURLs!.isNotEmpty
                        ? displayImages()
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.asset(
                              'lib/assets/images/sampleimage.png',
                              height: 305,
                              width: 577,
                              fit: BoxFit.cover,
                            ),
                          ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(widget.concernDetails.title,
                          style: const TextStyle(
                              fontSize: 31,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700)),
                    ),
                    const SizedBox(height: 15),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          smallDetails(
                              'Author :   ', widget.concernDetails.nickname),
                          smallDetails(
                              '', getFormattedDate(widget.concernDetails)),
                        ]),
                    const SizedBox(height: 3),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          smallDetails(
                              'Urgency :   ', widget.concernDetails.urgency),
                          smallDetails(
                              '', getFormattedTime(widget.concernDetails)),
                        ]),
                    const SizedBox(height: 3),
                    smallDetails(
                        'Location :   ', widget.concernDetails.location),
                    const SizedBox(height: 15),
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Text(
                        widget.concernDetails.description,
                        maxLines: 7,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 17,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
                Positioned(
                  bottom: 17,
                  right: 0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
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
                        buttonName: 'Save',
                        onTap: null,
                        tColor: Colors.white,
                        bColor: Colors.green,
                        icon: Icons.add,
                      ),
                    ],
                  ),
                ),
              ])),
        ],
      ),
    );
  }
}
