class KakaoFormData {
  int? tokenid;
  String? nickname, profileUrl;

  KakaoFormData({
    this.tokenid,
    this.nickname,
    this.profileUrl,
  });

  Map<String, dynamic> toJson() => {
        'id': tokenid,
        'name': nickname,
        'profileUrl': profileUrl,
      };
}
