import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom3/common/widgets/appbar/appbar.dart';
import 'package:ecom3/common/widgets/layouts/gridview_layout.dart';
import 'package:ecom3/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:ecom3/common/widgets/shimmer/vertical_shimmer_loader.dart';
import 'package:ecom3/features/shop/controllers/all_products_controller.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:ecom3/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/product/sortable/product_sortable.dart';
import '../../models/product_model.dart';

class AllProducts extends StatelessWidget {
  const AllProducts(
      {super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    return Scaffold(
      appBar: HAppBar(
        title: Text(title),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: FutureBuilder(
              future: futureMethod ?? controller.fetchProductsByQuery(query),
              builder: (context, snapshot) {
                const loader = HVerticalProductShimmer();
               final widget = HCloudHelperFuction.checkMultipleRecordState(snapshot: snapshot,loader: loader);
               if(widget !=null)return widget;

                final products = snapshot.data!;
                return SortableProducts(products: products,);
              }),
        ),
      ),
    );
  }
}
