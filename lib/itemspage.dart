// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/mitch/cart_page.dart';
import 'package:grocery_app/mitch/groceryItemTile.dart';
import 'package:grocery_app/cartmodel.dart';
import 'package:provider/provider.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Good Morning',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Let\'s order fresh items for you',
                  style: GoogleFonts.notoSerif(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Fresh Items',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Expanded(
                  child: Consumer<CartModel>(builder: ((context, value, child) {
                    return GridView.builder(
                        itemCount: value.shopItems.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 1 / 1.5),
                        itemBuilder: ((context, index) {
                          return GroceryItemTile(
                            itemName: value.shopItems[index][0],
                            itemPrice: value.shopItems[index][1],
                            imagePath: value.shopItems[index][2],
                            color: value.shopItems[index][3],
                            onPressed: () {
                              Provider.of<CartModel>(context, listen: false)
                                  .addItemToCart(index);
                            },
                          );
                        }));
                  })),
                ),
              ],
            ),
          ),
          Positioned(
            right: 12,
            bottom: 70,
            child: FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: () {
                Get.to(() => const CartPage());
              },
              child: const Icon(Icons.shopping_cart_rounded),
            ),
          ),
        ],
      ),
    );
  }
}
