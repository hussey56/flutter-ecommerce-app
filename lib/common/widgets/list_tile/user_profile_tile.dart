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
    return ListTile(
      leading: const HCircularImage(
        image: HImages.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        'Muhammad Khan',
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: HColors.white),
      ),
      subtitle: Text(
        'muhammadkn2913@gmail.com',
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .apply(color: HColors.white),
      ),
      trailing: IconButton(
        onPressed: () {
          Get.to(()=>const ProfileScreen());
        },
        icon: const Icon(
          Iconsax.edit,
          color: HColors.white,
        ),
      ),
    );
  }
}