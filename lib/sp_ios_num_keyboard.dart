library sp_ios_num_keyboard;

import 'package:flutter/material.dart';
import 'package:mediaquery_sizer/mediaquery_sizer.dart';

typedef KeyboardTapCallback = void Function(String text);

class NumericKeyboard extends StatefulWidget {
  /// Color of the text [default = Colors.black]
  final TextStyle textStyle;

  final double? sizeNumButton ;

  /// Display a custom right icon
  final Widget? rightIcon;

  /// Action to trigger when right button is pressed
  final Function()? rightButtonFn;

  final String? cancelButtonText;
  final Function()? cancelButtonFn;
  final String? doneButtonText;
  final Function()? doneButtonFn;
  final TextStyle? textButtonStyle;

  /// Action to trigger when right button is long pressed
  final Function()? rightButtonLongPressFn;
  final Function()? leftButtonLongPressFn;

  /// Display a custom left icon
  final Widget? leftIcon;
  final Widget? customTextButton;
  final EdgeInsetsGeometry? textButtonPadding;
  final bool textButtonOnTopKeys;

  /// Action to trigger when left button is pressed
  final Function()? leftButtonFn;

  /// Callback when an item is pressed
  final KeyboardTapCallback onKeyboardTap;

  /// Main axis alignment [default = MainAxisAlignment.spaceEvenly]
  final MainAxisAlignment mainAxisAlignment;

  const NumericKeyboard(
      {Key? key,
      required this.onKeyboardTap,
      this.textStyle = const TextStyle(color: Colors.black),
      this.rightButtonFn,
      this.rightButtonLongPressFn,
      this.rightIcon,
        this.sizeNumButton,
        this.textButtonStyle,
        this.cancelButtonText,
        this.doneButtonText,
        this.cancelButtonFn,
        this.doneButtonFn,
        this.customTextButton,
        this.textButtonPadding,
        this.textButtonOnTopKeys = false,
      this.leftButtonFn,
      this.leftButtonLongPressFn,
      this.leftIcon,
      this.mainAxisAlignment = MainAxisAlignment.spaceBetween})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NumericKeyboardState();
  }
}

class _NumericKeyboardState extends State<NumericKeyboard> {
  TextStyle? myTextButtonStyle;

  @override
  Widget build(BuildContext context) {
    myTextButtonStyle = widget.textButtonStyle;
    return Container(
      padding: const EdgeInsets.only(left: 32, right: 32, top: 20),
      alignment: Alignment.center,
      child: LayoutBuilder(builder: (ctx, cons) {
        myTextButtonStyle?? TextStyle(color: Colors.blue, fontSize: 6.5.parentSP(cons));
        return Column(
            children: <Widget>[
              widget.textButtonOnTopKeys ? textButtons() : SizedBox(),
              ButtonBar(
                alignment: widget.mainAxisAlignment,
                children: <Widget>[
                  _calcButton('1', cons),
                  _calcButton('2', cons),
                  _calcButton('3', cons),
                ],
                buttonPadding: const EdgeInsets.all(0),
              ),
              ButtonBar(
                alignment: widget.mainAxisAlignment,
                children: <Widget>[
                  _calcButton('4', cons),
                  _calcButton('5', cons),
                  _calcButton('6',cons),
                ],
                buttonPadding: const EdgeInsets.all(0),
              ),
              ButtonBar(
                alignment: widget.mainAxisAlignment,
                children: <Widget>[
                  _calcButton('7', cons),
                  _calcButton('8', cons),
                  _calcButton('9', cons),
                ],
                buttonPadding: const EdgeInsets.all(0),
              ),
              ButtonBar(
                alignment: widget.mainAxisAlignment,
                buttonPadding: const EdgeInsets.all(0),
                children: <Widget>[
                  InkWell(
                      onTap: widget.leftButtonFn,
                      onLongPress: widget.leftButtonLongPressFn,
                      child: Container(
                          decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.black12)),
                          alignment: Alignment.center,
                          width: widget.sizeNumButton?? 33.parentW(cons),
                          height: widget.sizeNumButton?? 70,
                          child: widget.leftIcon)),
                  _calcButton('0', cons),
                  InkWell(
                      onTap: widget.rightButtonFn,
                      onLongPress: widget.rightButtonLongPressFn,
                      child: Container(
                          decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.black12)),
                          alignment: Alignment.center,
                          width: widget.sizeNumButton?? 33.parentW(cons),
                          height: widget.sizeNumButton?? 70,
                          child: widget.rightIcon))
                ],
              ),
              widget.textButtonOnTopKeys ? SizedBox() : textButtons(),
            ],
          );
        }
      ),
    );
  }

  Widget _calcButton(String value, cons) {
    return InkWell(
        borderRadius: BorderRadius.circular(45),
        onTap: () {
          widget.onKeyboardTap(value);
        },
        child: Container(
          decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.black12)),
          alignment: Alignment.center,
          width: widget.sizeNumButton?? 33.parentW(cons),
          height: widget.sizeNumButton?? 70,
          child: Text(
            value,
            style: widget.textStyle,
          ),
        ));
  }

  textButtons() {
    return Padding(
      padding: widget.textButtonPadding?? const EdgeInsets.all(2.0),
      child: widget.customTextButton?? Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.cancelButtonFn != null ?
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: widget.cancelButtonFn,
                child: Text(widget.cancelButtonText?? "Cancel", style: myTextButtonStyle)),
          ) : const SizedBox(),

          widget.doneButtonFn != null ?
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: widget.doneButtonFn,
                child: Text(widget.doneButtonText??"Done", style: myTextButtonStyle)),
          ) : const SizedBox(),
        ],
      ),
    );
  }
}
