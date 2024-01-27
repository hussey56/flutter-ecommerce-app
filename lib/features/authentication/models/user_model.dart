import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom3/utils/formatters/formatters.dart';

class UserModel {
  final String id;
  String firstname;
  String lastname;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  // Constructor
  UserModel({
    required this.email,
    required this.id,
    required this.username,
    required this.firstname,
    required this.lastname,
    required this.profilePicture,
    required this.phoneNumber
  });

  // Helper functions
  String get fullName => '$firstname $lastname';

  String get formattedPhoneNumber => HFormatter.formatPhoneNumber(phoneNumber);

  static List<String> nameParts(fullName) => fullName.split(" ");

  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstname = nameParts[0].toLowerCase();
    String lastname = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstname$lastname";
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;
  }

  static UserModel empty() =>
      UserModel(email: "",
          id: "",
          username: "",
          firstname: "",
          lastname: "",
          profilePicture: "",
          phoneNumber: "");

  Map<String, dynamic> toJson() {
    return {
      "FirstName": firstname,
      "LastName": lastname,
      "Username": username,
      "Email": email,
      "PhoneNumber": phoneNumber,
      "ProfilePicture": profilePicture
    };
  }
  //
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document){
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
          email: data['Email']??'',
          id: document.id,
          username: data['Username']??'',
          firstname: data['FirstName']??'',
          lastname: data['LastName']??'',
          profilePicture: data['ProfilePicture']??'',
          phoneNumber: data['PhoneNumber']??'');
    }else{
      return UserModel.empty();
    }

  }
}