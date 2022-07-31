import 'package:flutter_application_getx/model/product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItens = <Product>[].obs;
  int get countItens => cartItens.length;
  double get totalPrice =>
      cartItens.fold(0, (sum, item) => sum + ((item.price!) * item.quant.value));

  addToCart(Product product) {
    cartItens.add(product);
  }

  removeCart(Product item) {
    cartItens.remove(item);
  }
}
