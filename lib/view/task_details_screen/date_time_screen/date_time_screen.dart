import 'package:cleaning_app/controller/task_controller/task_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DateTimeScreen extends StatelessWidget {
  const DateTimeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final taskProviderRead = context.read<TaskController>();
    final taskProviderWatch = context.watch<TaskController>();
    final localizations = MaterialLocalizations.of(context);
    final time = localizations.formatTimeOfDay(taskProviderWatch.selectedTime);
    final date = DateFormat.yMMMEd().format(taskProviderWatch.selectedDate);
    return Column(
      children: [
        Text(
          "When should we arrive at your doorsteps ?",
          style: GoogleFonts.poppins(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600),
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
                  backgroundColor: MaterialStatePropertyAll(Colors.green),
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                ),
                onPressed: () {
                  taskProviderRead.selectDate(context);
                },
                child: Text("Change date"),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "${date} ",
              style: TextStyle(fontSize: 18, color: Colors.black),
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
                  backgroundColor: MaterialStatePropertyAll(Colors.green),
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                ),
                onPressed: () {
                  taskProviderRead.selectTime(context);
                },
                child: Text("Change Time"),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "${time} ",
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
