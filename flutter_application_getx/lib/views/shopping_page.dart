import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_getx/controllers/cart_controller.dart';
import 'package:flutter_application_getx/controllers/shopping_controller.dart';
import 'package:flutter_application_getx/views/cart_page.dart';
import 'package:get/get.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({Key? key}) : super(key: key);

  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 114, 164, 250),
      appBar: AppBar(
        title: const Text('App Shopping'),
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 114, 164, 250),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(),
                ));
          }, icon: GetX<CartController>(
            builder: (controller) {
              return Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Badge(
                    padding: const EdgeInsets.all(4.0),
                    showBadge: cartController.countItens > 0 ? true : false,
                    badgeContent: Text(
                      cartController.countItens.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.bold),
                    ),
                    badgeColor: Colors.amber,
                    child: const Icon(Icons.shopping_cart)),
              );
            },
          ))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(builder: (controller) {
                return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(controller
                                          .products[index].productImage!),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.35,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller
                                              .products[index].productName!,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87),
                                        ),
                                        Text(
                                          controller.products[index]
                                              .productDescription!,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    'R\$ ${controller.products[index].price!}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                        color:
                                            Color.fromARGB(255, 17, 101, 197)),
                                  ),
                                ],
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                alignment: Alignment.bottomRight,
                                child: RaisedButton(
                                  onPressed: () {
                                    cartController
                                        .addToCart(controller.products[index]);
                                  },
                                  color: Colors.blue,
                                  textColor: Colors.white,
                                  child: const Text('Add to Cart'),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            GetX<CartController>(builder: (controller) {
              return Text(
                'Total: R\$ ${controller.totalPrice}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              );
            }),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
