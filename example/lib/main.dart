import 'package:flutter/material.dart';
import 'package:sp_ios_num_keyboard/sp_ios_num_keyboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SP IOS NUM KEYBOARD',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'On Screen Keyboard'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = "";

  onKeyboardTap(String value) {
    setState(() {
      text = text + value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
          child: Center(
              child: Column(children: [
        const Spacer(),
        Text(text,
            style: Theme.of(context).textTheme.headline6?.apply(
                color: Colors.black, fontSizeFactor: 2.3, fontWeightDelta: 2)),
        const Spacer(),
        NumericKeyboard(
            onKeyboardTap: onKeyboardTap,
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 28,
            ),
            rightButtonFn: () {
              if (text.isEmpty) return;
              setState(() {
                text = text.substring(0, text.length - 1);
              });
            },
            rightButtonLongPressFn: () {
              if (text.isEmpty) return;
              setState(() {
                text = text.substring(0, text.length - 1);
              });
            },
            doneButtonFn: () => print("done"),
            cancelButtonFn: () => print("cancel"),
            textButtonStyle: TextStyle(color: Colors.blue),
            textButtonPadding: EdgeInsets.all(10),
            textButtonOnTopKeys: true,
            rightIcon: const Stack(
              children: [
                // Align(
                //   child: Icon(
                //     Icons.backspace_outlined,
                //     color: Colors.grey,
                //     size: 12,
                //   ),
                //   alignment: Alignment.topRight,
                // ),
                Center(
                  child: Icon(
                    Icons.backspace_outlined,
                    color: Colors.grey,
                    size: 27,
                  ),

                  // Icon(
                  //   Icons.check,
                  //   color: Colors.black,
                  //   size: 25,
                  // ),
                ),
              ],
            ),
            leftButtonFn: () {
              if (text.isEmpty || text.contains(".")) return;
              setState(() {
                text = text + ".";
              });
            },
            leftButtonLongPressFn: () {
              if (text.isEmpty) return;
              setState(() {
                if (text.substring(0, 1) == '-') {
                  text = text.substring(1);
                } else {
                  text = "-" + text;
                }
              });
            },
            leftIcon: const Stack(
              children: [
                Align(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("-/+",
                        style: TextStyle(color: Colors.grey, fontSize: 15)),
                  ),
                  alignment: Alignment.topRight,
                ),
                Center(
                  child: Text(".",
                      style: TextStyle(color: Colors.black, fontSize: 30)),
                ),
              ],
            ),
            mainAxisAlignment: MainAxisAlignment.spaceBetween),
      ]))),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
