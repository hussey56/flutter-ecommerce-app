import 'package:ecom3/common/widgets/appbar/appbar.dart';
import 'package:ecom3/common/widgets/images/circular_image.dart';
import 'package:ecom3/common/widgets/loaders/shimmer_loader.dart';
import 'package:ecom3/common/widgets/text/section_heading.dart';
import 'package:ecom3/features/personalization/controllers/user_controller.dart';
import 'package:ecom3/features/personalization/screens/profile/widgets/namechange.dart';
import 'package:ecom3/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:ecom3/utils/constants/image_strings.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.insatnce;

    return Scaffold(
      appBar: HAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image =
                          networkImage.isNotEmpty ? networkImage : HImages.user;

                      return controller.imageUploader.value?
                          const HShimmerEffect(height: 80, width: 80,radius: 80,)
                          : HCircularImage(
                        image: image,
                        width: 80,
                        height: 80,
                        isNetworkImage: networkImage.isNotEmpty,
                      );
                    }),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: const Text('Change Profile Picture'))
                  ],
                ),
              ),
              const SizedBox(
                height: HSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: HSizes.spaceBtwItems,
              ),
              const HSectionHeading(
                title: "Profile Information",
                showActionButton: false,
              ),
              const SizedBox(
                height: HSizes.spaceBtwItems,
              ),
              ProfileMenu(
                  onPressed: () => Get.to(() => const Namehange()),
                  title: "Name",
                  value: controller.user.value.fullName),
              ProfileMenu(
                  onPressed: () {},
                  title: "Username",
                  value: controller.user.value.username),
              const SizedBox(
                height: HSizes.spaceBtwItems,
              ),
              const Divider(),
              const SizedBox(
                height: HSizes.spaceBtwItems,
              ),
              const HSectionHeading(
                title: "Personal Information",
                showActionButton: false,
              ),
              const SizedBox(
                height: HSizes.spaceBtwItems,
              ),
              ProfileMenu(
                  onPressed: () {},
                  icon: Iconsax.copy,
                  title: "User ID",
                  value: controller.user.value.id),
              ProfileMenu(
                  onPressed: () {},
                  title: "E-mail",
                  value: controller.user.value.email),
              ProfileMenu(
                  onPressed: () {},
                  title: "Phone Number",
                  value: controller.user.value.phoneNumber),
              ProfileMenu(onPressed: () {}, title: "Gender", value: "male"),
              ProfileMenu(
                  onPressed: () {},
                  title: "Date of Birth",
                  value: "10 Dec 1999"),
              const Divider(),
              const SizedBox(
                height: HSizes.spaceBtwItems,
              ),
              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
