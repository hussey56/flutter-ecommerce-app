
import 'package:ecom3/common/widgets/loaders/animation_loader.dart';
import 'package:ecom3/utils/constants/colors.dart';
import 'package:ecom3/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HFullScreenLoader{

  static void openLoadingDialog(String text,String animation){
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_)=>PopScope(
        canPop: false,
        child: Container(
color: THelperFunctions.isDarkMode(Get.context!)?HColors.dark: HColors.light,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250,),
              AnimationLoaderWidget(text: text, animation: animation)
            ],
          ),
        ),
      )
    );
  }
  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}