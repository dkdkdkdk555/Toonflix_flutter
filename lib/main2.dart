import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const Apsp());
}

/*
 * StatefulWidget 은
 * 두가지 부분이 있다.
 */

// 1. 변하지 않는 부분
class Apsp extends StatefulWidget {
  const Apsp({super.key});
  @override
  State<Apsp> createState() => _AppState();
}

// 2. 데이터가 바뀌면 변하는 부분
// UI를 구축하는 곳, 새로 고침시 최신 데이터를 보여줌
class _AppState extends State<Apsp> {
  

  bool showTitle = true;

  void toggleTittle(){
    setState(() {
      showTitle = !showTitle;      
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? const MyLargeTitle() : const Text('nothing'),
              IconButton(onPressed: toggleTittle, icon: const Icon(Icons.remove_red_eye))
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {

  @override
  void initState() { // 상태 초기화
    super.initState();
    /*  
      <initState가 사용되는 경우>
      - 데이터 초기화 때 부모 요소에 의존하는 데이터를 초기화 해주는 경우
      - context를 통해 부모요소에 접근해야 하는 경우
      - API에서 업데이트를 구독해야 하는 경우
    */ 
  }

  @override
  void dispose() { // 위젯이 스크린에서 제거 될 때
    super.dispose();
    /*
      - API 업데이터
      - 이벤트 리스너로부터 구독 취소
    */
  }
  @override
  Widget build(BuildContext context) { 
  // BuildContext context 는 상위요소의 모든 정보를 가지고 있다. 
  //'위젯 트리' 에 대한 정보가 담겨있다. -> 이걸 통해 부모요소에 접근
    return Text(
      'My Large Title',
      style: TextStyle(fontSize: 30, color:Theme.of(context).textTheme.titleLarge!.color,), // ! 는 NotNull 임을 명확히 해주는것이다. ( ? = Nullable)
    );
  }
}