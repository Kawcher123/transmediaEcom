import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transmedia/presentation/global_widgets/block_button_widget.dart';

import '../../core/app.constant.dart';

class Ui {
  static Ui? _commonUi;

  Ui._();

  static Ui get commonUi => _commonUi ??= Ui._();

  BoxDecoration getBoxDecoration({
    Color? color,
    Color? shadowColor,
    double? radius,
    Border? border,
    Gradient? gradient,
  }) {
    return BoxDecoration(
      color: color ?? Get.theme.primaryColor,
      borderRadius: BorderRadius.all(Radius.circular(radius ?? boxRadius)),
      boxShadow: [
        BoxShadow(
          color: shadowColor??Get.theme.primaryColor.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
      ],
      border:  Border.all(color:border!=null ? Get.theme.textTheme.titleSmall!.color!:Get.theme.cardColor),
      gradient: gradient,
    );
  }

  BoxFit getBoxFit(String boxFit) {
    switch (boxFit) {
      case cover:
        return BoxFit.cover;
      case fill:
        return BoxFit.fill;
      case contain:
        return BoxFit.contain;
      case fitHeight:
        return BoxFit.fitHeight;
      case fitWidth:
        return BoxFit.fitWidth;
      case none:
        return BoxFit.none;
      case scaleDown:
        return BoxFit.scaleDown;
      default:
        return BoxFit.cover;
    }
  }

  AlignmentDirectional getAlignmentDirectional(String alignmentDirectional) {
    switch (alignmentDirectional) {
      case topStart:
        return AlignmentDirectional.topStart;
      case topCenter:
        return AlignmentDirectional.topCenter;
      case topEnd:
        return AlignmentDirectional.topEnd;
      case centerStart:
        return AlignmentDirectional.centerStart;
      case center:
        return AlignmentDirectional.topCenter;
      case centerEnd:
        return AlignmentDirectional.centerEnd;
      case bottomStart:
        return AlignmentDirectional.bottomStart;
      case bottomCenter:
        return AlignmentDirectional.bottomCenter;
      case bottomEnd:
        return AlignmentDirectional.bottomEnd;
      default:
        return AlignmentDirectional.bottomEnd;
    }
  }

  CrossAxisAlignment getCrossAxisAlignment(String textPosition) {
    switch (textPosition) {
      case topStart:
        return CrossAxisAlignment.start;
      case topCenter:
        return CrossAxisAlignment.center;
      case topEnd:
        return CrossAxisAlignment.end;
      case centerStart:
        return CrossAxisAlignment.center;
      case center:
        return CrossAxisAlignment.center;
      case centerEnd:
        return CrossAxisAlignment.center;
      case bottomStart:
        return CrossAxisAlignment.start;
      case bottomCenter:
        return CrossAxisAlignment.center;
      case bottomEnd:
        return CrossAxisAlignment.end;
      default:
        return CrossAxisAlignment.start;
    }
  }

  Widget customLottieLoader() {
    return const Center(
      child: Image(
        image: AssetImage(
          'assets/loading.gif',
        ),
      ),
    );
  }
   Widget getIconButton({double? height,Widget? child, double? width, double? radius = 0.0, Color? color, Color? svgColor, String? text='', VoidCallback? press}) {
    return InkWell(
      onTap: press,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(radius!)),
        child:Center(
          child: child ?? Center(
            child: Text(
              text!,
              style: TextStyle(color: Get.theme.textTheme.bodyText1!.color),
            ),
          ),
        ),
      ),
    );
  }
  Widget customBackIcon({VoidCallback? onPress, Color? color}) {

    return getIconButton(
        height: Get.size.width * .12,
        width: Get.size.width * .12,
        color: Colors.blue.withOpacity(0.15),
        svgColor: Colors.black,
        radius: 30,
        press: () {
          Get.back();
        },
      child: Center(
        child: Icon(
          Icons.arrow_back,
          color: color!,
          size: Get.size.width*0.05,
        ),
      ),
    );
  }

  Widget customSmallBox({double? size, Color? color, Widget? child, double? radius}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color!, borderRadius: BorderRadius.circular(radius ?? boxRadius)),
      child: Center(child: child),
    );
  }
   customDialogLoader() {
    return Get.dialog(Center(child: const CircularProgressIndicator()));
  }
  showAwesomeDialog(String title, String description, Color? color, VoidCallback? onTap, context,
      {bool showClose = false, bool isBarrierDismiss = true, double? width, String type = '', String okay = 'Okay', String cancel = 'No'}) {
    Size size = MediaQuery.of(context).size;
    return AwesomeDialog(
      context: context,
      dialogType: type == 'success'
          ? DialogType.success
          : type == 'error'
              ? DialogType.error
              : type == 'warning'
                  ? DialogType.warning
                  : DialogType.noHeader,
      borderSide: BorderSide(
        color: Get.theme.primaryColor,
        width: 1,
      ),
      btnOkColor: color ?? Get.theme.primaryColor,
      width: size.width,
      buttonsBorderRadius: BorderRadius.all(
        Radius.circular(boxRadius),
      ),
      dismissOnTouchOutside: isBarrierDismiss,
      dismissOnBackKeyPress: false,
      headerAnimationLoop: false,
      animType: AnimType.bottomSlide,
      title: title,
      titleTextStyle: TextStyle(
        fontSize: bigMediumFontSize,
        color: Get.theme.textTheme.titleMedium!.color,
        fontWeight: FontWeight.normal,
      ),
      desc: description,
      descTextStyle: TextStyle(
        fontSize: mediumFontSize,
        color: Get.theme.textTheme.titleMedium!.color,
        fontWeight: FontWeight.normal,
      ),
      showCloseIcon: false,
      btnCancel: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          showClose
              ? BlockButtonWidget(
                  color: Get.theme.buttonTheme.colorScheme!.onError,
                  hasBorder: true,
                  width: size.width * 0.3,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    cancel,
                    style: TextStyle(
                      color: Get.theme.textTheme.titleMedium!.color,
                    ),
                  ),
                )
              : Wrap(),
          BlockButtonWidget(
            color: Get.theme.primaryColor,
            onPressed: onTap,
            width: showClose ? size.width * 0.3 : size.width * 0.6,
            child: Text(
              okay,
              style: TextStyle(
                color: Get.theme.cardColor,
              ),
            ),
          ),
          SizedBox(
            height: size.width * 0.03,
          ),
        ],
      ),
    ).show();
  }

  Widget shimmerLoader({double? width = 200, double? radius=10, double? height = 100, Color? baseColor, Color? highlightColor}) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Get.theme.cardColor,
      highlightColor: highlightColor ?? Get.theme.cardColor.withOpacity(0.4),
      child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Get.theme.cardColor,
            borderRadius: BorderRadius.circular(radius!)
          )),
    );
  }
}
