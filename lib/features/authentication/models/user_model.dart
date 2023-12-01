import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String firstName;
  final String lastName;
  final String email;
  final String? phoneNumber;
  final String? password;
  final String avatar_imgURL;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    this.phoneNumber,
    this.password,
    this.id,
    this.avatar_imgURL =
        "https://firebasestorage.googleapis.com/v0/b/hochiminh-museum-uet-project.appspot.com/o/profiles%2Fuser.png?alt=media&token=da89c7b0-4ad7-450c-8273-92f8256fe93d",
  });

  toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'avatar_imgURL': avatar_imgURL,
    };
  }

  factory UserModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    var data = document.data()!;
    return UserModel(
      id: document.id,
      email: data['email'],
      firstName: data['firstName'],
      lastName: data['lastName'],
      phoneNumber: data['phoneNumber'],
      password: data['password'],
      avatar_imgURL: data['avatar_imgURL'],
    );
  }
}
