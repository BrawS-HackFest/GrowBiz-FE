
import 'package:flutter/material.dart';

class MyTextStyle{
  static TextStyle? judulH1({required Color color}) => TextStyle( fontSize: 21, fontWeight: FontWeight.w600, color:color );
  static TextStyle? judulH3({required Color color}) => TextStyle( fontSize: 17, fontWeight: FontWeight.w600, color:color );
  static TextStyle? judulH4({required Color color}) => TextStyle( fontSize: 14, fontWeight: FontWeight.w500, color:color );
  static TextStyle? judulH5({required Color color}) => TextStyle( fontSize: 13, fontWeight: FontWeight.w500, color:color );
  static TextStyle? judulH6({required Color color}) => TextStyle( fontSize: 11, fontWeight: FontWeight.w400, color:color );
  static TextStyle? buttonH3({required Color color}) => TextStyle( fontSize: 14, fontWeight: FontWeight.w700, color:color );
  static TextStyle? captionH5({required Color color}) => TextStyle( fontSize: 13, fontWeight: FontWeight.w400, color:color );

}