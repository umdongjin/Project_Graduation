import 'package:flutter/material.dart';
import 'package:untitled/pages/chat_page.dart';
import '../model/chat_model.dart';
import 'package:flutter/cupertino.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  static List<String> UserTitle = [
    "충주 용산동 스타벅스",
    "교현동 맥도날드",
    "연수동 BBQ",
    "신연수동 홍익돈까스",
    "단월동 합격반점"
  ];
  static List<String> UserConent = [
    "네 그리로 가겠습니다.",
    "정문은 어떠실까요?",
    "영업시간 끝났네요",
    "ㅠㅡㅠ",
    "ㅋㅋㅋㅋㅋㅋ"
  ];
  static List<String> UserName = [
    "익명",
    "굳잡",
    "건국대 일짱 손창성",
    "건국대 > 교통대",
    "커피먹는 익명씨"
  ];

  static List<String> UserImg = [
    "assets/img/bbq.jfif",
    "assets/img/hongik.png",
    "assets/img/mc.jfif",
    "assets/img/starbucks.png",
    "assets/img/winner.jfif"
  ];

  final List<User> UserData = List.generate(
      UserTitle.length,
          (index) => User(UserTitle[index], UserConent[index], UserImg[index],
          UserName[index]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white38,
        elevation: 0.0, // appbar의 그림자 효과 배제,
        toolbarHeight: 50,
        centerTitle: false,
        title: const Text(
          " 채팅",
          style: TextStyle(
              color: Colors.black, fontSize: 27, fontWeight: FontWeight.w300),
        ),
      ),
      body: ListView.builder(
          itemCount: UserData.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(
                  UserData[index].title,
                  style: const TextStyle(
                    //fontWeight: FontWeight.bold,
                      color: CupertinoColors.black,
                      fontSize: 18),
                ),
                subtitle: Row(
                  children: [
                    Text(
                      "${UserData[index].UserName}: ",
                      style: const TextStyle(
                          color: CupertinoColors.black, fontSize: 16),
                    ),
                    Text("${UserData[index].content}"),
                  ],
                ),
                leading: Container(
                  padding: const EdgeInsets.all(3),
                  height: 70,
                  width: 70,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child:
                    Image.asset(UserData[index].imgPath, fit: BoxFit.cover),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ChatPage(
                        user: UserData[index],
                      )));
                  debugPrint(UserData[index].title);
                },
              ),
            );
          }),
    );
  }

// Widget build(BuildContext context) {
//   return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white38,
//         elevation: 0.0, // appbar의 그림자 효과 배제,
//         toolbarHeight: 70,
//         centerTitle: false,
//         title: const Text(
//           "채팅",
//           style: TextStyle(
//               color: Colors.black, fontSize: 30, fontWeight: FontWeight.w300),
//         ),
//       ),
//       body: Column(children: <Widget>[
//         Container(
//             color: Colors.white,
//             width: double.infinity,
//             height: 80,
//             child: Row(
//               children: <Widget>[
//                 Container(
//                   padding: const EdgeInsets.all(10),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child:
//                         Image.asset("assets/img/user.png", fit: BoxFit.cover),
//                   ),
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.fromLTRB(5, 10, 5, 2),
//                           child: const Text(
//                             "고양이 팝니다.",
//                             style: TextStyle(
//                                 fontSize: 20, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         const Text(
//                           "오후 1:45",
//                           style:
//                               TextStyle(color: Colors.black54, fontSize: 13),
//                         ),
//                         const Icon(Icons.check, color: Colors.green),
//                         const Text(
//                           "내가 쓴 글",
//                           style: TextStyle(fontWeight: FontWeight.w500),
//                         )
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.all(5),
//                           //color: Colors.blue,
//                           child: const Text(
//                             "익명2: 길거리 출신 인가요? ?",
//                             style: TextStyle(fontSize: 16),
//                           ),
//                         ),
//                         const Icon(Icons.plus_one_outlined, color: Colors.red)
//                       ],
//                     )
//                   ],
//                 )
//               ],
//             )),
//         Container(
//           color: Colors.blue,
//           width: double.infinity,
//           height: 80,
//         ),
//         Container(
//           color: Colors.green,
//           width: double.infinity,
//           height: 80,
//         ),
//       ]) //second third 다름
//      );
// }
}