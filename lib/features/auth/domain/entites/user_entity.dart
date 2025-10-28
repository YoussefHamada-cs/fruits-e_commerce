
class UserEntity {
 
  final String email;
  final String name;
  final String uid;

  const UserEntity({
    required this.email,
    required this.name,
    required this.uid,
  });
  toMap() {
    return {
      'email': email,
      'name': name,
      'uid': uid,
    };
  }
}
