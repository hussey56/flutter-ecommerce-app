
import 'package:ecom3/features/shop/models/category_model.dart';
import 'package:ecom3/utils/constants/image_strings.dart';

class HDummyData{
  static final List<CategoryModel> categories = [
    CategoryModel(id: "1", name: "Animals", image: HImages.animalIcon, isFeatured: true),
    CategoryModel(id: "2", name: "Shoes", image: HImages.shoesIcon, isFeatured: true),
    CategoryModel(id: "3", name: "Sports", image: HImages.sportsIcon, isFeatured: true),
    CategoryModel(id: "4", name: "Furniture", image: HImages.furnitureIcon, isFeatured: true),
    CategoryModel(id: "5", name: "Jewellery", image: HImages.jewellryIcon, isFeatured: true),
    CategoryModel(id: "6", name: "Electronics", image: HImages.electronicIcon, isFeatured: true),
    CategoryModel(id: "7", name: "Cosmetics", image: HImages.cosmeticIcon, isFeatured: true),
    CategoryModel(id: "8", name: "Cloths", image: HImages.clothesIcon, isFeatured: true),


    CategoryModel(id: "9", name: "Track Suits", image: HImages.sportsIcon, isFeatured: false,parentId: "3"),
    CategoryModel(id: "10", name: "Sport Equipment", image: HImages.sportsIcon, isFeatured: false,parentId: "3"),
    CategoryModel(id: "11", name: "Sport Gadgets", image: HImages.sportsIcon, isFeatured: false,parentId: "3"),

    CategoryModel(id: "12", name: "Toys", image: HImages.toyIcon, isFeatured: true,),

    CategoryModel(id: "13", name: "Mobile", image: HImages.electronicIcon, isFeatured: false,parentId: "6"),
    CategoryModel(id: "14", name: "Laptop", image: HImages.electronicIcon, isFeatured: false,parentId: "6"),
    CategoryModel(id: "15", name: "Camera", image: HImages.electronicIcon, isFeatured: false,parentId: "6"),

    CategoryModel(id: "16", name: "Kitchen Furniture", image: HImages.furnitureIcon, isFeatured: false,parentId: "4"),
    CategoryModel(id: "16", name: "Bedroom Furniture", image: HImages.furnitureIcon, isFeatured: false,parentId: "4"),
    CategoryModel(id: "16", name: "Office Furniture", image: HImages.furnitureIcon, isFeatured: false,parentId: "4"),

  ];
}