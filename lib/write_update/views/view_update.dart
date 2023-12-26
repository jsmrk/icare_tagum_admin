// ignore_for_file: use_build_context_synchronously

import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:icare_tagum_admin/manage_concern/Widgets/edit_concern_btn.dart';
import 'package:icare_tagum_admin/manage_concern/Widgets/edit_concern_smalldetails.dart';
import 'package:icare_tagum_admin/write_update/models/read_updates_model.dart';
import 'package:intl/intl.dart';

class ViewUpdate extends StatefulWidget {
  final UpdateDetails updateDetails;
  const ViewUpdate(this.updateDetails, {super.key});

  @override
  State<ViewUpdate> createState() => _ViewUpdateState();
}

class _ViewUpdateState extends State<ViewUpdate> {
  final PageController _pageController = PageController();
  int _currentImageIndex = 0;

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  String getFormattedDate(UpdateDetails updateDetails) {
    final dateTime = updateDetails.dateTime;
    final formatter = DateFormat('yyyy-MM-dd'); // Customize format as needed
    return formatter.format(dateTime);
  }

  String getFormattedTime(UpdateDetails updateDetails) {
    final dateTime = updateDetails.dateTime;
    final formatter = DateFormat('h:mm a'); // Customize format as needed
    return formatter.format(dateTime);
  }

  Widget displayImages() {
    return SizedBox(
      height: 299,
      width: double.infinity,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.updateDetails.imageURLs!.length,
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
                    ),
                  ),
                  SizedBox(
                    height: 299,
                    width: 735,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                      child: Image.network(
                        widget.updateDetails.imageURLs![index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          if (widget.updateDetails.imageURLs!.length > 1)
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
          if (widget.updateDetails.imageURLs!.length > 1)
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
                      widget.updateDetails.imageURLs!.length - 1) {
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
                  left: 39, right: 39, top: 32, bottom: 17),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Stack(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.updateDetails.imageURLs!.isNotEmpty
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
                    const SizedBox(height: 25),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(widget.updateDetails.title,
                          style: const TextStyle(
                              fontSize: 27,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700)),
                    ),
                    Row(
                      children: [
                        SmallDetailsText(
                          title: '',
                          details: getFormattedDate(widget.updateDetails),
                        ),
                        const SizedBox(width: 15),
                        SmallDetailsText(
                            title: '',
                            details: getFormattedTime(widget.updateDetails)),
                      ],
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 189,
                      width: double.infinity,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Text(
                          widget.updateDetails.description,
                          style: const TextStyle(
                            fontSize: 17,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
                Positioned(
                  bottom: 13,
                  left: 215,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      EditConcernButton(
                        buttonName: 'Close',
                        onTap: () {
                          Navigator.pop(context);
                        },
                        tColor: Colors.white,
                        bColor: Colors.green,
                        icon: Icons.close,
                      ),
                      const SizedBox(width: 35),
                    ],
                  ),
                ),
              ])),
        ],
      ),
    );
  }
}
