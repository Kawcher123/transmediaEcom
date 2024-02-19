import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmedia/domain/entities/product_entity.dart';
import 'package:transmedia/presentation/common/ui.dart';
import 'package:transmedia/presentation/global_widgets/image_widget.dart';
import 'package:transmedia/presentation/navigation/routes.dart';

import '../../core/app.constant.dart';

class ProductCardWidget extends StatelessWidget {
  ProductCardWidget({
    Key? key,
    this.width,
    required this.productData,
  }) : super(key: key);
  double? width;
  ProductEntity productData;
  @override
  Widget build(BuildContext context) {
    Size _size=MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.PRODUCT_DETAILS_SCREEN, arguments: productData);
      },
      child: Container(
        height: _size.width * .5,
        width: _size.width * .4,
        decoration: Ui.commonUi.getBoxDecoration(
          radius: boxRadius,
          color: Get.theme.cardColor,
          shadowColor: Get.theme.primaryColor.withOpacity(0.2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(3),
              child: ClipRRect(
            borderRadius: BorderRadius.circular(boxRadius),
            child: ImageWidget(
              imageUrl: productData.thumbnail ?? '',
              height: _size.width * .4,
              width: _size.width,
              boxFit: cover,
              imageBoxFit: fitWidth,
            ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: horizontalPadding,
              ),
              child: Text(
                productData.title ?? '',
                style: TextStyle(fontSize: mediumFontSize, letterSpacing: 1.0),
                maxLines: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: horizontalPadding,vertical: verticalPadding
              ),
              child: Text(
                'BDT ${productData.price ?? 0}',
                style: TextStyle(
                  fontSize: mediumFontSize,
                  color: Get.theme.textTheme.bodyText1!.color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
