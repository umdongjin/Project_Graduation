import 'package:flutter/material.dart';
import 'package:untitled/config/palette.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({Key? key}) : super(key: key);

  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isSignupScreen = true;
  final _formKey = GlobalKey<FormState>();
  String userName = '';
  String userEmail = '';
  String userPassword = '';
  void _tryValidation() {
    // validation을 모든 텍스폼필드 validation을 작동시킬 수 있다.
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      // formstate 유효할 경우에 한해서 폼 전체의 state값을 저장하게 됨
      _formKey.currentState!.save();
    }
  }

  // TODO: 사용자가 다음 버튼을 눌렀을 때 폼에 유효성 검사에 문제가 없을 경우
  // TODO: validator가 null을 리턴하고, Value값을 가져와서 validation 기능을 실행 해야 한다.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: SizedBox(
                height: 300,
                child: Container(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // RichText(
                      //   text: TextSpan(
                      //     text: '배달을 반하다 ',
                      //     style: const TextStyle(
                      //       letterSpacing: 0.1,
                      //       fontSize: 30,
                      //       color: Colors.black,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //     children: [
                      //       TextSpan(
                      //         text: isSignupScreen ? '회원가입' : '시작하기 ',
                      //         style: const TextStyle(
                      //           letterSpacing: 0.1,
                      //           fontSize: 28,
                      //           color: Colors.black38,
                      //           //fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Container(
                        height: 110,
                        width: 110,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('img/logo.png'),
                              fit: BoxFit.fill),
                        ),
                      ),
                      // const SizedBox(
                      //   height: 15.0,
                      // ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "배달비 걱정 없는 배달비 공유 플랫폼",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("배달비와 최소주문금액 걱정없이 지금 시작하세요.",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black87))
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //배경
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
              top: 250,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
                padding: const EdgeInsets.all(20.0),
                height: isSignupScreen ? 320.0 : 260.0,
                width: MediaQuery.of(context).size.width - 40,
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 15,
                        spreadRadius: 5),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSignupScreen = false;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  '로그인',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: !isSignupScreen
                                          ? Colors.black
                                          : Colors.black54),
                                ),
                                if (!isSignupScreen)
                                  Container(
                                    margin: const EdgeInsets.only(top: 3),
                                    height: 2,
                                    width: 55,
                                    color: Colors.black,
                                  )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSignupScreen = true;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  '회원가입',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: isSignupScreen
                                          ? Colors.black
                                          : Colors.black54),
                                ),
                                if (isSignupScreen)
                                  Container(
                                    margin: const EdgeInsets.only(top: 3),
                                    height: 2,
                                    width: 55,
                                    color: Colors.black,
                                  )
                              ],
                            ),
                          )
                        ],
                      ),
                      if (isSignupScreen) // 회원가입 폼 필드
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  key: const ValueKey(1),
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 4) {
                                      return "4글자 이상 입력해주세요";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    //userName 변수는 onSaved 메소드 내에서 밸류값이 전달 될때 마다 업데이트
                                    userName = value!;
                                  },
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.account_circle,
                                        color: Palette.iconColor,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Palette.textColor1),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35.0),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Palette.textColor1),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35.0),
                                        ),
                                      ),
                                      hintText: '닉네임',
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: Palette.textColor1),
                                      contentPadding: EdgeInsets.all(10)),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                TextFormField(
                                  key: const ValueKey(2),
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !value.contains('@')) {
                                      // @이 포함되었는지 안되었느지
                                      return "이메일 칸에 '@' 를 포함 해주세요";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    //userName 변수는 onSaved 메소드 내에서 밸류값이 전달 될때 마다 업데이트
                                    userEmail = value!;
                                  },
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.email,
                                        color: Palette.iconColor,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Palette.textColor1),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35.0),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Palette.textColor1),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35.0),
                                        ),
                                      ),
                                      hintText: '이메일',
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: Palette.textColor1),
                                      contentPadding: EdgeInsets.all(10)),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                TextFormField(
                                  // 비밀번호 6자리는 firebase애 6자리가 최소 숫자
                                  key: const ValueKey(3),
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 6) {
                                      return "비밀번호는 6자리 이상 입력해 주십시요";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    //userName 변수는 onSaved 메소드 내에서 밸류값이 전달 될때 마다 업데이트
                                    userPassword = value!;
                                  },
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: Palette.iconColor,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Palette.textColor1),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35.0),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Palette.textColor1),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35.0),
                                        ),
                                      ),
                                      hintText: '비밀번호',
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: Palette.textColor1),
                                      contentPadding: EdgeInsets.all(10)),
                                )
                              ],
                            ),
                          ),
                        ),
                      if (!isSignupScreen) // 로그인 텍스트폼 필드
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  key: const ValueKey(4),
                                  validator: (value) {
                                    if (value!.isEmpty || value.contains('@')) {
                                      return "이메일에서 @이 발견되지 않았습니다.";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    //userName 변수는 onSaved 메소드 내에서 밸류값이 전달 될때 마다 업데이트
                                    userEmail = value!;
                                  },
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.email,
                                        color: Palette.iconColor,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Palette.textColor1),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35.0),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Palette.textColor1),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35.0),
                                        ),
                                      ),
                                      hintText: '이메일',
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: Palette.textColor1),
                                      contentPadding: EdgeInsets.all(10)),
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                TextFormField(
                                  key: const ValueKey(5),
                                  onSaved: (value) {
                                    //userName 변수는 onSaved 메소드 내에서 밸류값이 전달 될때 마다 업데이트
                                    userPassword = value!;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 6) {
                                      return "비밀번호는 6자리 이상입니다.";
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: Palette.iconColor,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Palette.textColor1),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35.0),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Palette.textColor1),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35.0),
                                        ),
                                      ),
                                      hintText: '비밀번호',
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: Palette.textColor1),
                                      contentPadding: EdgeInsets.all(10)),
                                )
                              ],
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ),
            //텍스트 폼 필드
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
              top: isSignupScreen ? 485 : 425,
              right: 0,
              left: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  height: 75,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: GestureDetector(
                    onTap: () {
                      _tryValidation();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Colors.blue, Colors.blueAccent],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: TextButton.icon(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            minimumSize: const Size(155, 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            backgroundColor: Colors.red),
                        label: const Text(
                          '계속하기',
                          style: TextStyle(fontSize: 15),
                        ),
                        icon: const Icon(
                          Icons.play_arrow_rounded,
                          size: 0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //전송버튼
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeIn,
              top: isSignupScreen
                  ? MediaQuery.of(context).size.height - 120
                  : MediaQuery.of(context).size.height - 180,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  const Text(
                    'or',
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    '다음 계정으로 계속하기',
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        minimumSize: const Size(155, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: Colors.red),
                    icon: const Icon(Icons.add, size: 0),
                    label: const Text('Google'),
                  ),
                ],
              ),
            ),
            //구글
          ],
        ),
      ),
    );
  }
}