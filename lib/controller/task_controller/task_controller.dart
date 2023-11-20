import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TaskController extends ChangeNotifier {
  int currentIndex = 0;

  int? paymentMethod;

  late DateTime selectedDate;
  late TimeOfDay selectedTime;

  getDateTime() {
    selectedDate = DateTime.now();
    selectedTime = TimeOfDay.now();
  }

  onPayOnline() {
    paymentMethod = 1;
    notifyListeners();
  }

  onPayCod() {
    paymentMethod = 2;
    notifyListeners();
  }

  onDetailsTap() {
    currentIndex = 0;
    notifyListeners();
  }

  onDateTimeTap() {
    currentIndex = 1;
    notifyListeners();
  }

  final ImagePicker imagePicker = ImagePicker();
  List<XFile> imageList = [];
  selectImage() async {
    final List<XFile> selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages.isNotEmpty) {
      imageList.addAll(selectedImages);
    }
    notifyListeners();
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
    }
    notifyListeners();
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      selectedTime = pickedTime;

      notifyListeners();
    }
  }
}
