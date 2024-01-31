import 'package:ecom3/common/widgets/chips/choice_chip.dart';
import 'package:ecom3/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecom3/common/widgets/text/price_text.dart';
import 'package:ecom3/common/widgets/text/product_title.dart';
import 'package:ecom3/common/widgets/text/section_heading.dart';
import 'package:ecom3/features/shop/controllers/product/variation_controller.dart';
import 'package:ecom3/features/shop/models/product_model.dart';
import 'package:ecom3/utils/constants/colors.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:ecom3/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(VariationController());
    return Obx(
        ()=> Column(
        children: [
          // Selected Attributes Pricing and Description
          // display details when any variation is selected
          if (controller.selectedVariation.value.id.isNotEmpty)
            RoundedContainer(
              padding: const EdgeInsets.all(HSizes.md),
              backgroudColor: dark ? HColors.darkerGrey : HColors.grey,
              child: Column(
                children: [
                  Row(
                    children: [
                      HSectionHeading(
                        title: "Variation",
                        showActionButton: false,
                      ),
                      const SizedBox(
                        width: HSizes.spaceBtwItems,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const ProductTitle(title: 'Price : '),
                              // Actual Price
                              if(controller.selectedVariation.value.salePrice>0)
                              Text(
                                '\$${controller.selectedVariation.value.salePrice}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .apply(
                                        decoration: TextDecoration.lineThrough),
                              ),
                              const SizedBox(
                                width: HSizes.spaceBtwItems,
                              ),
                               ProductPriceText(price: controller.getVariationPrice()),
                            ],
                          ),
                          Row(
                            children: [
                              const ProductTitle(
                                title: 'Stock : ',
                                smallSize: true,
                              ),
                              Text(
                                controller.variationStockStatus.value,
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  //Variation Description

                  ProductTitle(
                    title:controller.selectedVariation.value.description??'No Description.',
                    smallSize: true,
                    maxLines: 4,
                  )
                ],
              ),
            ),
          const SizedBox(
            height: HSizes.spaceBtwItems,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map((attribute) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HSectionHeading(
                          title: attribute.name ?? '',
                          showActionButton: false,
                        ),
                        const SizedBox(
                          height: HSizes.spaceBtwItems / 2,
                        ),
                        Wrap(
                            spacing: 8,
                            children: attribute.values!.map((value) {
                              final isSelected =
                                  controller.selectedAttributes[attribute.name] ==
                                      value;
                              final available = controller
                                  .getAttributesAvailabilityInVariation(
                                      product.productVariations!, attribute.name!)
                                  .contains(value);

                              return HChoiceChip(
                                text: value,
                                selected: isSelected,
                                Selected: available
                                    ? (selected) {
                                        if (selected && available) {
                                          controller.onAttributeSelected(product,
                                              attribute.name ?? '', value);
                                          // print(available);
                                        }
                                      }
                                    : null,
                              );
                            }).toList())
                      ],
                    ))
                .toList(),
          )
          //  Attributes
        ],
      ),
    );
  }
}
