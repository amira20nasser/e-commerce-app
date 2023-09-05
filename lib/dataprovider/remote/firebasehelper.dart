import 'package:ecommerce/providers/custom_api_service.dart';
import 'package:ecommerce/providers/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBaseHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final customApiService = CustomApiService();

  String getCurrentUsername() {
    User? user = _auth.currentUser;
    if (user != null) {
      return user.displayName ?? '';
    } else {
      return '';
    }
  }

  String getCurrentUserId() {
    User? user = _auth.currentUser;
    if (user != null) {
      return user.uid;
    } else {
      return '';
    }
  }

  String getCurrentUserEmail() {
    User? user = _auth.currentUser;
    if (user != null) {
      return user.email.toString();
    } else {
      return '';
    }
  }

  Future<dynamic> signUp(String email, String password, String name) async {
    try {
      UserCredential user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await user.user!.updateDisplayName(name);
      if (user.user?.uid != null) {
        customApiService.addUser(name, user.user!.uid, email);
      }
      await user.user?.reload();
      if (user.user != null) return user.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        return "This email is already used.";
      } else if (e.code == "weak-password") {
        return "The password is too weak.";
      }
    }
  }

  Future<dynamic> signIn(String email, String password) async {
    try {
      UserCredential user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (user.user != null) {
        return user.user;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<dynamic> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential user = await _auth.signInWithCredential(credential);
      if (user.user?.uid != null) {
        try {
          await customApiService.fetchDataByName(user.user!.email ?? '');
        } catch (e) {
          customApiService.addUser(
            user.user!.displayName.toString(),
            user.user!.uid,
            user.user!.email.toString(),
          );
        }
      }
      return user.user;
    } catch (e) {
      return e.toString();
    }
  }

  Future<dynamic> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    debugPrint(UserData().email);
  }
}
