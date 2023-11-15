import 'package:cleaning_app/global%20widgets/custom_icon.dart';
import 'package:searchfield/searchfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

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
          Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                    "1.When should we arrive at your doorsteps?",
                    style: GoogleFonts.poppins(
                        fontSize: 17, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
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
                      Text("${date} ")
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
                      Text("${time} "),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "2. How much workers do you want?",
                    style: GoogleFonts.poppins(
                        fontSize: 17, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
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
                    height: 20,
                  ),
                  Text(
                    "3. Your Home Town?",
                    style: GoogleFonts.poppins(
                        fontSize: 17, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
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
                ],
              ),
            ),
          )
        ],
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
