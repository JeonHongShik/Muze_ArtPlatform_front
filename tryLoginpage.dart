import 'package:flutter/material.dart';
import '../widgets/kakao_login.dart';
import '../widgets/view_model.dart';

class tryLoginpage extends StatefulWidget {
  const tryLoginpage({super.key});

  @override
  State<tryLoginpage> createState() => _tryLoginpageState();
}

class _tryLoginpageState extends State<tryLoginpage> {
  final viewModel = ViewModel(KakaoLogin());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.transparent, // 배경색을 투명으로 설정
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 600,
              ),
              Image.network(
                  viewModel.user?.kakaoAccount?.profile?.profileImageUrl ?? ''),
              Text(
                '${viewModel.isLogined}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () async {
                  await viewModel.login();
                  setState(() {});
                },
                child: Text('Login'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await viewModel.logout();
                  setState(() {});
                },
                child: Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
