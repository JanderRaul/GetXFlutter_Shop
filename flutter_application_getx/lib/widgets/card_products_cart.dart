import 'package:flutter/material.dart';
import 'package:flutter_application_getx/controllers/cart_controller.dart';

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
                  Container(
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
                  const SizedBox(width: 16),
                  Text('1'),
                  const SizedBox(width: 16),
                  Container(
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
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
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
