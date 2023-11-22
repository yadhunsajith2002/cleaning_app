import 'dart:io';

import 'package:cleaning_app/controller/contractDetails/contract_controller.dart';
import 'package:cleaning_app/controller/task_controller/task_controller.dart';
import 'package:cleaning_app/view/task_details_screen/date_time_screen/date_time_screen.dart';
import 'package:cleaning_app/view/screen_home/screen_home.dart';
import 'package:cleaning_app/view/view_workers/view_workers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class TaskDetailsScreen extends StatefulWidget {
  TaskDetailsScreen({super.key, required this.companyName});

  final String companyName;

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<TaskController>(context, listen: false).getDateTime();
  }

  @override
  Widget build(BuildContext context) {
    final taskProvider = context.watch<TaskController>();
    final taskProviderRead = context.read<TaskController>();
    final providerWatch = context.watch<ContractController>();
    final providerRead = context.read<ContractController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
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
                              taskProviderRead.onScreenChange(index: 0);
                            },
                            child: Container(
                              height: 35,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                  color: taskProvider.currentIndex == 0
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
                              taskProviderRead.onScreenChange(index: 1);
                            },
                            child: Container(
                              height: 35,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                  color: taskProvider.currentIndex == 1
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
                      taskProvider.currentIndex == 0
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
                                        await taskProviderRead.selectImage();
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
                                taskProvider.imageList.length == 0
                                    ? SizedBox()
                                    : Container(
                                        child: GridView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount:
                                              taskProvider.imageList.length,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisSpacing: 10,
                                                  mainAxisSpacing: 10,
                                                  crossAxisCount: 3),
                                          itemBuilder: (context, index) {
                                            return ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: Image.file(
                                                File(taskProvider
                                                    .imageList[index].path),
                                                fit: BoxFit.cover,
                                              ),
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
                                        taskProviderRead.onPayMode(1);
                                      },
                                      child: Chip(
                                        backgroundColor:
                                            taskProvider.paymentMethod == 1
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
                                        taskProviderRead.onPayMode(2);
                                      },
                                      child: Chip(
                                        backgroundColor:
                                            taskProvider.paymentMethod == 2
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
                          : DateTimeScreen(),
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
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  backgroundColor: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 25),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: Lottie.asset(
                            "assets/animations/Animation - 1700660573236.json",
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
          Future.delayed(Duration(seconds: 3), () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => ScreenHome()));
          });
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
}
