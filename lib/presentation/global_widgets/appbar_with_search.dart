import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmedia/presentation/global_widgets/cart_icon_button_widget.dart';
import 'package:transmedia/presentation/pages/home/widgets/search_product_widget.dart';

import '../../core/app.constant.dart';

class AppBarWithSearchWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWithSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size _size=MediaQuery.of(context).size;
    return AppBar(
      backgroundColor: Get.theme.cardColor,
      elevation: 0,
      title: Text(
        'TCOM',
        style: TextStyle(
          fontSize: mediumFontSize,
          color: Get.theme.primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SearchBar(),
             SizedBox(
              width: _size.width*0.03,
            ),
            CartIconBtnWithCounter(
              color: const Color(0xFF979797).withOpacity(0.1),
              topValue: '0',
            ),

            SizedBox(
              width: _size.width*0.035,
            ),
          ],
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
