class User {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String password;

  User({required this.firstName, required this.lastName, required this.email, required this.phoneNumber, required this.password});
  
  @override
  String toString() {
    return 'First name: $firstName, lastName: $lastName';
  }
}

