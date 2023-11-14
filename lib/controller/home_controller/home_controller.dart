// import 'package:flutter/material.dart';

// class HomeController extends ChangeNotifier {
//   late DateTime selectedDate;
//   late TimeOfDay selectedTime;

//   Future<void> selectDate(BuildContext context) async {
//     final DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2101),
//     );

//     if (pickedDate != null && pickedDate != selectedDate) {
//       selectedDate = pickedDate;
//     }
//     notifyListeners();
//   }

//   Future<void> selectTime(BuildContext context) async {
//     final TimeOfDay? pickedTime = await showTimePicker(
//       context: context,
//       initialTime: selectedTime,
//     );

//     if (pickedTime != null && pickedTime != selectedTime) {
//       selectedTime = pickedTime;
//     }
//     notifyListeners();
//   }
// }
