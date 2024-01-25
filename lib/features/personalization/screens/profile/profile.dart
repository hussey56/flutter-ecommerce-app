import 'package:ecom3/common/widgets/appbar/appbar.dart';
import 'package:ecom3/common/widgets/images/circular_image.dart';
import 'package:ecom3/common/widgets/text/section_heading.dart';
import 'package:ecom3/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:ecom3/utils/constants/image_strings.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    const HCircularImage(
                      image: HImages.user,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                        onPressed: () {},
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
                  onPressed: () {}, title: "Name", value: "Ibrahim Ali"),
              ProfileMenu(
                  onPressed: () {}, title: "Username", value: "ibrahim_ali3"),
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
                  value: "453453"),
              ProfileMenu(
                  onPressed: () {},
                  title: "E-mail",
                  value: "ibrahimali12@gmail.com"),
              ProfileMenu(
                  onPressed: () {},
                  title: "Phone Number",
                  value: "+54645464566"),
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
                  onPressed: () {},
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
