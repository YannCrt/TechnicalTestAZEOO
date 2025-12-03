class Birthday {
  String? value;
  String? permission;

  Birthday({this.value, this.permission});

  factory Birthday.fromJson(Map<String, dynamic> json) {
    return Birthday(
      value: json['value'] as String?,
      permission: json['permission'] as String?,
    );
  }
}
