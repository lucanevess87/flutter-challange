import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/stores/marketplace_store.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/store/components/bottom_navbar.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/store/components/home/home_store.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/store/components/home/productsView/product_detail.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/store/components/profile/profile.dart';

import 'components/cart/cart.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  static const routeName = "store_screen";

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  final MarketPlaceStore _marketplaceStore = GetIt.I.get<MarketPlaceStore>();
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          bottomNavigationBar: BottomNavbar(pageController: _pageController),
          body: PageView(
            controller: _pageController,
            children: [
              _marketplaceStore.defaultView
                  ? const HomeStore()
                  : ProductDetail(id: _marketplaceStore.selectedProductId),
              const Cart(),
              const Profile(),
            ],
          ),
        );
      },
    );
  }
}
