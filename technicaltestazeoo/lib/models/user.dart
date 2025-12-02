import 'package:technicaltestazeoo/models/picture.dart'; // importation du type "Picture" (car c'est à deux paramètres : "url" et "label") grâce à dart:ui

class User {
  // Par rapport au champs, j'ai décidé de les choisirs en fonction de mes préférences car il y en beaucoup, j'ai pris ceux qui selon moi était les plus cohérents.
  // (et pour avoir de la matière mais pas trop !).
  int id;
  String first_name;
  String last_name;
  String email;
  String? info;
  // champs optionnel car soit ce ne sont pas des données réellement pertinents, soit des données comme gender où plusieurs choix sont fait.
  List<Picture> picture; // liste avec Picture comme type (voir import en haut)
  String? countryFlag;
  String? gender;
  String? birthday;

  User({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.email,
    this.info,
    this.picture = const [],
    this.countryFlag,
    this.gender,
    this.birthday,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    first_name: json['first_name'],
    last_name: json['last_name'],
    email: json['email'],
    info: json['info'],
    picture:
        (json['picture'] as List?)?.map((p) => Picture.fromJson(p)).toList() ??
        [],
    countryFlag: json['countryFlag'],
    gender: json['gender'],
    birthday: json['birthday'],
  );
}
