class SdkConfig {
  final String baseUrl;
  final String token;
  final bool debug;

  const SdkConfig({
    required this.baseUrl,
    required this.token,
    this.debug = false,
  });
}
