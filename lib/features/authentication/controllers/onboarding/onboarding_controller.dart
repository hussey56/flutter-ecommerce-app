import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../screens/login/login.dart';

class onBoardingController extends GetxController{
  static onBoardingController get instance => Get.find();

  // Varaibles
final pageController = PageController();
/// it is used to change the ui without the state mangement
Rx<int> currentPageIndex = 0.obs;

 // Update Current Index when page Screll
void updatePageIndicator(index) => currentPageIndex.value = index;

   // Jump to the selected page by indicator selection
void dotNavigationClick(index){
  currentPageIndex.value = index;
  pageController.jumpTo(index);
}

  // Update Current Index & jump to next page
void nextPage(){
  if(currentPageIndex.value == 2){
    final storage  = GetStorage();
    storage.write("isFirstTime", false);
     Get.to(const LoginScreen());
  }else{
    int page = currentPageIndex.value + 1;
    pageController.jumpToPage(page);
  }
}

  // Update current Index  and jump to the last page
void skipPage(){
  currentPageIndex.value = 2;
  pageController.jumpToPage(2);
}
}