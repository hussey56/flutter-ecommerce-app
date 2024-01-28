import 'package:ecom3/common/widgets/loaders/myloaders.dart';
import 'package:ecom3/features/shop/models/banner_model.dart';
import 'package:get/get.dart';

import '../../../data/repositories/banners/banner_repository.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/dummy/dummy.dart';
import '../../../utils/popups/full_screen_loader.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  final carouselCurrentIndex = 0.obs;
  final isLoading = false.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;
  RxList<BannerModel> feturedbanners = <BannerModel>[].obs;

  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    fetchBanners();
  }

// Load Banner data
  Future<void> fetchBanners() async {
    try {
      // start loader
      isLoading.value = true;
      // fetch Banner from data source (api, firestore)
      final bannerRepo = Get.put(BannerRepository());
      final obanners = await bannerRepo.getAllBanners();

      // assign reponse to local variable
      this.banners.assignAll(obanners);

      // feturedbanners.assignAll(this.banners.take(3).toList());
    } catch (e) {
      HLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // upload dummy data
  Future<void> addDummyData() async {
    try {
      HFullScreenLoader.openLoadingDialog(
          "Uploading Banners", HImages.registerAnimation);
      final data = HDummyData.banners;
      final bannerRepo = Get.put(BannerRepository());
      await bannerRepo.uploadDummyData(data);
      HLoaders.successSnackBar(
          title: "Success", message: "Data Uploaded Successfully");
    } catch (e) {
      HLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      HFullScreenLoader.stopLoading();
    }
  }
}
