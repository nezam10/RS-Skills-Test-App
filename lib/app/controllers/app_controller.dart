import 'package:connectivity_plus/connectivity_plus.dart' as connectivity;
import 'package:get/get.dart';
class AppController extends GetxController {
  var isLoadPropertyType = true.obs;

  //final _propertyType = <PropertyTypesModel>[].obs;
  //List<PropertyTypesModel> get propertyType => _propertyType;

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() async {
    print('close app controller star==== ');
    //await userLogout();
    super.onClose();
    print('close app controller end==== ');
  }



  Future<bool> checkInternetConnection() async {
    final connectivity.ConnectivityResult connectivityResult =
        await connectivity.Connectivity().checkConnectivity();

    if (GetPlatform.isAndroid) {
      if (connectivityResult == connectivity.ConnectivityResult.mobile) {
        return true;
      } else if (connectivityResult == connectivity.ConnectivityResult.wifi) {
        return true;
      } else if (connectivityResult == connectivity.ConnectivityResult.none) {
        return false;
      } else {
        return false;
      }
    } else {
      if (connectivityResult == connectivity.ConnectivityResult.mobile) {
        return true;
      } else if (connectivityResult == connectivity.ConnectivityResult.wifi) {
        return true;
      } else if (connectivityResult == connectivity.ConnectivityResult.none) {
        return false;
      } else {
        return false;
      }
    }
  }
}
