import 'package:flutter/material.dart';
import 'detail_product.dart'; // Pastikan ini sesuai dengan lokasi file

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Wishlist")),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: _productFavorite(context),
      ),
    );
  }

  Widget _productFavorite(BuildContext context) {
    return GridView(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.7,
        ),
        children: [
          _productItem(
              context, 'assets/images/produk1.png', 'Kaos Polos', 'Rp 50.000'),
          _productItem(context, 'assets/images/produk2.png', 'Kemeja Batik',
              'Rp 150.000'),
          _productItem(context, 'assets/images/produk3.png', 'Celana Jeans',
              'Rp 200.000'),
          _productItem(context, 'assets/images/produk4.png', 'Sepatu Sneakers',
              'Rp 300.000'),
          _productItem(
              context, 'assets/images/produk1.png', 'Kaos Polos', 'Rp 50.000'),
          _productItem(context, 'assets/images/produk2.png', 'Kemeja Batik',
              'Rp 150.000'),
          _productItem(context, 'assets/images/produk3.png', 'Celana Jeans',
              'Rp 200.000'),
          _productItem(context, 'assets/images/produk4.png', 'Sepatu Sneakers',
              'Rp 300.000'),
        ]);
  }

  Widget _productItem(
      BuildContext context, String image, String name, String price) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(
              image: image,
              name: name,
              location: "Bandung", // Ganti dengan lokasi yang sesuai
              price: price,
            ),
          ),
        );
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite,
                            color: Color(0xFF802929),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
