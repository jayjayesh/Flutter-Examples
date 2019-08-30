class Member {
  final String loginName;
  final String avatarURL;

  Member(this.loginName, this.avatarURL) {
    if (loginName == null) {
      throw ArgumentError("loginName can not be null." "Recived:'$loginName'");
    }

    if (avatarURL == null) {
      throw ArgumentError("avatarURL can not be null." "Recived:'$avatarURL'");
    }
  }
}
