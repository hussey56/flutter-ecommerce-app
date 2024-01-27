import 'package:ecom3/common/widgets/shimmer/shimmer_loader.dart';
import 'package:ecom3/features/personalization/controllers/user_controller.dart';
import 'package:ecom3/features/shop/screens/cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/cart/cart_menu_icon.dart';
import '../../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';
class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return HAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            HTexts.homeAppBarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: HColors.grey),
          ),
          Obx(
            (){
              if(controller.profileLoading.value == true){
                return const HShimmerEffect(height: 15, width: 80);
              }else{
                return Text(
                  controller.user.value.fullName,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: HColors.white),
                );
              }
            }
          ),
        ],
      ),
      actions: [
        HCartCounterIcon(
      //  Get.to(()=> const CartScreen()
          onPressed: () =>  Get.to(()=> const CartScreen()) ,
          iconColor: HColors.white,
        )
      ],
    );
  }
}