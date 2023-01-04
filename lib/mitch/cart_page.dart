import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/cartmodel.dart';
import 'package:grocery_app/mitch/paymentPage.dart';
import 'package:provider/provider.dart';
import 'package:slide_to_act/slide_to_act.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          'My Cart..',
          style: GoogleFonts.bebasNeue(fontSize: 55, color: Colors.black),
        ),
        backgroundColor: Colors.grey.shade200,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Consumer<CartModel>(builder: ((context, value, child) {
        return Column(
          children: [
            const SizedBox(height: 30),
            value.cartItems.length <= 0
                ? const Center(
                    child: Text(
                      'No Items Added!',
                      style: TextStyle(fontSize: 30),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: value.cartItems.length,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 15, right: 25, left: 25),
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    value.cartItems[index][2],
                                    height: 35,
                                  ),
                                  const SizedBox(width: 25),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        value.cartItems[index][0],
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        '\$${value.cartItems[index][1]}',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  IconButton(
                                      onPressed: () {
                                        value.removeItemToCart(index);
                                      },
                                      icon: const Icon(
                                          Icons.remove_circle_rounded))
                                ],
                              ),
                            ),
                          );
                        })),
                  ),
            value.cartItems.length <= 0
                ? const Text('')
                : Padding(
                    padding: const EdgeInsets.all(25),
                    child: Container(
                      padding: const EdgeInsets.only(
                          right: 20, left: 20, top: 20, bottom: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.green,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Price',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey.shade100,
                                ),
                              ),
                              Text(
                                '\$${value.calculateTotal()}',
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          SlideAction(
                            height: 60,
                            sliderButtonIconSize: 15,
                            borderRadius: 12,
                            elevation: 0,
                            sliderButtonIconPadding: 10,
                            outerColor: Colors.green[600],
                            innerColor: Colors.green[800],
                            sliderButtonIcon: const Icon(
                              Icons.attach_money_rounded,
                              size: 24,
                              color: Colors.white,
                            ),
                            text: 'Slide to Pay',
                            textStyle: const TextStyle(
                                color: Colors.white, fontSize: 18),
                            onSubmit: () {
                              Get.to(() => const PaymentPage());
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        );
      })),
    );
  }
}
