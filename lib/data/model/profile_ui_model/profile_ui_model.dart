import 'package:flutter/material.dart';

class ProfileUiModel{
   String title;
   String ?description;
   String iconData;
   Function onTap;
   Color color ;
   bool isArrow;

  ProfileUiModel(this.color,{required this.title,  this.description, required this.iconData, required this.onTap,this.isArrow=true});







}