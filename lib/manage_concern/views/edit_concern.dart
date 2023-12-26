// ignore_for_file: use_build_context_synchronously

import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:icare_tagum_admin/manage_concern/Widgets/edit_concern_btn.dart';
import 'package:icare_tagum_admin/manage_concern/Widgets/edit_concern_smalldetails.dart';
import 'package:icare_tagum_admin/manage_concern/Widgets/edit_dropdown.dart';
import 'package:icare_tagum_admin/manage_concern/models/read_concerns_model.dart';
import 'package:intl/intl.dart';

import '../models/edit_concern_model.dart';
import '../services/save_updated_concern.dart';

class EditConcern extends StatefulWidget {
  final ConcernDetails concernDetails;
  const EditConcern(this.concernDetails, {super.key});

  @override
  State<EditConcern> createState() => _EditConcernState();
}

class _EditConcernState extends State<EditConcern> {
  String? _selectedDepartment;
  final PageController _pageController = PageController();
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

  Widget displayImages() {
    return SizedBox(
      height: 299,
      width: double.infinity,
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
                    ),
                  ),
                  SizedBox(
                    height: 299,
                    width: 735,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                      child: Image.network(
                        widget.concernDetails.imageURLs![index],
                        fit: BoxFit.cover,
                      ),
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
                  left: 39, right: 39, top: 32, bottom: 17),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Stack(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    const SizedBox(height: 7),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(widget.concernDetails.title,
                          style: const TextStyle(
                              fontSize: 27,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700)),
                    ),
                    const SizedBox(height: 7),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallDetailsText(
                            title: 'Author :   ',
                            details: widget.concernDetails.nickname,
                          ),
                          SmallDetailsText(
                            title: '',
                            details: getFormattedDate(widget.concernDetails),
                          ),
                        ]),
                    const SizedBox(height: 3),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallDetailsText(
                              title: 'Urgency :   ',
                              details: widget.concernDetails.urgency),
                          SmallDetailsText(
                              title: '',
                              details: getFormattedTime(widget.concernDetails)),
                        ]),
                    const SizedBox(height: 3),
                    SmallDetailsText(
                      title: 'Location :   ',
                      details: widget.concernDetails.location,
                    ),
                    SmallDetailsText(
                      title: 'Status :   ',
                      details: widget.concernDetails.status,
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        const Text(
                          'Department :  ',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        EditConcernDropdown(
                          width: 255,
                          child: DropdownButton<String>(
                            iconEnabledColor: Colors.white,
                            padding: const EdgeInsets.only(top: 0, bottom: 0),
                            hint: Text(
                              widget.concernDetails.department,
                              style: const TextStyle(
                                  color: Colors.white,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            isExpanded: true,
                            dropdownColor: Colors.green,
                            style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 15,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.white),
                            underline: const SizedBox.square(),
                            value: _selectedDepartment,
                            items: departments.map((item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              );
                            }).toList(),
                            onChanged: (item) {
                              setState(() {
                                _selectedDepartment = item!;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 189,
                      width: double.infinity,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Text(
                          widget.concernDetails.description,
                          style: const TextStyle(
                            fontSize: 15,
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
                  bottom: 7,
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
                        onTap: () async {
                          await saveUpdatedConcern(
                            context,
                            _selectedDepartment,
                            widget.concernDetails.dateTime,
                          );
                        },
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
