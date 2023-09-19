import 'package:get/get.dart';
import 'package:yeye/Common/time_for_calendar.dart';
import 'package:yeye/Models/food_model.dart';
import 'package:yeye/Service/firebase.dart';

class MaintenanceController extends GetxController {
  Rx<FoodModel> foodModel = FoodModel().obs;

  @override
  void onInit() {
    super.onInit();
    fetchFood(currentDate);
  }

  void fetchFood(String date) async {
    firestore
        .collection('Samsun Üniversitesi')
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
