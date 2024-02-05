import 'package:ecom3/common/widgets/appbar/appbar.dart';
import 'package:ecom3/features/personalization/controllers/address_controller.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:ecom3/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Scaffold(
      appBar: HAppBar(
        showBackArrow: true,
        title: Text("Add New Address"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(HSizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value)=>HValidator.validateEmptyText("Name", value),
                  controller: controller.name,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user), labelText: 'Name'),
                ),
                const SizedBox(
                  height: HSizes.spaceBtwInputFields,
                ),
                TextFormField(
                  validator: (value)=>HValidator.validatePhoneNumber(value),
                  controller: controller.phoneNumber,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.mobile),
                      labelText: 'Phone Number'),
                ),
                const SizedBox(
                  height: HSizes.spaceBtwInputFields,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        validator: (value)=>HValidator.validateEmptyText("Street", value),
                        controller: controller.street,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.building_31),
                            labelText: 'Street'),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        validator: (value)=>HValidator.validateEmptyText("Postal Code", value),
                        controller: controller.postalCode,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.code),
                            labelText: 'Postal Code'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: HSizes.spaceBtwInputFields,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        validator: (value)=>HValidator.validateEmptyText("City", value),
                        controller: controller.city,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.building),
                            labelText: 'City'),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        validator: (value)=>HValidator.validateEmptyText("State", value),
                        controller: controller.state,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.activity),
                            labelText: 'State'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: HSizes.spaceBtwInputFields,
                ),
                TextFormField(
                  validator: (value)=>HValidator.validateEmptyText("Country", value),
                  controller: controller.country,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.global), labelText: 'Country'),
                ),
                const SizedBox(
                  height: HSizes.spaceBtwInputFields,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: ()=>controller.addNewAddress(),
                    child: Text("Save"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
