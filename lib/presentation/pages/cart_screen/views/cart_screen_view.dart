import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:transmedia/core/app.constant.dart';
import 'package:transmedia/presentation/common/ui.dart';
import 'package:transmedia/presentation/global_widgets/appbar_without_search.dart';
import 'package:transmedia/presentation/global_widgets/image_widget.dart';

import '../controllers/cart_screen_controller.dart';

class CartScreenView extends GetView<CartScreenController> {
  const CartScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size _size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: const AppBarWithoutSearchWidget(
        title: 'Cart List',
      ),
      body: Obx(() {
        if (controller.cartLoaded.isTrue) {
          return controller.cartList.isNotEmpty? ListView.builder(
            itemCount: controller.cartList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(horizontalPadding),
                child: Container(
                  decoration: Ui.commonUi.getBoxDecoration(
                    color: Get.theme.cardColor,
                    shadowColor: Get.theme.primaryColor.withOpacity(0.1),
                    radius: boxRadius,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(boxRadius),
                        child: ImageWidget(
                          imageUrl: controller.cartList[index].image ?? '',
                          width: _size.width * .3,
                          boxFit: cover,
                          imageBoxFit: cover,
                        ),
                      ),
                      SizedBox(
                        width: _size.width * 0.02,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: _size.height * 0.01,
                          ),
                          SizedBox(
                            width: _size.width * 0.6,
                            child: Text(
                              controller.cartList[index].title ?? '',
                              style: TextStyle(
                                fontSize: mediumFontSize,
                              ),
                              maxLines: 3,
                            ),
                          ),
                          SizedBox(
                            height: _size.height * 0.01,
                          ),
                          Text(
                            'Price: BDT ${controller.cartList[index].price ?? ''}',
                            style: TextStyle(
                              fontSize: mediumFontSize,
                            ),
                            maxLines: 3,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Ui.commonUi.getIconButton(
                                      height: _size.width * .08,
                                      width: _size.width * .08,
                                      color: Colors.blue.withOpacity(.15),
                                      svgColor: Get.theme.textTheme.bodyText1!.color,
                                      radius: 5,
                                      child: const Icon(
                                        Icons.remove,
                                      ),
                                      press: () {
                                       if(controller.cartList[index].qty!>1) {
                                          controller.cartList[index].qty = controller.cartList[index].qty! - 1;
                                          controller.updateCartItem(controller.cartList[index]);
                                        }
                                      }),
                                  Obx(() => Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Ui.commonUi.getIconButton(
                                          height: _size.width * .08,
                                          width: _size.width * .15,
                                          color: Colors.blue.withOpacity(.15),
                                          svgColor: Colors.black,
                                          text: '${controller.cartList[index].qty}',
                                          radius: 5,
                                        ),
                                      )),
                                  Ui.commonUi.getIconButton(
                                      height: _size.width * .08,
                                      width: _size.width * .08,
                                      color: Colors.blue.withOpacity(.15),
                                      svgColor: Get.theme.textTheme.bodyText1!.color,
                                      radius: 5,
                                      child: const Icon(
                                        Icons.add,
                                      ),
                                      press: () {
                                        controller.cartList[index].qty=controller.cartList[index].qty!+1;
                                        controller.updateCartItem(controller.cartList[index]);
                                      }),
                                ],
                              ),
                              SizedBox(
                                width: _size.width * 0.1,
                              ),
                              IconButton(
                                onPressed: () {
                                  Ui.commonUi.showAwesomeDialog(
                                    'Warning',
                                    'Are you sure , you want to delete this item?',
                                    Get.theme.primaryColor,
                                    () {
                                      controller.deleteCartItem(controller.cartList[index]);
                                    },
                                    Get.context,
                                    showClose: true,
                                    okay: 'Yes',
                                    type: 'warning',
                                  );
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.redAccent,
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ):SizedBox(
              height: _size.height,
              width: _size.width,
              child: const Center(child: Text('Cart list is empty')));
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
