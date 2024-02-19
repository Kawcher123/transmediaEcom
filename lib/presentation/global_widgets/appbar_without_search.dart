import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmedia/presentation/common/ui.dart';
import 'package:transmedia/presentation/global_widgets/cart_icon_button_widget.dart';

class AppBarWithoutSearchWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWithoutSearchWidget({super.key, this.title = ''});
  final String? title;

  @override
  Widget build(BuildContext context) {
    Size _size=MediaQuery.of(context).size;
    return AppBar(
      backgroundColor: Get.theme.cardColor,
      elevation: 0,
      title: Text(
        title ?? '',
        style: TextStyle(
          color: Get.theme.textTheme.bodyMedium!.color,
        ),
      ),
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 5, bottom: 5),
        child: Ui.commonUi.customBackIcon(
          color: Get.theme.primaryColor,
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: _size.width*0.03,
            ),
            CartIconBtnWithCounter(
              color: const Color(0xFF979797).withOpacity(0.1),
              topValue: '0',
            ),
            SizedBox(
              width: _size.width*0.03,
            ),
          ],
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
