import 'package:technicaltestazeoo/models/birthday.dart';
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
  List<Picture>? picture; // liste avec Picture comme type (voir import en haut)
  String? countryFlag;
  String? gender;
  Birthday? birthday;

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
    id: json['id'] as int,
    first_name: json['first_name'].toString(),
    last_name: json['last_name'].toString(),
    email: json['email'].toString(),
    info: json['info']?.toString(),
    picture:
        (json['picture'] as List<dynamic>?)
            ?.map((p) => Picture.fromJson(p as Map<String, dynamic>))
            .toList() ??
        [],
    countryFlag: json['country_flag']?.toString(),
    gender: json['gender']?.toString(),
    birthday: json['birthday'] != null
        ? Birthday.fromJson(json['birthday'])
        : null, // ✅ objet unique
  );
}
