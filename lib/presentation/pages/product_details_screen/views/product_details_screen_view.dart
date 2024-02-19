import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:transmedia/core/app.constant.dart';
import 'package:transmedia/presentation/common/ui.dart';
import 'package:transmedia/presentation/global_widgets/cart_icon_button_widget.dart';
import 'package:transmedia/presentation/global_widgets/image_widget.dart';

import '../controllers/product_details_screen_controller.dart';

class ProductDetailsScreenView extends GetView<ProductDetailsScreenController> {
  const ProductDetailsScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(body: Stack(
      children: [
        SingleChildScrollView(
            scrollDirection: Axis.vertical,
            primary: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageWidget(
                  imageUrl: controller.productDetails.value.image ?? '',
                  height: size.height * .5,
                  width:  size.width,
                  boxFit: contain,
                ),
                Padding(
                  padding: const EdgeInsets.all(horizontalPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * .9,
                        child: Text(
                          controller.productDetails.value.title!,
                          style: TextStyle(fontSize: largeFontSize),
                          maxLines: 2,
                        ),
                      ),

                      SizedBox(height: size.height*0.01,),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(horizontalPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price'.tr,
                        style:  TextStyle(fontSize: bigMediumFontSize),
                      ),
                       Text(
                        "৳ ${double.parse(controller.productDetails.value.price.toString().replaceAll(',', '')).floor()}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Get.theme.primaryColor,
                        ),
                      )

                    ],
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.all(horizontalPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Select Quantity:'.tr,
                        style: TextStyle(fontSize: bigMediumFontSize),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Ui.commonUi.getIconButton(
                                height: size.width * .1,
                                width: size.width * .1,
                                color: Colors.blue.withOpacity(.15),
                                svgColor: Get.theme.textTheme.bodyText1!.color,
                                radius: 5,
                                child: const Icon(Icons.remove,),
                                press: () {
                                  controller.quantityDecrement();

                                }),
                          ),
                         Obx(() =>  Padding(
                           padding: const EdgeInsets.all(5.0),
                           child: Ui.commonUi.getIconButton(
                             height: size.width * .1,
                             width: size.width * .15,
                             color: Colors.blue.withOpacity(.15),
                             svgColor: Colors.black,
                             text: '${controller.cartQuantity.value}',
                             radius: 5,
                           ),
                         )),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Ui.commonUi.getIconButton(
                                height: size.width * .1,
                                width: size.width * .1,
                                color: Colors.blue.withOpacity(.15),
                                svgColor: Get.theme.textTheme.bodyText1!.color,
                                radius: 5,
                                child: const Icon(Icons.add,),
                                press: () {
                                  controller.quantityIncrement();
                                }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),




                Padding(
                  padding: const EdgeInsets.all(horizontalPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description'.tr,
                        style:  TextStyle(fontSize: bigMediumFontSize),
                      ),


                      Text(
                        controller.productDetails.value.content??'',
                        style:  TextStyle(fontSize: mediumFontSize,color: Get.theme.textTheme.bodyMedium!.color),
                        textAlign: TextAlign.justify,
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  height: size.width * .3,
                )
              ],
            )),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 35.0, left: 10),
            child: Ui.commonUi.customBackIcon(
                color: Get.theme.primaryColor,

            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 35.0, right: 10),
            child:    CartIconBtnWithCounter(
              color: const Color(0xFF979797).withOpacity(0.1),
              topValue: '0',

            ),
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: size.width * .8,
                decoration: BoxDecoration(color: Get.theme.primaryColor, borderRadius: BorderRadius.circular(30)),
                child: TextButton(
                  onPressed: () {
                    controller.addToCart();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'ADD TO CART'.tr,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ))
      ],
    ));
  }
}
