

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom3/features/personalization/models/address_model.dart';
import 'package:ecom3/features/shop/models/cart_item_model.dart';
import 'package:ecom3/utils/constants/enum.dart';
import 'package:ecom3/utils/helpers/helper_functions.dart';

class OrderModel {
  final String id;
  final String userId;
  final OrderStatus status;
  final double totalAmount;
  final DateTime orderDate;
  final String paymentMethod;
  final AddressModel? address;
  final DateTime? deliveryDate;
  final List<CartItemModel> items;

  OrderModel(
      {required this.id,
      this.userId = '',
      required this.status,
      required this.items,
      required this.totalAmount,
      required this.orderDate,
      this.paymentMethod = 'Paypal',
      this.address,
      this.deliveryDate});

  String get formattedOrderDate => THelperFunctions.getFormattedDate(orderDate);

  String get formattedDeliveryDate => deliveryDate != null
      ? THelperFunctions.getFormattedDate(deliveryDate!)
      : '';

  String get orderStatusText => status == OrderStatus.deliverd
      ? 'Delivered'
      : status == OrderStatus.shipped
          ? "Shipment on the way"
          : "Processing";

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'status': status.toString(),
      'totalAmount': totalAmount,
      'orderDate': orderDate,
      'paymentMethod': paymentMethod,
      'address': address?.toJson(),
      'deliveryDate': deliveryDate,
      'items': items.map((e) => e.toJson()).toList(),
    };
  }

  factory OrderModel.fromSnapshot(DocumentSnapshot document) {
    final data = document.data() as Map<String, dynamic>;
    return OrderModel(
        id: data['id'],
        userId: data['userId'] as String,
        status: OrderStatus.values
            .firstWhere((element) => element.toString() == data['status']),
        totalAmount: data['totalAmount'] as double,
        orderDate: (data['orderDate'] as Timestamp).toDate(),
        paymentMethod: data['paymentMethod'] as String,
        address: AddressModel.fromMap(data['address'] as Map<String, dynamic>),
        deliveryDate: data['deliveryDate'] == null
            ? null
            : (data['deliveryDate'] as Timestamp).toDate(),
        items: (data['items'] as List<dynamic>)
            .map((itemData) =>
                CartItemModel.fromJson(itemData as Map<String, dynamic>))
            .toList());
  }
}
