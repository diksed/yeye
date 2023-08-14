import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yeye/Constants/app_texts.dart';

class FoodModel {
  String anaYemek;
  String araYemek;
  String corba;
  String kalori;
  String yanUrun;

  FoodModel({
    this.anaYemek = '',
    this.araYemek = '',
    this.corba = '',
    this.kalori = '',
    this.yanUrun = '',
  });

  String getFood(String item) {
    if (item == AppTexts.mainDish) {
      return anaYemek;
    } else if (item == AppTexts.sideDish) {
      return araYemek;
    } else if (item == AppTexts.soup) {
      return corba;
    } else if (item == AppTexts.sideItem) {
      return yanUrun;
    } else if (item == AppTexts.calories) {
      return kalori;
    } else {
      return 'Hata';
    }
  }

  FoodModel.fromMap(DocumentSnapshot<Map<String, dynamic>> doc)
      : anaYemek = doc['anaYemek'],
        araYemek = doc['araYemek'],
        corba = doc['corba'],
        kalori = doc['kalori'],
        yanUrun = doc['yanUrun'];

  Map<String, dynamic> toMap() {
    return {
      'anaYemek': anaYemek,
      'araYemek': araYemek,
      'corba': corba,
      'kalori': kalori,
      'yanUrun': yanUrun,
    };
  }
}
