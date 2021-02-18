import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../dummy_data.dart';

class TFAutoComplete extends StatefulWidget {
  final String userName;
  final String userImage;
  final _updateButtonUser;
  final _updateLabel;
  final _returnChosenUser;

  TFAutoComplete(
    this.userName,
    this.userImage,
    this._updateButtonUser,
    this._updateLabel,
    this._returnChosenUser,
  );

  @override
  _TFAutoCompleteState createState() => _TFAutoCompleteState();
}

class _TFAutoCompleteState extends State<TFAutoComplete> {
  TextEditingController _controller;
  String _userImage;
  Widget avatar;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = TextEditingController(text: '${widget.userName}');
    _userImage = widget.userImage;
    avatar = _userImage.isEmpty
        ? CircleAvatar(backgroundColor: Colors.white)
        : CircleAvatar(backgroundImage: AssetImage(_userImage));
  }

  List fieldListener(String pattern) {
    List matches = List();
    matches.addAll(DUMMY_USERS
        .map((sgUser) => [sgUser.title, sgUser.imageUrl, sgUser.id])
        .toList());
    matches.retainWhere(
        (s) => s[0].toLowerCase().contains(pattern.toString().toLowerCase()));

    return matches;
  }

  @override
  Widget build(BuildContext context) {
    return TypeAheadField(
      textFieldConfiguration: TextFieldConfiguration(
        controller: _controller,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.w700,
        ),
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          suffixIcon: avatar,
          hintText: '@username',
          hintStyle: TextStyle(color: Color(0xFFd3d3d3)),
        ),
        onTap: () {
          widget._updateLabel(true);
        },
        onSubmitted: (value) {
          List field = fieldListener(value);
          widget._updateLabel(false);

          setState(() {
            List user =
                field.firstWhere((user) => user[0] == value, orElse: () => []);
            if (user.isNotEmpty) {
              widget._updateButtonUser(false);
              widget._returnChosenUser(user);
              _controller.text = user[0];
              avatar = CircleAvatar(backgroundImage: AssetImage(user[1]));
            } else {
              widget._updateButtonUser(true);
              avatar = CircleAvatar(backgroundColor: Colors.white);
            }
          });
        },
        onChanged: (value) {
          List field = fieldListener(value);
          // widget._updateLabel(false);

          setState(() {
            List user =
                field.firstWhere((user) => user[0] == value, orElse: () => []);
            if (user.isNotEmpty) {
              widget._updateButtonUser(false);
              widget._returnChosenUser(user);
            } else {
              widget._updateButtonUser(true);
            }
          });
        },
      ),
      suggestionsBoxVerticalOffset: 0,
      suggestionsBoxDecoration: SuggestionsBoxDecoration(
        clipBehavior: Clip.antiAlias,
        constraints: BoxConstraints(maxHeight: 165),
        elevation: 0,
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      suggestionsCallback: (pattern) {
        return fieldListener(pattern);
      },
      itemBuilder: (context, suggestion) {
        return Padding(
          padding: const EdgeInsets.only(left: 15, top: 4, bottom: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                suggestion[0],
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              CircleAvatar(
                backgroundImage: AssetImage(
                  suggestion[1],
                ),
                radius: 23,
              ),
            ],
          ),
        );
      },
      hideSuggestionsOnKeyboardHide: false,
      onSuggestionSelected: (suggestion) {
        setState(() {
          widget._updateLabel(false);
          widget._updateButtonUser(false);
          widget._returnChosenUser(suggestion);
          _controller = TextEditingController(text: '${suggestion[0]}');
          _userImage = suggestion[1];
          avatar = CircleAvatar(backgroundImage: AssetImage(_userImage));
        });
      },
      noItemsFoundBuilder: (context) {
        return ListTile(
          title: Text('Нет результата',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
        );
      },
    );
  }
}
