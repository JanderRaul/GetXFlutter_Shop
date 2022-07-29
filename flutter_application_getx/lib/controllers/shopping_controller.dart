import 'package:flutter_application_getx/model/accessories_model.dart';
import 'package:flutter_application_getx/model/product_model.dart';
import 'package:get/get.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;
  var accessories = <Accessorie>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
    fetchAccessories();
  }

  void fetchProducts() async {
    await Future.delayed(const Duration(seconds: 1));
    var productResult = <Product>[
      Product(
        id: 1,
        price: 200.00,
        productDescription: '',
        productImage: 'assets/haedset.jpg',
        productName: 'AKG N700NCM2 Wireless Headphones',
      ),
      Product(
        id: 2,
        price: 250.00,
        productDescription: '',
        productImage: 'assets/headset2.jpg',
        productName: 'AIAIAI TMA-2 Modular Headphones',
      ),
      Product(
        id: 3,
        price: 290.00,
        productDescription: '',
        productImage: 'assets/headset3.jpg',
        productName: 'AIAIAI TMA-3 Modular Headphones',
      ),
    ];

    products.value = productResult;
  }

  void fetchAccessories() async {
    await Future.delayed(const Duration(seconds: 1));
    var accessoriesResult = <Accessorie>[
      Accessorie(
        id: 1,
        productName: 'USB-C to USB-C Cable (2 m) Black',
        productImage: 'assets/cables2.jpg',
        price: 49.00
      ),
      Accessorie(
        id: 2,
        productName: 'Multi Charging Cable 4 in 1 Premium',
        productImage: 'assets/cables.jpg',
        price: 21.00
      ),
      Accessorie(
        id: 3,
        productName: 'Apple Charger Lightning',
        productImage: 'assets/carregador.jpg',
        price: 25.00
      ),
    ];

    accessories.value = accessoriesResult;
  }
}
