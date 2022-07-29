import 'package:flutter/material.dart';
import 'package:flutter_application_getx/controllers/cart_controller.dart';
import 'package:flutter_application_getx/widgets/card_products_cart.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  final cartController = Get.put(CartController());

  Widget _appbar(context) {
    return Stack(
      children: [
        const SizedBox(
          height: 58,
          child: Center(
            child: Text(
              'Order Details',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _appbar(context),
              const SizedBox(height: 32),
              const Text(
                'My Cart',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 130,
                child: GetX<CartController>(
                  builder: (controller) {
                    return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.cartItens.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 350,
                            child: CardProductCart(
                                index: index,
                                controller: controller,
                                cartController: cartController),
                          );
                        });
                  },
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Delivery Location',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.place,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '2 Petre Melikishvili St.',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '0162, Tbilisi',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Payment Method',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.credit_card,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Visa Classic',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '**** **** **** 0921',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Order Info',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  const Text(
                    'Subtotal',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  GetX<CartController>(
                    builder: (controller) {
                      return Text(
                        '\$${controller.totalPrice}0',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: const [
                  Text(
                    'Shipping Cost',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '+\$10.00',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  GetX<CartController>(
                    builder: (controller) {
                      return Text(
                        '\$${controller.totalPrice + 10}0',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 32),
              GestureDetector(
                onTap: () {
                  if (cartController.cartItens.isEmpty) {
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Center(child: GetX<CartController>(
                    builder: (controller) {
                      return cartController.cartItens.isNotEmpty
                          ? Text(
                              'CHECKOUT (${cartController.totalPrice + 10}0)',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            )
                          : const Text('BACK TO SHOP',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600));
                    },
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
