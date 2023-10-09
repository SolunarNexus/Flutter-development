class UserDetails {
  final String name;
  final String surname;

  const UserDetails({required this.name, required this.surname});

  UserDetails copyWith({String? name, String? surname}) {
    return UserDetails(
      name: name ?? this.name,
      surname: surname ?? this.surname,
    );
  }
}
