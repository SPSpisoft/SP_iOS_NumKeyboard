# numeric_keyboard

A simple numeric keyboard widget

[![pub package](https://img.shields.io/pub/v/numeric_keyboard.svg?style=for-the-badge&color=blue)](https://pub.dartlang.org/packages/onscreen_num_keyboard)

## Installation

Add `onscreen_num_keyboard: ^1.0.4` in your `pubspec.yaml` dependencies. And import it:

```dart
import 'package:onscreen_num_keyboard/sp_ios_num_keyboard.dart';
```

## How to use

Simply create a `NumericKeyboard` widget and pass the required params:

```dart
NumericKeyboard(
  onKeyboardTap: _onKeyboardTap
)

_onKeyboardTap(String value) {
  setState(() {
    text = text + value;
  });
}
```

## Params

```dart
NumericKeyboard(
  onKeyboardTap: _onKeyboardTap,
  textStyle: TextStyle(
    fontSize: 20.0,
    color: Colors.black
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
      text = '';
    });
  },
  rightIcon: Icon(Icons.backspace, color: Colors.red,),
  leftButtonFn: () {
    print('left button clicked');
  },
  leftIcon: Icon(Icons.check, color: Colors.red,),
  mainAxisAlignment: MainAxisAlignment.spaceEvenly
)
```

## Example

Example UI for the widget:
![Example](https://raw.githubusercontent.com/Muzammil-Bilwani/Onscreen-num-keyboard/main/example.png)

If something is missing, feel free to open a ticket or contribute!
