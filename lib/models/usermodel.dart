class usermodel {
  final String username;
  final String email;
  final String dp;

  usermodel({required this.username, required this.email, required this.dp});
  tojson()
  {
    return{'username':username,'email':email,'profilepic':dp};
  }
}