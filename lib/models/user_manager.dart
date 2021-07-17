import 'package:firebase_auth/firebase_auth.dart';
import 'package:loja_virtual/helpers/firebase_errors.dart';
import 'package:loja_virtual/models/users.dart';

class UserManager {

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signIn({Users? users, required Function onFail, Function? onSuccess}) async {
    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
          email: users!.email, password: users.password);

      print(result.user!.uid);

      onSuccess!();
    } on FirebaseAuthException catch(e) {
      print(getErrorString(e.code));
      onFail(getErrorString(e.code));
    }
  }
}