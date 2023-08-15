import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yeye/Constants/app_texts.dart';

import '../../Common/time_for_calendar.dart';
import '../../Models/food_model.dart';
import '../../Service/firebase.dart';

class MenuScreenController extends GetxController {
  var formattedDate = ''.obs;
  var stream = ''.obs;
  var ratingstream = ''.obs;
  var ratingVisible = false.obs;
  var foodVisible = false.obs;
  Rx<FoodModel> foodModel = FoodModel().obs;

  @override
  void onInit() {
    super.onInit();
    formattedDate.value = DateFormat('dd-MM-yyyy').format(currentTime);
    fetchFood(formattedDate.value);
  }

  void onDateSelected(BuildContext context) async {
    DateTime? pickedDate = await selectDate(context, endOfMonth);
    if (pickedDate != null) {
      formattedDate.value = DateFormat('dd-MM-yyyy').format(pickedDate);
      fetchFood(formattedDate.value);
    }
  }

  void fetchFood(String date) async {
    final university = await getSpecificData(UserFields.university);

    firestore
        .collection(university)
        .doc('foods')
        .collection(collectionDateForAll)
        .doc(date)
        .snapshots()
        .map((doc) => FoodModel.fromMap(doc))
        .listen((data) {
      foodModel.value = data;
    });
  }
}

getSpecificData(String specific) async {
  final doc = await firestore
      .collection('users')
      .doc('createdUsers')
      .collection('allUsers')
      .doc(auth.currentUser!.uid)
      .get();
  return doc[specific].toString();
}
