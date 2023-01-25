import 'dart:developer';

import 'package:babble/models/user.dart' as user_model;
import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<ConfirmationResult> signInWeb(String phoneNumber) {
    return _firebaseAuth.signInWithPhoneNumber(phoneNumber);
  }

  Future<UserCredential?> verify(
      ConfirmationResult confirmationResult, String code) async {
    log(confirmationResult.verificationId);
    try {
      return await confirmationResult.confirm(code);
    } catch (e) {
      return null;
    }
  }

  user_model.User? get() {
    if (_firebaseAuth.currentUser == null) return null;
    user_model.User _ = user_model.User(
      id: _firebaseAuth.tenantId!,
      username: _firebaseAuth.currentUser!.uid,
      displayName: _firebaseAuth.currentUser!.displayName!,
      profilePicLink: _firebaseAuth.currentUser!.photoURL,
    );
    return _;
  }
}
