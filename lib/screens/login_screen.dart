import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gotogym/services/google_login.dart';
import 'package:gotogym/services/kakao_login.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _MypageScreenState();
  
}

class _MypageScreenState extends State<LoginScreen>{
  var kakaoLogin = KakaoLogin();
  var googleLogin = GoogleLogin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.black,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'GoToGym',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 400),

              SizedBox(
                  width: MediaQuery.of(context).size.width-20, // <-- match_parent
                  //height: double.infinity, // <-- match-parent
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: Colors.yellow,
                    ),
                  onPressed: kakaoLogin.kakaoLogin,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Image(
                          image: AssetImage("assets/images/kakao.png"),
                          height: 18.0,
                          width: 24,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 65, right: 65),
                          child: Text(
                            '카카오톡 로그인',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ),

              SizedBox(height: 10),

              SizedBox(
                  width: MediaQuery.of(context).size.width-20, // <-- match_parent
                  //height: double.infinity, // <-- match-parent
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Colors.white,
                    ),
                    onPressed: googleLogin.signInWithGoogle,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Image(
                            image: AssetImage("assets/images/google-2991148.png"),
                            height: 18.0,
                            width: 24,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 48, right: 48),
                            child: Text(
                              'Sign in with Google',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
              )

            ],
          ),
        ),
      );
  }

  // Future<void> kakaoLogin() async {
  //   if (await isKakaoTalkInstalled()) {
  //   try {
  //   await UserApi.instance.loginWithKakaoTalk();
  //   print('카카오톡으로 로그인 성공');
  //   } catch (error) {
  //   print('카카오톡으로 로그인 실패 $error');
  //
  //   // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
  //   // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
  //   if (error is PlatformException && error.code == 'CANCELED') {
  //   return;
  //   }
  //   // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
  //   try {
  //   await UserApi.instance.loginWithKakaoAccount();
  //   print('카카오계정으로 로그인 성공');
  //   } catch (error) {
  //   print('카카오계정으로 로그인 실패 $error');
  //   }
  //   }
  //   } else {
  //   try {
  //   await UserApi.instance.loginWithKakaoAccount();
  //   print('카카오계정으로 로그인 성공');
  //   } catch (error) {
  //   print('카카오계정으로 로그인 실패 $error');
  //   }
  //   }
  //
  //   try {
  //   User user = await UserApi.instance.me();
  //   print('사용자 정보 요청 성공'
  //   '\n회원번호: ${user.id}'
  //   '\n닉네임: ${user.kakaoAccount?.profile?.nickname}'
  //   '\n이메일: ${user.kakaoAccount?.email}');
  //   } catch (error) {
  //   print('사용자 정보 요청 실패 $error');
  //   }
  // }
}