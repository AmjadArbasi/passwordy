class UpdateUserInfoParams {
  final String displayName;
  final String newSecret;
  final String? newSecurityQuestion;
  final String newMasterPassword;
  final String masterPassword;

  UpdateUserInfoParams({
    required this.displayName,
    required this.newSecret,
    this.newSecurityQuestion,
    required this.newMasterPassword,
    required this.masterPassword,
  });
}
