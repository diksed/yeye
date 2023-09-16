import '../../Models/delete_user_model.dart';
import '../../Service/firebase.dart';

Future deleteUser(DeleteUserModel deleteUser) async {
  final docDelete = firestore
      .collection('users')
      .doc('deletedUsers')
      .collection('allUsers')
      .doc(auth.currentUser!.email);

  final json = deleteUser.toMap();

  await docDelete.set(json);
}
