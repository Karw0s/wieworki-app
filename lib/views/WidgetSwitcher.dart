
import 'package:flutter/material.dart';

import 'Categories.dart';
import 'CategoriesLarge.dart';

class WidgetSwitcher extends StatelessWidget{

  getCategories(var context) {
    if (context < 800) {
      return Categories();
    } else {
      return CategoriesLarge();
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: getCategories(width),
    );
  }
}