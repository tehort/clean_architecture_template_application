class Constants {
  Constants({
    required this.authorizationTokenApiKey,
    required this.requireAuthorizationTokenHeaderKey,
    required this.authorizationTokenStorageKey,
    required this.refreshTokenApiKey,
    required this.requireRefreshTokenOptionKey,
    required this.refreshTokenStorageKey,
  });

  final String authorizationTokenApiKey;
  final String requireAuthorizationTokenHeaderKey;
  final String authorizationTokenStorageKey;

  final String refreshTokenApiKey;
  final String requireRefreshTokenOptionKey;
  final String refreshTokenStorageKey;
}
