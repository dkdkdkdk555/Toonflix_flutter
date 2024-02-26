import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/currency_card.dart';

void main() {
  runApp(const App()); // 앱 시작점, 여기에 넣고 실행하는 위젯은 root 위젯이다.
  /**
   * 플러터는 widget 을 레고블럭으로 보고 그 블럭을 합쳐서 결과물을 만드는 것 과 같다!
   * 
   * widget 은 class 다! 
  */
}

// flutter 의 모든 클래스들은 3가지 핵심 위젯 중 하나를 상속받아야한다.
class App extends StatelessWidget {
  const App({super.key});

  
  @override 
  Widget build(BuildContext context) {
    // material, cupertino 는 각각 구글과 애플의 디자인 시스템이다. 
    // root 위젯은 이 둘중 하나를 리턴해야한다. -> 앱이 어떻게 보이도록 하는지 결정
    return MaterialApp(/**
      해당 위젯의 속성을 정의해줘야 한다.
      근데 속성도 위젯인 경우가 있다. 그래서 해당 위젯의 생성자를 보며 속성을 찾고 정의해 나가자,,
     */
      home: Scaffold(
        backgroundColor:const Color(0xFF181818),
        body: SingleChildScrollView( // 스크롤뷰
          child: Padding( // Padding 으로 감싼 위젯에 패딩주기 위함
            padding: const EdgeInsets.symmetric(horizontal: 40), // Padding 클래스의 필수 프로퍼티
            child: Column( // 수직구조일 경우 Column
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                height: 80,
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end, // 정렬
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children:[
                        const Text('Hey, Selena',
                          style: TextStyle(
                            color:Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w800, // 두께
                            )
                          ),
                        Text('Welcome back',
                          style: TextStyle(
                            color:Colors.white.withOpacity(0.8),
                            fontSize: 18,
                            )
                          ),
                      ],
                    )
                  ],
              ),
              const SizedBox(
                height: 120,
              ),
              Text(
                'Total Balance',
                style: TextStyle(color: Colors.white.withOpacity(0.8)),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '\$5 194 482',
                style: TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.w600,
                  color: Colors.white.withOpacity(0.8)),
              ),
              const SizedBox(height:30),
              const Row(
          
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyButton(), // 
                  Button(text: "Request", bgColor: Color(0xFF1F2123), textColor: Colors.white),
                ],
              ),
            const SizedBox(
              height:100,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               const Text('Wallets',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text('View All',
                style:TextStyle(
                  color:Colors.white.withOpacity(0.8),
                  fontSize: 18,
                ),
              ),
            ],),
            const SizedBox(height:20,),
            const CurrencyCard(name: "EURO", code: "EUR", amount: "6 482", icon: Icons.euro_rounded, isInverted: false,),
            Transform.translate(
              offset: const Offset(0, -20),
              child: const CurrencyCard(name: "Bitcoin", code: "BTC", amount: "9 785", icon: Icons.currency_bitcoin_rounded, isInverted: true,)),
            Transform.translate(
              offset: const Offset(0, -40),
              child: const CurrencyCard(name: "Dollar", code: "USD", amount: "428", icon: Icons.money_outlined, isInverted: false,)),
            ],
          ),
          ),
        )
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:Colors.amber,
        borderRadius: BorderRadius.circular(45),
      ),
      child:const Padding(padding: 
        EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 50,
      ),
      child: Text(
        'Transfer',
        style: TextStyle(
          fontSize: 22,
        ),
        ),
      )
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red.shade100),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
