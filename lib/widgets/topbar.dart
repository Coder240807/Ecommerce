import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecommerceapp/screens/cart_screen.dart';
import 'package:ecommerceapp/screens/search_screen.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final bool hasCartItems;
  final bool isSearchPage;
  final ValueChanged<String>? onSearchChanged;

  const TopBar({
    super.key,
    this.hasCartItems = false,
    this.isSearchPage = false,
    this.onSearchChanged,
  });

  @override
  Size get preferredSize => const Size.fromHeight(78);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 230,
              height: 54,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey.shade500),
              ),
              child: TextField(
                autofocus: isSearchPage,
                readOnly: !isSearchPage,
                onTap: isSearchPage
                    ? null
                    : () => Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                          builder: (context) => const SearchScreen(),
                        ),
                      ),
                onChanged: onSearchChanged,
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: "Search Product",
                  prefixIcon: isSearchPage
                      ? IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () => Navigator.pop(context),
                        )
                      : const Icon(Icons.search),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 13,
                  ),
                ),
              ),
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartScreen()),
                  ),
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    height: 54,
                    width: 54,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset("assets/icons/Cart.svg"),
                  ),
                ),
                if (hasCartItems)
                  Positioned(
                    top: -2,
                    right: -2,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(50),
              child: Container(
                padding: const EdgeInsets.all(12),
                height: 54,
                width: 54,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset("assets/icons/Notification.svg"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
