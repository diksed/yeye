import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yeye/Constants/app_texts.dart';

import '../../Common/time_for_calendar.dart';
import '../../Models/food_model.dart';

class MenuScreenController extends GetxController {
  var formattedDate = ''.obs;
  var stream = ''.obs;
  var ratingstream = ''.obs;
  var ratingVisible = false.obs;
  var foodVisible = false.obs;
  Rx<FoodModel> foodModel = FoodModel().obs;
  


  void onDateSelected(BuildContext context) async {
    DateTime? pickedDate = await selectDate(context, endOfMonth);
    if (pickedDate != null) {
      formattedDate.value = DateFormat('yyyy-MM-dd').format(pickedDate);
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

final FirebaseAuth auth = FirebaseAuth.instance;
final FirebaseFirestore firestore = FirebaseFirestore.instance;

getSpecificData(String specific) async {
  final doc = await firestore
      .collection('users')
      .doc('createdUsers')
      .collection('allUsers')
      .doc(auth.currentUser!.uid)
      .get();
  return doc[specific].toString();
}
