import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/bi.dart';

class ProductDetailPage extends StatelessWidget {
  final String image;
  final String name;
  final String location;
  final String price;

  const ProductDetailPage({
    super.key,
    required this.image,
    required this.name,
    required this.location,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
        backgroundColor: const Color(0xFFF9DBDB),
      ),
      body: ListView(
        children: [
          Image.asset(
            image,
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSellerInfo(),
                const Divider(),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 8),
                _buildDescription(),
                const SizedBox(height: 12),
                const Text(
                  'Ukuran',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 8),
                _buildSizeOptions(),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // _buildActionButton(
                    // Icons.remove_red_eye, 'Coba Produk', Color(0xFF802929)),
                    _buildActionButton(
                        Iconify(
                          Ic.baseline_remove_red_eye,
                          color: Colors.white,
                        ),
                        'Coba Produk',
                        const Color(0xFF802929)),

                    _buildActionButton(
                        Iconify(
                          Bi.coin,
                          color: Color(0xFF802929),
                        ),
                        'Beli Produk',
                        const Color(0xFFFF9E02)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(Widget icon, String text, Color color) {
    return ElevatedButton.icon(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        minimumSize: const Size(150, 50),
      ),
      icon: icon,
      label: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w900,
          fontFamily: 'Poppins',
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildSellerInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: const [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.jpeg'),
              radius: 24,
            ),
            SizedBox(width: 8),
            Text(
              'Bubu Baba',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color.fromARGB(255, 102, 31, 25).withOpacity(0.5),
          ),
          child: IconButton(
            iconSize: 24,
            icon: const Icon(Icons.favorite, color: Colors.white),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return RichText(
      text: TextSpan(
        text:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ',
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black,
          fontFamily: 'Poppins',
        ),
        children: [
          TextSpan(
            text: ' Baca selengkapnya',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSizeOptions() {
    List<String> sizes = ['S', 'M', 'L', 'XL'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: sizes.map((size) {
        return _buildSizeButton(size);
      }).toList(),
    );
  }

  Widget _buildSizeButton(String size) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: size == 'S' ? const Color(0xFF802929) : Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        size,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins',
          color: Colors.white,
        ),
      ),
    );
  }
}
