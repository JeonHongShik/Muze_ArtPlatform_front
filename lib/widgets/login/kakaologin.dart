import 'package:artplatform/widgets/login/kakaologin_newscopr.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class Kakao_Login {
  Future<String> login() async {
    // 카카오 로그인 구현 예제

    // 카카오톡 실행 가능 여부 확인
    // 카카오톡 실행이 가능하면 카카오톡으로 로그인, 아니면 카카오계정으로 로그인
    if (await isKakaoTalkInstalled()) {
      try {
        OAuthToken token = await UserApi.instance.loginWithKakaoTalk();

        print('카카오톡으로 로그인 성공');
        loginWithNewScopes();
        loginCheck();
        return token.accessToken.toString();
      } catch (error) {
        print('카카오톡으로 로그인 실패 $error');

        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
        // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
        if (error is PlatformException && error.code == 'CANCELED') {
          rethrow;
        }
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          final token = await UserApi.instance.loginWithKakaoAccount();

          print('카카오계정으로 로그인 성공');
          loginWithNewScopes();
          loginCheck();
          return token.accessToken.toString();
        } catch (error) {
          print('카카오계정으로 로그인 실패 $error');
          rethrow;
        }
      }
    } else {
      //카카오톡 실행이 불가능한 경우 카카오계정 로그인.
      try {
        final token = await UserApi.instance.loginWithKakaoAccount();

        print('카카오계정으로 로그인 성공');
        loginWithNewScopes();
        loginCheck();
        return token.accessToken.toString();
      } catch (error) {
        print('카카오계정으로 로그인 실패 $error');
        rethrow;
      }
    }
  }

  Future loginCheck() async {
    if (await AuthApi.instance.hasToken()) {
      //토큰 유효성 검사 부분.
      try {
        AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
        print('토큰 유효성 체크 성공 ${tokenInfo.id} ${tokenInfo.expiresIn}');
        try {
          User user = await UserApi.instance.me();
          print('사용자 정보 요청 성공'
              '\n회원번호: ${user.id}'
              '\n프로필사진: ${user.kakaoAccount?.profile?.profileImageUrl}'
              '\n닉네임: ${user.kakaoAccount?.profile?.nickname}');
        } catch (error) {
          print('사용자 정보 요청 실패 $error');
        }
      } catch (error) {
        if (error is KakaoException && error.isInvalidTokenError()) {
          print('토큰 만료 $error');
        } else {
          print('토큰 정보 조회 실패 $error');
        }

        //유효성 검사가 실패했을 경우 재시도.
        try {
          // 카카오계정으로 로그인
          String token = await login();
          print('로그인 성공 $token');
          loginWithNewScopes();
          try {
            User user = await UserApi.instance.me();
            print('사용자 정보 요청 성공'
                '\n회원번호: ${user.id}'
                '\n프로필사진: ${user.kakaoAccount?.profile?.profileImageUrl}'
                '\n닉네임: ${user.kakaoAccount?.profile?.nickname}');
          } catch (error) {
            print('사용자 정보 요청 실패 $error');
          }
        } catch (error) {
          print('로그인 실패 $error');
        }
      }
    } else {
      print('발급된 토큰 없음');
      try {
        String token = await login();
        print('로그인 성공 $token');
        try {
          User user = await UserApi.instance.me();
          print('사용자 정보 요청 성공'
              '\n회원번호: ${user.id}'
              '\n프로필사진: ${user.kakaoAccount?.profile?.profileImageUrl}'
              '\n닉네임: ${user.kakaoAccount?.profile?.nickname}');
        } catch (error) {
          print('사용자 정보 요청 실패 $error');
        }
        loginWithNewScopes();
      } catch (error) {
        print('로그인 실패 $error');
      }
    }
  }
}
