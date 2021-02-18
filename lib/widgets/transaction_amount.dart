import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransactionAmount extends StatefulWidget {
  final toggleContinueButton;
  final returnTransactionAmount;

  TransactionAmount(this.toggleContinueButton, this.returnTransactionAmount);

  @override
  _TransactionAmountState createState() => _TransactionAmountState();
}

class _TransactionAmountState extends State<TransactionAmount> {
  TextEditingController _amountController = TextEditingController();
  static const separator = ' ';
  Color _sufColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _sufColor = Color(0xFFd3d3d3);
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: TextField(
        controller: _amountController,
        autofocus: true,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 50,
          fontWeight: FontWeight.w800,
        ),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: '0',
          hintStyle: TextStyle(
            color: Color(0xFFd3d3d3),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          suffixIcon: Text(
            '₽',
            style: TextStyle(
              color: _sufColor,
              fontSize: 50,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp('^[1-9][0-9 ]*')),
          TextInputFormatter.withFunction((oldValue, newValue) {
            if (newValue.text.length == 0) {
              widget.toggleContinueButton(true);
              setState(() {
                _sufColor = Color(0xFFd3d3d3);
              });
              return newValue.copyWith(text: '');
            }
            widget.toggleContinueButton(false);
            setState(() {
              _sufColor = Theme.of(context).primaryColor;
            });
            // Handle "deletion" of separator character
            String oldValueText = oldValue.text.replaceAll(separator, '');
            String newValueText = newValue.text.replaceAll(separator, '');

            if (oldValue.text.endsWith(separator) &&
                oldValue.text.length == newValue.text.length + 1) {
              newValueText = newValueText.substring(0, newValueText.length - 1);
            }

            // Only process if the old value and new value are different
            if (oldValueText != newValueText) {
              int selectionIndex =
                  newValue.text.length - newValue.selection.extentOffset;
              final chars = newValueText.split('');

              String newString = '';
              for (int i = chars.length - 1; i >= 0; i--) {
                if ((chars.length - 1 - i) % 3 == 0 && i != chars.length - 1)
                  newString = separator + newString;
                newString = chars[i] + newString;
              }

              return TextEditingValue(
                text: newString.toString(),
                selection: TextSelection.collapsed(
                  offset: newString.length - selectionIndex,
                ),
              );
            }

            // If the new value and old value are the same, just return as-is
            return newValue;
          }),
        ],
        onChanged: (value) => widget.returnTransactionAmount(value),
      ),
    );
  }
}
