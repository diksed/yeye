import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yeye/Constants/app_texts.dart';
import '../../Common/time_for_calendar.dart';
import '../../Models/food_model.dart';
import '../../Models/rating_model.dart';
import '../../Service/firebase.dart';

class MenuScreenController extends GetxController {
  var formattedDate = ''.obs;
  Rx<DateTime> selectedPickedDate = DateTime.now().obs;
  var stream = ''.obs;
  var ratingstream = ''.obs;
  var ratingVisible = true.obs;
  var foodVisible = false.obs;

  final rateButtonVisible = true.obs;
  final isContainerVisible = false.obs;
  final starRating = 0.0.obs;

  Rx<FoodModel> foodModel = FoodModel().obs;
  RxList<RatingModel> ratingListStream = <RatingModel>[].obs;

  void onRateButtonPressed(String today) {
    rateButtonVisible.value = false;
    isContainerVisible.value = true;
  }

  void onRatingUpdate() {
    final rating =
        RatingModel(email: getCurrentUser(), rating: starRating.value);
    createRating(rating, currentDate, collectionDateForCurrentTime);
    isContainerVisible.value = false;
  }

  Future createRating(
      RatingModel rating, formattedDate, String collectionDate) async {
    final university = await getSpecificData(UserFields.university);
    final campus = await getSpecificData(UserFields.campus);
    final docRating = firestore
        .collection(university)
        .doc(campus)
        .collection(collectionDateForCurrentTime)
        .doc('rating')
        .collection(formattedDate)
        .doc(rating.email);

    final json = rating.toMap();

    await docRating.set(json);
  }

  void onDateSelected(BuildContext context) async {
    DateTime? pickedDate = await selectDate(context, endOfMonth);
    if (pickedDate != null) {
      formattedDate.value = DateFormat('dd-MM-yyyy').format(pickedDate);
      selectedPickedDate.value = pickedDate;
      if (!isWeekend(pickedDate)) {
        fetchFood(formattedDate.value);
        fetchRatings(formattedDate.value);
      }
      if (formattedDate.contains(formattedCurrentDate)) {
        if (isBetweenTimes()) {
          ratingVisible.value = true;
        } else {
          ratingVisible.value = false;
        }
      } else {
        ratingVisible.value = false;
      }
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

  void fetchRatings(String date) async {
    final university = await getSpecificData(UserFields.university);
    final campus = await getSpecificData(UserFields.campus);

    firestore
        .collection(university)
        .doc(campus)
        .collection(collectionDateForAll)
        .doc('rating')
        .collection(date)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => RatingModel.fromMap(doc)).toList())
        .listen((data) {
      ratingListStream.value = data;
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
  if (specific == UserFields.suspended) {
    return doc[specific];
  } else {
    return doc[specific].toString();
  }
}
