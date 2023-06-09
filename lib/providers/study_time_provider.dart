import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

// Create new provider
class StudyTimeProvider with ChangeNotifier {
  // Provider attributes to be access
  TimeOfDay startTime = TimeOfDay(hour: 8, minute: 30);
  TimeOfDay endTime = TimeOfDay(hour: 22, minute: 30);

  //  getters for the attributes, used to acess the data
  TimeOfDay get startTimeGetter => startTime;
  TimeOfDay get endTimeGetter => endTime;

  // Set the attribute values using (provider name).startTime = inputtedTime
  set startTimeSetter(TimeOfDay inputtedTime) {
    startTime = inputtedTime;
    notifyListeners();
  }

  set endTimeSetter(TimeOfDay inputtedTime) {
    endTime = inputtedTime;
    notifyListeners();
  }

  // To manually notify all listeners
  void changeListeners() {
    notifyListeners();
  }
}
