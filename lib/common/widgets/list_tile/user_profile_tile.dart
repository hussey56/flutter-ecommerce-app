import 'package:ecom3/features/personalization/controllers/user_controller.dart';
import 'package:ecom3/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../features/personalization/screens/profile/profile.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/circular_image.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.insatnce;
    return Obx(
          () {
            final networkImage = controller.user.value.profilePicture;
            final image =
            networkImage.isNotEmpty ? networkImage : HImages.user;
          return  ListTile(
              leading: HCircularImage(
                image: image,
                width: 50,
                height: 50,
                padding: 0,
                isNetworkImage: networkImage.isNotEmpty,
              ),
              title: Text(
                controller.user.value.fullName,
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: HColors.white),
              ),
              subtitle: Text(
                controller.user.value.email,
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyMedium!
                    .apply(color: HColors.white),
              ),
              trailing: IconButton(
                onPressed: () {
                  Get.to(() => const ProfileScreen());
                },
                icon: const Icon(
                  Iconsax.edit,
                  color: HColors.white,
                ),
              ),
            );
          });
  }
}