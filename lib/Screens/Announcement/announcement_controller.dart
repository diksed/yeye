import 'package:get/get.dart';
import 'package:yeye/Common/time_for_calendar.dart';
import 'package:yeye/Constants/app_texts.dart';
import 'package:yeye/Models/announcement_model.dart';
import 'package:yeye/Screens/Menu/menu_controller.dart';
import 'package:yeye/Service/firebase.dart';

class AnnouncementController extends GetxController {
  RxList<AnnouncementModel> announcementListStream = <AnnouncementModel>[].obs;
  late List<AnnouncementModel> announcement = <AnnouncementModel>[];

  void fetchAnnouncements() async {
    final university = await getSpecificData(UserFields.university);
    final campus = await getSpecificData(UserFields.campus);

    firestore
        .collection('universities')
        .doc(university)
        .collection('campuses')
        .doc(campus)
        .collection(collectionDateForCurrentTime)
        .doc('announcement')
        .collection(currentDate)
        .orderBy('timeStamp', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => AnnouncementModel.fromMap(doc)).toList())
        .listen((data) {
      announcementListStream.value = data;
    });
  }
}
