import 'package:flutter/material.dart';
import 'package:cleaning_app/db/company_dv/company_db.dart';
import 'package:cleaning_app/db/service_db/data_base.dart';
import 'package:cleaning_app/global%20widgets/custom_icon.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CompanyDetails extends StatefulWidget {
  CompanyDetails({super.key, required this.index});

  final int index;

  @override
  State<CompanyDetails> createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<CompanyDetails> {
  late ValueNotifier<DateTime> selectedDate;
  late TimeOfDay selectedTime;

  @override
  void initState() {
    super.initState();
    selectedDate = ValueNotifier(DateTime.now());
    selectedTime = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = MaterialLocalizations.of(context);
    final time = localizations.formatTimeOfDay(selectedTime);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustumIcon(fontSize: 20),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              " Top Companies for ",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "${servicesData[widget.index].name}",
              style: TextStyle(fontSize: 24, color: Colors.green),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: companyData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                      color: Colors.white,
                      child: ExpansionTile(
                        expandedAlignment: Alignment.topLeft,
                        childrenPadding: EdgeInsets.all(15),
                        title: Text(
                          companyData[index].companyName,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          "One of the most popular company",
                          style: TextStyle(color: Colors.grey),
                        ),
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Location  :  ${companyData[index].Location}",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "Total Workers  :  ${companyData[index].totalWorkers}",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Total Rating  : ",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    " ${companyData[index].rating}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.green),
                              foregroundColor:
                                  MaterialStatePropertyAll(Colors.white),
                            ),
                            onPressed: () {
                              showBottom(context, index, time);
                            },
                            child: Text("Add to Contract"),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> showBottom(BuildContext context, int index, String time) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "${companyData[index].companyName}",
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
                    "1.When should we arrive at your doorsteps?",
                    style: GoogleFonts.poppins(
                        fontSize: 17, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ValueListenableBuilder<DateTime>(
                    valueListenable: selectedDate,
                    builder: (context, value, child) {
                      final date = DateFormat.yMMMEd().format(value);
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
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
                          SizedBox(
                            width: 30,
                          ),
                          Text("${date} ")
                        ],
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${time} "),
                      SizedBox(
                        width: 50,
                      ),
                      ElevatedButton(
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
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "2. How much workers do you want?",
                    style: GoogleFonts.poppins(
                        fontSize: 17, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 40,
                    width: 55,
                    color: Colors.white,
                    child: Center(
                      child: TextField(
                        showCursor: false,
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "3. Share your location?",
                    style: GoogleFonts.poppins(
                        fontSize: 17, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
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
