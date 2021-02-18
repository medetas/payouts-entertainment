import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TFCardNum extends StatefulWidget {
  final Function updateButtonUser;
  final Function returnChosenCardNum;
  final TextInputType txtInputType;
  final String hintText;
  final Color txtColor;
  final Color bgColor;
  final String mask;
  final String separator;
  final TextAlign txtAlign;

  TFCardNum({
    @required this.updateButtonUser,
    @required this.returnChosenCardNum,
    @required this.txtInputType,
    @required this.hintText,
    @required this.txtColor,
    @required this.bgColor,
    @required this.mask,
    @required this.separator,
    @required this.txtAlign,
  });

  @override
  _TFCardNumState createState() => _TFCardNumState();
}

class _TFCardNumState extends State<TFCardNum> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: widget.bgColor,
      ),
      child: TextField(
        textAlign: widget.txtAlign,
        controller: _controller,
        style: TextStyle(
          color: widget.txtColor,
          fontWeight: FontWeight.w700,
        ),
        keyboardType: widget.txtInputType,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          hintText: widget.hintText,
          hintStyle: widget.hintText == 'CVC'
              ? TextStyle(color: Color.fromRGBO(255, 255, 255, 0.25))
              : TextStyle(color: Color(0xFFd3d3d3)),
        ),
        inputFormatters: [
          MaskedTextInputFormatter(
            widget.mask,
            widget.separator,
            widget.updateButtonUser,
            widget.returnChosenCardNum,
          ),
        ],
        onChanged: (value) {
          widget.returnChosenCardNum(value);
        },
      ),
    );
  }
}

class MaskedTextInputFormatter extends TextInputFormatter {
  final String mask;
  final String separator;
  final Function updateButtonUser;
  final Function returnChosenCardNum;

  MaskedTextInputFormatter(
    this.mask,
    this.separator,
    this.updateButtonUser,
    this.returnChosenCardNum,
  );

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 0) {
      if (newValue.text.length > oldValue.text.length) {
        if (oldValue.text.length == mask.length - 1) {
          updateButtonUser(false);
        }
        if (newValue.text.length > mask.length) {
          return oldValue;
        }
        if (newValue.text.length < mask.length &&
            mask[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text:
                '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
            selection:
                TextSelection.collapsed(offset: newValue.selection.end + 1),
          );
        }
      } else {
        updateButtonUser(true);
      }
    }

    return newValue;
  }
}
