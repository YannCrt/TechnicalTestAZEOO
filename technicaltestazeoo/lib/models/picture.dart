class Picture {
  String url;
  String label;

  Picture({required this.url, required this.label});

  factory Picture.fromJson(Map<String, dynamic> json) =>
      Picture(url: json['url'] ?? '', label: json['label'] ?? '');
}
