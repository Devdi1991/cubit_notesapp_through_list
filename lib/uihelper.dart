import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Uihelper{
  static CustomTextfield(TextEditingController controller,String text,IconData iconData){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 24),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: text,
          suffixIcon: Icon(iconData),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
          )
        ),
      ),
    );
  }
}