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
      home: const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyLargeTitle(),
          
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatelessWidget {
  const MyLargeTitle({
    super.key,
  });

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