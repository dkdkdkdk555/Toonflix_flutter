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
  
  List<int> numbers = [];

  void onClicked(){
    setState(() {  // UI에게 데이터가 바뀌었다고 알리는 함수
      numbers.add(numbers.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Click Count',
                style: TextStyle(fontSize: 30),
              ),
              for(var n in numbers) Text('$n'),
              IconButton(
                iconSize: 30,
                onPressed: onClicked, 
                icon: const Icon(Icons.add_box_rounded)
                ),
            ],
          ),
        ),
      ),
    );
  }
}