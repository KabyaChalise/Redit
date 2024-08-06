import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:reddit/core/constants/constants.dart';
import 'package:reddit/core/constants/firebase_constant.dart';
import 'package:reddit/core/providers/firebase_provider.dart';
import 'package:reddit/models/user_model.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
    firestore: ref.read(firestoreProvider),
    auth: ref.read(authProvider),
    googleSignIn: ref.read(googleSignInProvider),
  ),
);

class AuthRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  AuthRepository({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
    required GoogleSignIn googleSignIn,
  })  : _firestore = firestore,
        _auth = auth,
        _googleSignIn = googleSignIn;
  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);
  void signInWithGoogle() async {
    try {
      log("Signing in with Google");
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      log("Hello 1");

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      UserModel userModel = UserModel(
        name: userCredential.user?.displayName ?? "No Name",
        profilePic: userCredential.user?.photoURL ?? Constants.avatarDefault,
        banner: Constants.bannerDefault,
        uuid: userCredential.user!.uid,
        isAuthenticated: true,
        karma: 0,
        awards: [],
      );
      log("Hello 2");
      await _users.doc(userCredential.user!.uid).set(userModel.toMap());

      log("Hello ${userCredential.user?.email}");
    } catch (e) {
      log(e.toString());
    }
  }
}
