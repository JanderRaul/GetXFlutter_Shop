import 'package:flutter/material.dart';
import 'package:flutter_application_getx/controllers/cart_controller.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 114, 164, 250),
      appBar: AppBar(
        title: const Text('Carrinho'),
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 114, 164, 250),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(child: GetX<CartController>(
            builder: (controller) {
              return ListView.builder(
                itemCount: controller.cartItens.length,
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
                                        .cartItens[index].productImage!),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller
                                            .cartItens[index].productName!,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87),
                                      ),
                                      Text(
                                        controller.cartItens[index]
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'R\$ ${controller.cartItens[index].price!}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                          color: Color.fromARGB(
                                              255, 17, 101, 197)),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          cartController.removeCart(
                                              controller.cartItens[index]);
                                        },
                                        icon: const Icon(Icons.delete, color: Colors.red,))
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ))
        ],
      )),
    );
  }
}
