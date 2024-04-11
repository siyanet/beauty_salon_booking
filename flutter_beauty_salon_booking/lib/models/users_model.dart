  class usermodel {
    String id;
    String firstName;
    String lastName;
    String phoneNumber;
    String role;

    usermodel(this.id, this.firstName,this.lastName, this.phoneNumber,this.role);

    Map<String, dynamic> userMap() {
      return {
        'first_name': firstName,
        'last_name': lastName,
        "phone_number": phoneNumber,
        "role": role,
      };
    }
  }