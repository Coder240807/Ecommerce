# TrendWave

A clean, minimal e-commerce mobile app built with Flutter. Browse products in a two-column grid, search, view product details, save favourites to a wishlist, and manage a shopping cart.

## Features

- **Home** with a promo banner and a lazily loaded two-column product grid
- **Product details** with image, description, rating, stock status, brand, shipping and warranty info, a quantity selector and an Add to Cart button
- **Cart** with quantity controls, item removal and a running total
- **Wishlist** with a heart toggle on the product screen
- **Search**: tap the top bar to open a search page that filters products live by title, brand or category
- **Profile** screen with a simple menu layout
- **Bottom navigation** (Home, Wishlist, Cart, Profile) with a separate navigator per tab, so the bar stays visible while browsing
- **Custom theme** built from the app icon's navy colour

## Tech stack

|           |                                                                   |
| --------- | ----------------------------------------------------------------- |
| Framework | Flutter (Material 3)                                              |
| Language  | Dart                                                              |
| Packages  | `google_fonts`, `flutter_svg`                                     |
| State     | `setState`, `ChangeNotifier` (cart), singleton manager (wishlist) |
| Data      | Hard-coded product list (no backend)                              |

## Getting started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- An Android emulator, iOS simulator or a connected device

### Run the app

```bash
git clone <your-repo-url>
cd ecommerceapp
flutter pub get
flutter run
```

### Assets

The top bar icons are SVG files. Make sure they are declared in `pubspec.yaml`:

```yaml
flutter:
  assets:
    - assets/icons/
```

Required files: `assets/icons/Cart.svg` and `assets/icons/Notification.svg`.

## Project structure

```
lib/
├── main.dart                  # App entry point and bottom navigation
├── app_theme.dart             # Colours and theme
├── models/
│   ├── product.dart           # Product model
│   └── cart.dart              # Cart state (add, remove, quantity, total)
├── data/
│   └── allproducts.dart       # Product catalogue
├── screens/
│   ├── home_screen.dart
│   ├── product_screen.dart    # Product detail
│   ├── cart_screen.dart
│   ├── search_screen.dart
│   ├── wishlist_screen.dart
│   └── profile_screen.dart
└── widgets/
    ├── topbar.dart            # Search bar, cart and notification icons
    ├── product_card.dart      # Grid card
    ├── banner.dart            # Promo banner
    └── wishlist_manager.dart  # Wishlist state
```

## Adding or editing products

Products live in `allproducts.dart` as a list of `Product` objects:

```dart
Product(
  id: 11,
  title: 'Product name',
  description: 'Short description.',
  category: 'electronics',
  price: 1999,
  discountPercentage: 20,
  rating: 4.5,
  brand: 'Brand',
  warrantyInformation: '1 year warranty',
  shippingInformation: 'Ships in 2-3 business days',
  availabilityStatus: 'In Stock',
  images: ['https://example.com/image1.jpg'],
  thumbnail: 'https://example.com/image1.jpg',
),
```

`availabilityStatus` should be one of `'In Stock'`, `'Low Stock'` or `'Out of Stock'`. The product screen colours its status badge based on this value.

## Theming

All brand colours are defined in `app_theme.dart`:

| Colour        | Hex       | Use                          |
| ------------- | --------- | ---------------------------- |
| Primary navy  | `#112344` | Buttons, selected tab, icons |
| Primary light | `#2A4275` | Secondary accent             |
| Tint          | `#E9EDF5` | Soft backgrounds             |

Change `AppColors.primary` to re-colour the whole app.

## How it works

**Navigation.** Each bottom tab has its own `Navigator`, so opening a product from Home keeps the bottom bar visible. The search page opens on the root navigator so it covers the whole screen.

**Cart.** A single shared `Cart` object extends `ChangeNotifier`. The product screen adds to it and the cart screen listens to it with `ListenableBuilder`, so it updates instantly.

**Search.** The top bar is read-only on most screens and opens `SearchScreen` when tapped. On that page, the same `TopBar` becomes editable and filters `allProducts` as you type.

## Known limitations

- Cart and wishlist are stored in memory and reset when the app closes
- No backend, login or checkout
- Product images are placeholder URLs
- The notification button and profile menu rows are not connected yet

## Roadmap

- [ ] Save cart and wishlist with `shared_preferences`
- [ ] Load products from an API
- [ ] User login and profile editing
- [ ] Checkout and order history
- [ ] Category filters and sorting

## Screenshots

_Add screenshots of the home, product, cart and profile screens here._
