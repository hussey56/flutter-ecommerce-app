import 'package:ecom3/utils/constants/colors.dart';
import 'package:ecom3/utils/device/device_utility.dart';
import 'package:ecom3/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CTabBar extends StatelessWidget implements PreferredSizeWidget {
  // if you want to add a background color to tabs you have to wrap it toa material widget.
  // to do that PrefferedSized widget and thats why we do it below.
  const CTabBar({super.key, required this.tabs});
final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Material(
color: dark ? HColors.black : HColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable:true,
        indicatorColor:HColors.primary ,
        unselectedLabelColor: HColors.darkGrey,
        labelColor: dark ? HColors.white: HColors.primary,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(HDeviceUtils.getAppBarHeight());
}
