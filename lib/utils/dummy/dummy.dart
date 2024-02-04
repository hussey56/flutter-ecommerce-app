import 'package:ecom3/features/shop/models/banner_model.dart';
import 'package:ecom3/features/shop/models/brand_model.dart';
import 'package:ecom3/features/shop/models/category_model.dart';
import 'package:ecom3/features/shop/models/product_attributes_model.dart';
import 'package:ecom3/features/shop/models/product_model.dart';
import 'package:ecom3/features/shop/models/product_variation_model.dart';
import 'package:ecom3/routes/routes.dart';
import 'package:ecom3/utils/constants/enum.dart';
import 'package:ecom3/utils/constants/image_strings.dart';

class HDummyData {
  static final List<BannerModel> banners = [
    BannerModel(
        imageUrl: HImages.promo1, targetScreen: HRoutes.cart, active: true),
    BannerModel(
        imageUrl: HImages.promo2,
        targetScreen: HRoutes.favourites,
        active: true),
    BannerModel(
        imageUrl: HImages.promo3,
        targetScreen: HRoutes.allProducts,
        active: true),
  ];
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: "1", name: "Animals", image: HImages.animalIcon, isFeatured: true),
    CategoryModel(
        id: "2", name: "Shoes", image: HImages.shoesIcon, isFeatured: true),
    CategoryModel(
        id: "3", name: "Sports", image: HImages.sportsIcon, isFeatured: true),
    CategoryModel(
        id: "4",
        name: "Furniture",
        image: HImages.furnitureIcon,
        isFeatured: true),
    CategoryModel(
        id: "5",
        name: "Jewellery",
        image: HImages.jewellryIcon,
        isFeatured: true),
    CategoryModel(
        id: "6",
        name: "Electronics",
        image: HImages.electronicIcon,
        isFeatured: true),
    CategoryModel(
        id: "7",
        name: "Cosmetics",
        image: HImages.cosmeticIcon,
        isFeatured: true),
    CategoryModel(
        id: "8", name: "Cloths", image: HImages.clothesIcon, isFeatured: true),
    CategoryModel(
        id: "9",
        name: "Track Suits",
        image: HImages.sportsIcon,
        isFeatured: false,
        parentId: "3"),
    CategoryModel(
        id: "10",
        name: "Sport Equipment",
        image: HImages.sportsIcon,
        isFeatured: false,
        parentId: "3"),
    CategoryModel(
        id: "11",
        name: "Sport Gadgets",
        image: HImages.sportsIcon,
        isFeatured: false,
        parentId: "3"),
    CategoryModel(
      id: "12",
      name: "Toys",
      image: HImages.toyIcon,
      isFeatured: true,
    ),
    CategoryModel(
        id: "13",
        name: "Mobile",
        image: HImages.electronicIcon,
        isFeatured: false,
        parentId: "6"),
    CategoryModel(
        id: "14",
        name: "Laptop",
        image: HImages.electronicIcon,
        isFeatured: false,
        parentId: "6"),
    CategoryModel(
        id: "15",
        name: "Camera",
        image: HImages.electronicIcon,
        isFeatured: false,
        parentId: "6"),
    CategoryModel(
        id: "16",
        name: "Kitchen Furniture",
        image: HImages.furnitureIcon,
        isFeatured: false,
        parentId: "4"),
    CategoryModel(
        id: "16",
        name: "Bedroom Furniture",
        image: HImages.furnitureIcon,
        isFeatured: false,
        parentId: "4"),
    CategoryModel(
        id: "16",
        name: "Office Furniture",
        image: HImages.furnitureIcon,
        isFeatured: false,
        parentId: "4"),
  ];

  static final List<ProductModel> products = [

    ProductModel(
        id: "008",
        title: "Iphone 14 Pro Max",
        stock: 200,
        price: 994,
        salePrice: 990,
        sku: '35EDRRE',
        thumbnail: HImages.iphone,
        isFeatured: true,
        description: "New Iphone 14 pro max with box and air pods inside it.",
        productAttributes: [
          ProductAttributesModel(
              name: 'Color', values: ['Blue', 'Red', 'Black']),
        ],
        brand: BrandModel(
            id: '2',
            image: HImages.appleLogo,
            name: 'Apple',
            productsCount: 156,
            isFeatured: true),
        categoryId: '6',
        images: [
          HImages.iphone,
          HImages.iphone_black,
          HImages.iphone_blue,
          HImages.iphone_red
        ],
        productType: ProductType.single.toString()),
    ProductModel(
        id: '009',
        title: 'Black T-shirt',
        stock: 15,
        price: 155,
        isFeatured: true,
        thumbnail: HImages.product5,
        description:
            'Stylish brand new nike black t-shirt for you amazing lifestyle.',
        brand: BrandModel(
            id: '1',
            image: HImages.nikeLogo,
            name: 'Nike',
            productsCount: 256,
            isFeatured: true),
        images: [
          HImages.product5,
        ],
        salePrice: 130,
        sku: '3433EDRRE',
        categoryId: '15',
        productType: ProductType.single.toString()),
    ProductModel(
        id: '010',
        title: 'Air Pods',
        stock: 15,
        price: 95,
        isFeatured: true,
        thumbnail: HImages.airpods_1,
        description:
            'Stylish brand new nike black t-shirt for you amazing lifestyle.',
        brand: BrandModel(
            id: '2',
            image: HImages.appleLogo,
            name: 'Apple',
            productsCount: 156,
            isFeatured: true),
        images: [HImages.airpods_1, HImages.airpods_2],
        salePrice: 67,
        sku: '378EDRRE',
        categoryId: '15',
        productType: ProductType.single.toString()),
    ProductModel(
        id: '005',
        title: 'Acer Laptop G34',
        stock: 15,
        price: 195,
        isFeatured: true,
        thumbnail: HImages.acer_laptop_1,
        description:
            'lorem ipsum is now a days great text description for demo purpose',
        brand: BrandModel(
            id: '3',
            image: HImages.acer_logo,
            name: 'Acer',
            productsCount: 78,
            isFeatured: true),
        images: [HImages.acer_laptop_1, HImages.acer_laptop_2],
        salePrice: 167,
        sku: '3008EDRRE',
        categoryId: '14',
        productType: ProductType.single.toString()),
    ProductModel(
        id: '006',
        title: 'Levis T-Shirt',
        stock: 15,
        price: 55,
        isFeatured: true,
        thumbnail: HImages.levis_tshirt_1,
        description:
            'lorem ipsum is now a days great text description for demo purpose',
        brand: BrandModel(
            id: '4',
            image: HImages.levis_logo,
            name: 'Levis',
            productsCount: 299,
            isFeatured: true),
        images: [HImages.levis_tshirt_1, HImages.levis_tshirt_2],
        salePrice: 47,
        sku: '30rtEDRRE',
        categoryId: '13',
        productType: ProductType.single.toString()),
  ];
}
//
// ProductModel(
// id: '001',
// title: 'Nike Shoes Air Jordan',
// stock: 15,
// price: 135,
// isFeatured: true,
// thumbnail: HImages.redjordan,
// description: 'Stylish brand new nike legacy shoes of michael jordan.',
// brand: BrandModel(
// id: '1',
// image: HImages.nikeLogo,
// name: 'Nike',
// productsCount: 256,
// isFeatured: true),
// images: [
// HImages.redjordan,
// HImages.greenjordan,
// HImages.blackjordan,
// ],
// salePrice: 30,
// sku: '34EDRRE',
// categoryId: '2',
// productAttributes: [
// ProductAttributesModel(
// name: 'Color', values: ['Green', 'Red', 'Black']),
// ProductAttributesModel(
// name: 'Size', values: ['EU 45', 'EU 32', 'EU 44']),
// ],
// productVariations: [
// ProductVariationModel(
// id: '1',
// stock: 34,
// price: 134,
// salePrice: 122.6,
// image: HImages.greenjordan,
// description:
// 'This is a product description please read it carefully',
// attributeValues: {'Color': 'Green', 'Size': 'EU 45'}),
// ProductVariationModel(
// id: '2',
// stock: 15,
// price: 134,
// image: HImages.blackjordan,
// attributeValues: {'Color': 'Black', 'Size': 'EU 44'}),
// ProductVariationModel(
// id: '3',
// stock: 0,
// price: 234,
// image: HImages.redjordan,
// attributeValues: {'Color': 'Red', 'Size': 'EU 32'}),
// ProductVariationModel(
// id: '4',
// stock: 23,
// price: 434,
// image: HImages.greenjordan,
// attributeValues: {'Color': 'Green', 'Size': 'EU 32'}),
// ProductVariationModel(
// id: '5',
// stock: 253,
// price: 254,
// image: HImages.redjordan,
// attributeValues: {'Color': 'Red', 'Size': 'EU 44'}),
// ProductVariationModel(
// id: '6',
// stock: 13,
// price: 244,
// image: HImages.blackjordan,
// attributeValues: {'Color': 'Black', 'Size': 'EU 32'}),
// ],
// productType: ProductType.variable.toString()),