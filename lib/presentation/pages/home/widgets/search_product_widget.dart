
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmedia/core/app.constant.dart';
import 'package:transmedia/presentation/global_widgets/text_field_widget.dart';
import 'package:transmedia/presentation/pages/home/controllers/home.controller.dart';

class SearchBar extends GetWidget<HomeController> {

  @override
  Widget build(BuildContext context) {
    Size _size=MediaQuery.of(context).size;
    return Container(
      width: _size.width * 0.65,
      height: _size.width * .115,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFieldWidget(
        hasBorder: false,
        hintText: "Search Product",
        keyboardType: TextInputType.text,
        initialValue: '',
        isFill: true,
        fillColor: Get.theme.disabledColor.withOpacity(0.05),
        suffixIcon: Icon(
          Icons.search,
          color: Theme.of(context).disabledColor,
        ),
        onChanged: (input) {
        controller.searchByKey(input);
        },
        validator: (input) {
          if (input!.isEmpty) {
            return 'This field cannot be empty.';
          } else {
            return null;
          }
        },
      ),
    );
  }
}