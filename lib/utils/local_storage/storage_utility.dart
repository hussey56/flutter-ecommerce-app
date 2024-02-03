import 'package:get_storage/get_storage.dart';

class HLocalStorage {
  late final GetStorage _storage;

static HLocalStorage? _instance;

factory HLocalStorage.instance() {
  _instance ??= HLocalStorage._internal();
   return _instance!;
}
HLocalStorage._internal();


// initialize user new storage bucket
  static Future<void> init(String bucketName)async{
    await GetStorage.init(bucketName);
    _instance = HLocalStorage._internal();
    _instance!._storage = GetStorage(bucketName);
  }
  // Generic method to save data
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  // Generic method to read data
  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

// remove data Generic method
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

// clear all data
  Future<void> clearAll() async {
    await _storage.erase();
  }
}
