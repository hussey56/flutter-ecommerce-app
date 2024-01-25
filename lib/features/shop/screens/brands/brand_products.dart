import 'package:ecom3/common/widgets/appbar/appbar.dart';
import 'package:ecom3/common/widgets/product/sortable/product_sortable.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/brand/brand_card.dart';
class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HAppBar(title: Text('Nike'),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            children: [
            //  Brand Details
              BrandCard(showBorder: true,),
              SizedBox(height: HSizes.spaceBtwSection,),
              SortableProducts()
            ],
          ),
        ),
      ),
    );
  }
}
