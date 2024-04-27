  class UserModel {
    String id;
    String firstName;
    String lastName;
    String phoneNumber;
    String role;

    UserModel({required this.id, required this.firstName,required this.lastName,required this.phoneNumber,required this.role});

    Map<String, dynamic> userMap() {
      return {
        'first_name': firstName,
        'last_name': lastName,
        "phone_number": phoneNumber,
        "role": role,
      };
    }
  }