import 'package:flutter/material.dart';
import 'package:formula_bancaria_app/enums/themes.enum.dart';

import 'mythemes.dart';

class CustomThemeClass extends InheritedWidget {
  final CustomThemeState data;

  CustomThemeClass({this.data, Key key, @required Widget child,}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(CustomThemeClass oldWidget) {
    return true;
  }
}

class CustomTheme extends StatefulWidget {
  final Widget child;
  final Keys initialKey;

  const CustomTheme({Key key, this.initialKey, @required this.child,}) : super(key: key);

  @override
  CustomThemeState createState() => new CustomThemeState();

  static ThemeData of(BuildContext context) {
    CustomThemeClass inherited = (context.inheritFromWidgetOfExactType(CustomThemeClass) as CustomThemeClass);
    return inherited.data.theme;
  }

  static CustomThemeState instanceOf(BuildContext context) {
    CustomThemeClass inherited = (context.inheritFromWidgetOfExactType(CustomThemeClass) as CustomThemeClass);
    return inherited.data;
  }
}

class CustomThemeState extends State<CustomTheme> {
  ThemeData _theme;

  ThemeData get theme => _theme;

  @override
  void initState() {
    _theme = MyThemes.keyTheme(widget.initialKey);
    super.initState();
  }



  void changeTheme(Keys key) {
    setState(() {
      _theme = MyThemes.keyTheme(key);
    });
  }

  @override
  Widget build(BuildContext context) {
    return  CustomThemeClass(
      data: this,
      child: widget.child,
    );
  }
}