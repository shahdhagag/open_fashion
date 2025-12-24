import 'package:go_router/go_router.dart';
import 'package:open_fashion/models/product_model.dart';
import 'package:open_fashion/screens/add_address.dart';
import 'package:open_fashion/screens/add_card.dart';
import 'package:open_fashion/screens/checkout.dart';
import 'package:open_fashion/screens/home_screen.dart';
import 'package:open_fashion/screens/place_order.dart';

import '../models/address_model.dart';

class AppRoutes {
  static const homeScreen = "/home";
  static const checkoutScreen = "/checkout";
  static const placeOrderScreen = "/place-order";
  static const addAddressScreen = "/addAddress";
  static const addCardScreen = "/addCard";

  static final GoRouter router = GoRouter(
    initialLocation: homeScreen,
    routes: [
      // Home
      GoRoute(
        path: homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),

      // Checkout
      GoRoute(
        path: checkoutScreen,
        builder: (context, state) {
          final product = state.extra as ProductModel;
          return CheckOut(product: product);
        },
      ),

      // Place Order
      GoRoute(
        path: placeOrderScreen,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;

          return PlaceOrder(
            image: data['image']!,
            name: data['name']!,
            descrp: data['descrp']!,
            qty: data['qty']!,
            price: data['price']!,
            total: data['total']!,
            address: data['address'] as AddressModel?,
          );
        },
      ),

      GoRoute(
        path: addAddressScreen,
        builder: (context, state) => const AddAddress(),
      ),
      GoRoute(
        path: addCardScreen,
        builder: (context, state) => const AddCard(),
      ),

    ],
  );
}

