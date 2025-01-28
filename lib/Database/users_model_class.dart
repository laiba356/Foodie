import 'dart:convert';

class UsersModelClass {
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? dateOfBirth;
  String? gender;
  //File? _profileImage;

  static const tableName = 'Users';
  static const colFirstName = 'FirstName';
  static const colLastName = 'LastName';
  static const colEmail = 'Email';
  static const colPhoneNumber = 'PhoneNumber';
  static const colDateOfBirth = 'DateOfBirth';
  static const colGender = 'Gender';

  static const createTable = '''
  CREATE TABLE $tableName (
    $colFirstName TEXT,
    $colLastName TEXT,
    $colEmail TEXT PRIMARY KEY,
    $colPhoneNumber TEXT,
    $colDateOfBirth TEXT,
    $colGender TEXT
  )
  ''';

  UsersModelClass({
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.dateOfBirth,
    this.gender,
  });

  UsersModelClass copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? dateOfBirth,
    String? gender,
  }) {
    return UsersModelClass(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      colFirstName: firstName,
      colLastName: lastName,
      colEmail: email,
      colPhoneNumber: phoneNumber,
      colDateOfBirth: dateOfBirth,
      colGender: gender,
    };
  }

  factory UsersModelClass.fromMap(Map<String, dynamic> map) {
    return UsersModelClass(
      firstName: map[colFirstName],
      lastName: map[colLastName],
      email: map[colEmail],
      phoneNumber: map[colPhoneNumber],
      dateOfBirth: map[colDateOfBirth],
      gender: map[colGender],
    );
  }

  String toJson() => json.encode(toMap());

  factory UsersModelClass.fromJson(String source) =>
      UsersModelClass.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UsersModelClass(FirstName: $firstName, LastName: $lastName, Email: $email, PhoneNumber: $phoneNumber, DateOfBirth: $dateOfBirth, Gender: $gender)';
  }

  @override
  bool operator ==(covariant UsersModelClass other) {
    if (identical(this, other)) return true;

    return other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.phoneNumber == phoneNumber &&
        other.dateOfBirth == dateOfBirth &&
        other.gender == gender;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        phoneNumber.hashCode ^
        dateOfBirth.hashCode ^
        gender.hashCode;
  }
}
