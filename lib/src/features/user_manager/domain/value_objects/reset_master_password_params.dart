class ResetMasterPasswordParams {
  final String username;
  final String newMasterPassword;
  final String secret;

  ResetMasterPasswordParams({
    required this.username,
    required this.newMasterPassword,
    required this.secret,
  });
}
