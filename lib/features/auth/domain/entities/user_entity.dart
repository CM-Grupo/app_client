class UserEntity {
  final String uid;
  final String email;
  final String? displayName;
  final String? photoUrl;

  UserEntity({
    required this.uid,
    required this.email,
    this.displayName,
    this.photoUrl,
  });
}

// esta clase no depende de firebase ni de flutter