import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loomi_flutter_boilerplate/src/utils/custom_colors.dart';
import 'package:loomi_flutter_boilerplate/src/utils/fonts.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  static const routeName = "store_screen";

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: 0,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Loja"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_basket), label: "Carrinho"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Perfil"),
            ],
          ),
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [CustomColors.darkPurple, CustomColors.lightGrey],
                      center: Alignment.center,
                      radius: 0.7,
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Opções de tintas",
                          style: Fonts.headline3.copyWith(
                            color: CustomColors.black,
                          ),
                        ),
                      ),
                      Padding(padding: const EdgeInsets.symmetric(vertical: 10))
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
