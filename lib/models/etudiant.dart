class Etudiant {
  String nom, prenom, email;
  bool absent;
  Etudiant({
    this.prenom,
    this.email,
    this.email,
    this.absent,
  });
  Etudiant.fromJason(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    nom = map['nom'];
    prenom = map['prenom'];
    email = map['email'];
    absent = map['absent'];
  }
  toJson() {
    return {
      'nom': nom,
      'prenom': prenom,
      'email': email,
      'absent': absent,
    };
  }
}
