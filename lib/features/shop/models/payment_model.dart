class PaymentModel {
  String name;
  String image;

  PaymentModel({required this.image, required this.name});

  static PaymentModel empty() => PaymentModel(image: "", name: "");
}
