import 'package:flutter/material.dart';
import 'package:flutter_application_getx/controllers/cart_controller.dart';
import 'package:flutter_application_getx/controllers/shopping_controller.dart';
import 'package:flutter_application_getx/views/cart_page.dart';
import 'package:flutter_application_getx/views/details_page.dart';
import 'package:get/get.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({Key? key}) : super(key: key);

  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  Widget _title() {
    return const Text(
      'Hi-Fi Shop & Service',
      style: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _infoOne() {
    return const Text(
      'Audio Shop on Rustaveli Ave 57.',
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget _infoTwo() {
    return const Text(
      'This shop offers both products and services',
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget _titleProducts() {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Row(
        children: const [
          Text(
            'Products',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            ' 41',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
          ),
          Spacer(),
          TextButton(
            onPressed: null,
            child: Text(
              'Show all',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _titleAccessories() {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Row(
        children: const [
          Text(
            'Accessories',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            ' 19',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
          ),
          Spacer(),
          TextButton(
            onPressed: null,
            child: Text(
              'Show all',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _appbar(context) {
    return Row(
      children: [
        const Spacer(),
        Padding(
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
                Icons.search,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        GetX<CartController>(
          builder: (controller) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartPage()));
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: controller.cartItens.isEmpty
                            ? Colors.grey
                            : Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color: controller.cartItens.isEmpty
                          ? Colors.white
                          : Colors.blue),
                  child: Center(
                      child: controller.cartItens.isEmpty
                          ? const Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.grey,
                            )
                          : Text(
                              '${controller.countItens}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            )),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _appbar(context),
              const SizedBox(height: 16),
              _title(),
              const SizedBox(height: 16),
              _infoOne(),
              const SizedBox(height: 4),
              _infoTwo(),
              const SizedBox(height: 16),
              _titleProducts(),
              SizedBox(
                height: 190,
                child: GetX<ShoppingController>(builder: (controller) {
                  return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailsPage(
                                          product: controller.products[index],
                                        )));
                          },
                          child: Container(
                            padding: const EdgeInsets.only(right: 8),
                            width: 180,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                      controller.products[index].productImage!),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  controller.products[index].productName!,
                                  maxLines: 2,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text('\$${controller.products[index].price!}0'),
                              ],
                            ),
                          ),
                        );
                      });
                }),
              ),
              const SizedBox(height: 16),
              _titleAccessories(),
              const SizedBox(height: 8),
              SizedBox(
                height: 210,
                child: GetX<ShoppingController>(builder: (controller) {
                  return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.accessories.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.only(right: 8),
                          width: 180,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 120,
                                width: 200,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    controller.accessories[index].productImage!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                controller.accessories[index].productName!,
                                maxLines: 2,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                  '\$${controller.accessories[index].price!}0'),
                            ],
                          ),
                        );
                      });
                }),
              ),
              const SizedBox(height: 36),
            ],
          ),
        ),
      ),
    );
  }
}
