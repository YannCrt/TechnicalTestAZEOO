class Picture {
  String? url;
  String? label;

  Picture({this.url, this.label});

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      url: json['url'] as String?,
      label: json['label'] as String?,
    );
  }
}
