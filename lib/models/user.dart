class User {
  final int userId;
  final String username;
  final String email;
  final String password;
  final String nom;
  final String prenom;
  final String regTime;
  final String profile;
  User(
      {this.userId,
      this.username,
      this.email,
      this.password,
      this.nom,
      this.prenom,
      this.regTime,
      this.profile});

  User fromMap(Map<String, dynamic> map) {
    return User(
        userId: map["user_id"],
        username: map["username"],
        email: map["email"],
        password: map["password"],
        nom: map["nom"],
        prenom: map["prenom"],
        regTime: map["reg_time"],
        profile: map["profile"]);
  }

  String toStringJson({String token}) {
    if (token == null)
      return '{"user_id": "${this.userId}", "username": "${this.username}", "email": "${this.email}", "password": "${this.password}", "nom": "${this.nom}", "prenom": "${this.prenom}", "reg_time": "${this.regTime}", "profile": "${this.profile}"}';
    return '{"user_id": ${this.userId}, "username": "${this.username}", "email": "${this.email}", "password": "${this.password}", "nom": "${this.nom}", "prenom": "${this.prenom}", "reg_time": "${this.regTime}", "profile": "${this.profile}", "token": "$token"}';
  }
}
