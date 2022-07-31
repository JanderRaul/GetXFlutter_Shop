import 'package:flutter/material.dart';
import 'package:flutter_application_getx/controllers/cart_controller.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class CardProductCart extends StatelessWidget {
  const CardProductCart({
    Key? key,
    required this.cartController,
    required this.controller,
    required this.index,
  }) : super(key: key);

  final CartController cartController;
  final CartController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Row(
        children: [
          SizedBox(
            height: 120,
            width: 120,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  controller.cartItens[index].productImage!,
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(width: 16),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                controller.cartItens[index].productName!,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              const SizedBox(height: 8),
              Text(
                '\$${controller.cartItens[index].price!}',
                style:
                    const TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (controller.cartItens[index].quant.value > 1) {
                        controller.cartItens[index].quant.value--;
                      }
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.remove,
                          size: 12,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Obx(
                    () => Text('${controller.cartItens[index].quant.value}'),
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {
                      controller.cartItens[index].quant.value++;
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          size: 12,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      controller.cartItens[index].quant.value = 1;
                      cartController.removeCart(controller.cartItens[index]);
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color.fromARGB(255, 224, 224, 224),
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.delete_outline,
                          size: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
        ],
      ),
    );
  }
}
