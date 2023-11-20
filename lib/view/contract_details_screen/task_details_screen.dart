import 'dart:io';

import 'package:cleaning_app/controller/contractDetails/contract_controller.dart';
import 'package:cleaning_app/view/screen_home/screen_home.dart';
import 'package:cleaning_app/view/view_workers/view_workers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TaskDetailsScreen extends StatefulWidget {
  TaskDetailsScreen({super.key, required this.companyName});

  final String companyName;

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  final ImagePicker imagePicker = ImagePicker();
  List<XFile> imageList = [];
  selectImage() async {
    final List<XFile> selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages.isNotEmpty) {
      imageList.addAll(selectedImages);
    }
    setState(() {});
  }

  int currentIndex = 0;
  late DateTime selectedDate;
  late TimeOfDay selectedTime;
  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    selectedTime = TimeOfDay.now();
  }

  int? paymentMethod;

  @override
  Widget build(BuildContext context) {
    final providerWatch = context.watch<ContractController>();
    final providerRead = context.read<ContractController>();
    final localizations = MaterialLocalizations.of(context);
    final time = localizations.formatTimeOfDay(selectedTime);
    final date = DateFormat.yMMMEd().format(selectedDate);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.close,
              color: Colors.white,
            )),
        title: Text(
          widget.companyName,
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 26, fontWeight: FontWeight.w500),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(60))),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                currentIndex = 0;
                              });
                            },
                            child: Container(
                              height: 35,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                  color: currentIndex == 0
                                      ? Colors.green
                                      : Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  "Details",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                currentIndex = 1;
                              });
                            },
                            child: Container(
                              height: 35,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                  color: currentIndex == 1
                                      ? Colors.green
                                      : Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  "Date & Time",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      currentIndex == 0
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Task Title",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Card(
                                  color: Colors.white,
                                  elevation: 0,
                                  child: Container(
                                    height: 40,
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide.none)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Describe your task",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Card(
                                  color: Colors.white,
                                  elevation: 0,
                                  child: Container(
                                    height: 150,
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        child: TextField(
                                          maxLines: 5,
                                          style: TextStyle(color: Colors.black),
                                          decoration: InputDecoration(
                                              hintStyle: TextStyle(
                                                  color: Colors.black),
                                              hintMaxLines: 5,
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide.none)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.download,
                                      color: Colors.green,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        await selectImage();
                                      },
                                      child: Text(
                                        "Upload attachments",
                                        style: GoogleFonts.poppins(
                                            color: Colors.green,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                imageList.length == 0
                                    ? SizedBox()
                                    : Container(
                                        child: GridView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: imageList.length,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisSpacing: 10,
                                                  mainAxisSpacing: 10,
                                                  crossAxisCount: 3),
                                          itemBuilder: (context, index) {
                                            return Image.file(
                                              File(imageList[index].path),
                                              fit: BoxFit.cover,
                                            );
                                          },
                                        ),
                                      ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Address",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Card(
                                  color: Colors.white,
                                  elevation: 0,
                                  child: Container(
                                    height: 40,
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                            suffixIcon: Icon(
                                              Icons.location_on_outlined,
                                              color: Colors.grey,
                                            ),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide.none)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  " How much workers do you want ?",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                providerWatch.workersList.isNotEmpty
                                    ? Container(
                                        child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount:
                                              providerWatch.workersList.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Card(
                                                color: Colors.white,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      height: 50,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          image: DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image: NetworkImage(
                                                                  providerWatch
                                                                      .workersList[
                                                                          index]
                                                                      .image))),
                                                    ),
                                                    Text(
                                                      providerWatch
                                                          .workersList[index]
                                                          .name,
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 60,
                                                    ),
                                                    IconButton(
                                                        onPressed: () {
                                                          providerRead
                                                              .removeWorkerByIndex(
                                                                  index);
                                                        },
                                                        icon: Icon(Icons.close))
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                    : SizedBox(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) {
                                            return ViewWorkersScreen(
                                              companyName: widget.companyName,
                                            );
                                          },
                                        ));
                                      },
                                      child: Text(
                                        providerWatch.workersList.isNotEmpty
                                            ? "Add more"
                                            : "Select Workers",
                                        style: GoogleFonts.poppins(
                                            color: Colors.green,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "5. Payement Method?",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          paymentMethod = 1;
                                        });
                                      },
                                      child: Chip(
                                        backgroundColor: paymentMethod == 1
                                            ? Colors.green
                                            : Colors.grey.shade400,
                                        label: Text("Online Payment"),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          paymentMethod = 2;
                                        });
                                      },
                                      child: Chip(
                                        backgroundColor: paymentMethod == 2
                                            ? Colors.green
                                            : Colors.grey.shade400,
                                        label: Text("COD"),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 80,
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                Text(
                                  "When should we arrive at your doorsteps ?",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 30),
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.green),
                                          foregroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.white),
                                        ),
                                        onPressed: () {
                                          selectDate(context);
                                        },
                                        child: Text("Change date"),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "${date} ",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 30),
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.green),
                                          foregroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.white),
                                        ),
                                        onPressed: () {
                                          selectTime(context);
                                        },
                                        child: Text("Change Time"),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "${time} ",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => ScreenHome()));
        },
        child: Card(
          color: Colors.green[600],
          elevation: 0,
          child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  "Continue",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.w600),
                ),
              )),
        ),
      ),
    );
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      selectedDate = pickedDate;
      setState(() {});
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }
}
