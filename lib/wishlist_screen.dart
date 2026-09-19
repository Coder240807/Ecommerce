import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerceapp/widgets/wishlist_manager.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    final wishlist = WishlistManager().items;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Wishlist',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: wishlist.isEmpty
          ? Center(
              child: Text(
                'Your wishlist is empty',
                style: GoogleFonts.poppins(color: Colors.grey, fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: wishlist.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final product = wishlist[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        product.thumbnail,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      product.title,
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      '₹${product.price.toStringAsFixed(0)}',
                      style: GoogleFonts.poppins(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete_outline_rounded,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        setState(() {
                          WishlistManager().toggleProduct(product);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
