import 'package:flutter_application_getx/model/product_model.dart';
import 'package:get/get.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(const Duration(seconds: 1));
    var productResult = <Product>[
      Product(
        id: 1,
        price: 20.00,
        productDescription: 'Produto usado na hora do banho',
        productImage: 'assets/produtos-de-higiene.png',
        productName: 'ParaBanho',
      ),
      Product(
        id: 2,
        price: 39.90,
        productDescription: 'Linda bermuda para ir a praia',
        productImage: 'assets/roupa-de-banho.png',
        productName: 'Bermuda de praia',
      ),
      Product(
        id: 3,
        price: 3.99,
        productDescription: 'Sabonete para banho super cheiroso',
        productImage: 'assets/sabonete.png',
        productName: 'Sabonete Cheirim',
      ),
    ];

    products.value = productResult;
  }
}
