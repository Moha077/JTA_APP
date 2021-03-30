class Etudiant {
  String nom, prenom, email, group;
  bool absent;
  Etudiant({this.prenom, this.nom, this.email, this.absent, this.group});
  Etudiant.fromJason(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    nom = map['nom'];
    prenom = map['prenom'];
    email = map['email'];
    group = map['group'];
    absent = map['absent'];
  }
  toJson() {
    return {
      'nom': nom,
      'prenom': prenom,
      'email': email,
      'absent': absent,
      'group': group,
    };
  }
}
