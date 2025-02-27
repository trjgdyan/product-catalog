import 'package:flutter/material.dart';
// import 'package:flutter_application_1/product_favorite.dart';
// import 'package:flutter_application_1/account.dart';
import 'package:flutter_application_1/detail_product.dart';
// import 'package:flutter_application_1/navbar.dart';

import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/zondicons.dart';
import 'package:iconify_flutter/icons/icon_park_outline.dart';
import 'package:iconify_flutter/icons/game_icons.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Search Bar
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Cari',
                        hintStyle: const TextStyle(
                          color: Color(0xFF802929),
                          fontFamily: 'Poppins',
                          fontStyle: FontStyle.italic,
                          fontSize: 18,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFF802929)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.search,
                          size: 35, color: Color(0xFF802929)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Try-on Feature
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFF9DBDB),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Fitur Try-on',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Poppins',
                              color: Color(0xFF802929),
                            ),
                          ),
                          const Text(
                            'Batik Gedog Khas Kota Tuban',
                            style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'Poppins',
                              color: Color(0xFF802929),
                            ),
                          ),
                          Card(
                            color: const Color(0xFF802929),
                            child: const Padding(
                              padding: EdgeInsets.all(8),
                              child: Text('Coba Sekarang!',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      'assets/images/model1.png',
                      width: 135,
                      height: 135,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),

              // Kategori
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Kategori',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Lihat Semua',
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Kategori Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCategoryButton(Zondicons.apparel, "Kemeja"),
                  _buildCategoryButton(IconParkOutline.clothes_pants, "Celana"),
                  _buildCategoryButton(GameIcons.life_jacket, "Jaket"),
                  _buildCategoryButton(GameIcons.ample_dress, "Gaun"),
                ],
              ),
              const SizedBox(height: 0),

              // Grid Produk
              _buildProductGrid(),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Navbar(
      //   selectedIndex: currentPageIndex,
      //   onItemTapped: (index) {
      //     setState(() {
      //       currentPageIndex = index;
      //     });

      //     if (index == 1) {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => const FavoritePage()),
      //       );
      //     } else if (index == 2) {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => const AccountPage()),
      //       );
      //     }
      //   },
      // ),
    );
  }

  // Grid Produk
  Widget _buildProductGrid() {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      children: [
        _buildProductItem('assets/images/produk1.png', 'Outer Batik Cokelat',
            'Tuban', 'Rp280.000'),
        _buildProductItem('assets/images/produk2.png', 'Batik Gedog Biru',
            'Tuban', 'Rp350.000'),
        _buildProductItem('assets/images/produk3.png', 'Kemeja Batik Merah',
            'Solo', 'Rp320.000'),
        _buildProductItem('assets/images/produk4.png', 'Batik Klasik Hitam',
            'Jogja', 'Rp400.000'),
      ],
    );
  }

  // Item Produk
  Widget _buildProductItem(
      String image, String name, String location, String price) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(
              image: image,
              name: name,
              location: location,
              price: price,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFFD6D6D6),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                width: double.infinity,
                height: 130,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(location),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF13AA45),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Kategori Button
  Widget _buildCategoryButton(String iconName, String label) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Iconify(iconName, color: Colors.white),
          style: IconButton.styleFrom(
            backgroundColor: const Color(0xFF802929),
          ),
        ),
        Text(label,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
