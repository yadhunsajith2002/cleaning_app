import 'dart:io';

import 'package:cleaning_app/global%20widgets/custom_icon.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

class ContractDetailsScreen extends StatefulWidget {
  ContractDetailsScreen({
    super.key,
    required this.companyName,
  });

  final String companyName;

  @override
  State<ContractDetailsScreen> createState() => _ContractDetailsScreenState();
}

class _ContractDetailsScreenState extends State<ContractDetailsScreen> {
  final ImagePicker imagePicker = ImagePicker();
  List<XFile> imageList = [];
  selectImage() async {
    final List<XFile> selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages.isNotEmpty) {
      imageList.addAll(selectedImages);
    }
    setState(() {});
  }

  late DateTime selectedDate;
  late TimeOfDay selectedTime;

  String selectedValue = 'Kochi';

  List<String> homeTowns = [
    'Ernakulam',
    'Kochi',
    'Banglore',
    'Delhi',
    'Chennai',
    'Trivandrum',
    'Kannur',
    'Kozhikode',
    'Aluva',
    'Wayanad',
    'Ukraine',
  ];
  bool selectPhotograph = false;

  bool whenNeedVehicle = false;
  int? selectedOption;
  int? paymentMethod;
  int? selectedPhotograph;
  int selectedVehicle = 0;
  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    selectedTime = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = MaterialLocalizations.of(context);
    final time = localizations.formatTimeOfDay(selectedTime);
    final date = DateFormat.yMMMEd().format(selectedDate);
    return Scaffold(
      appBar: AppBar(
        title: CustumIcon(fontSize: 21),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.companyName,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "1.When should we arrive at your doorsteps ?",
                  style: GoogleFonts.poppins(
                      fontSize: 17, fontWeight: FontWeight.w600),
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
                              MaterialStatePropertyAll(Colors.green),
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.white),
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
                      style: TextStyle(fontSize: 18),
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
                              MaterialStatePropertyAll(Colors.green),
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.white),
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
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "2. How much workers do you want ?",
                  style: GoogleFonts.poppins(
                      fontSize: 17, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 40,
                      width: 55,
                      color: Colors.white,
                      child: Center(
                          child: Text(
                        "1",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                        ),
                      )),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(Icons.remove),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "3. Your Home Town ?",
                  style: GoogleFonts.poppins(
                      fontSize: 17, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 25,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 40,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: DropdownButton<String>(
                        menuMaxHeight: 200,
                        elevation: 10,
                        underline: SizedBox(),
                        value: selectedValue,
                        style: TextStyle(color: Colors.white),
                        items: homeTowns.map((town) {
                          return DropdownMenuItem<String>(
                            value: town,
                            child: Text(town),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "4. Do you need any vehicle service ?",
                  style: GoogleFonts.poppins(
                      fontSize: 17, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Yes",
                      style: TextStyle(fontSize: 17),
                    ),
                    Radio(
                      value: 1,
                      groupValue: selectedOption,
                      onChanged: (value) {
                        selectedOption = value;
                        whenNeedVehicle = true;

                        setState(() {});
                      },
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "No",
                      style: TextStyle(fontSize: 17),
                    ),
                    Radio(
                      value: 2,
                      groupValue: selectedOption,
                      onChanged: (value) {
                        selectedOption = value;
                        whenNeedVehicle = false;
                        setState(() {});
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                whenNeedVehicle
                    ? Column(
                        children: [
                          Text("which type of vehicle do you want ?"),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedVehicle = 0;
                                  });
                                },
                                child: Chip(
                                  backgroundColor: selectedVehicle == 0
                                      ? Colors.grey
                                      : Colors.transparent,
                                  label: Text("Lorry"),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedVehicle = 1;
                                  });
                                },
                                child: Chip(
                                  backgroundColor: selectedVehicle == 1
                                      ? Colors.grey
                                      : Colors.transparent,
                                  label: Text("Pick-Up"),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedVehicle = 2;
                                  });
                                },
                                child: Chip(
                                  backgroundColor: selectedVehicle == 2
                                      ? Colors.grey
                                      : Colors.transparent,
                                  label: Text("Goods"),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : SizedBox(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "4. Do you have any photographs for cleaning ?",
                  style: GoogleFonts.poppins(
                      fontSize: 17, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.left,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Yes",
                      style: TextStyle(fontSize: 17),
                    ),
                    Radio(
                      value: 1,
                      groupValue: selectedPhotograph,
                      onChanged: (value) {
                        selectedPhotograph = value;
                        selectPhotograph = true;

                        setState(() {});
                      },
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "No",
                      style: TextStyle(fontSize: 17),
                    ),
                    Radio(
                      value: 2,
                      groupValue: selectedPhotograph,
                      onChanged: (value) {
                        selectedPhotograph = value;
                        selectPhotograph = false;

                        setState(() {});
                      },
                    ),
                  ],
                ),
                selectPhotograph
                    ? Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.green),
                                foregroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                              ),
                              onPressed: () async {
                                await selectImage();
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("Add image"),
                                  Icon(Icons.add),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          imageList.length == 0
                              ? SizedBox(
                                  height: 15,
                                )
                              : Container(
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
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
                                )
                        ],
                      )
                    : SizedBox(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "5. Payement Method?",
                  style: GoogleFonts.poppins(
                      fontSize: 17, fontWeight: FontWeight.w600),
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
                            ? Colors.grey
                            : Colors.transparent,
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
                            ? Colors.grey
                            : Colors.transparent,
                        label: Text("COD"),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.green),
            foregroundColor: MaterialStatePropertyAll(Colors.white),
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  backgroundColor: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Data added succesfully",
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(Icons.done)
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Text("Submit"),
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
