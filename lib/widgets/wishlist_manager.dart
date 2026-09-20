import 'package:ecommerceapp/models/product.dart';

class WishlistManager {
  static final WishlistManager _instance = WishlistManager._internal();
  factory WishlistManager() => _instance;
  WishlistManager._internal();

  final List<Product> _wishlistItems = [];

  List<Product> get items => _wishlistItems;

  void toggleProduct(Product product) {
    if (_wishlistItems.any((item) => item.id == product.id)) {
      _wishlistItems.removeWhere((item) => item.id == product.id);
    } else {
      _wishlistItems.add(product);
    }
  }

  bool isProductLiked(Product product) {
    return _wishlistItems.any((item) => item.id == product.id);
  }
}
