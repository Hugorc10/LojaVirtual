import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/helpers/firebase_errors.dart';
import 'package:loja_virtual/models/users.dart';

class UserManager extends ChangeNotifier {

  final FirebaseAuth auth = FirebaseAuth.instance;

  bool loading = false;

  Future<void> signIn({Users? users, required Function onFail, Function? onSuccess}) async {
    setLoading(true);
    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
          email: users!.email, password: users.password);

      // await Future.delayed(Duration(seconds: 4));

      onSuccess!();
    } on FirebaseAuthException catch(e) {
      print(getErrorString(e.code));
      onFail(getErrorString(e.code));
    }

    setLoading(false);
  }

  void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }
}