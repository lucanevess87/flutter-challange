import 'package:flutter/material.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/stores/cart_store.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/store/components/cart/components/cart_product.dart';
import 'package:loomi_flutter_boilerplate/src/utils/custom_colors.dart';
import 'package:loomi_flutter_boilerplate/src/utils/fonts.dart';
import 'package:get_it/get_it.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> with SingleTickerProviderStateMixin {
  final CartStore _cartStore = GetIt.I.get<CartStore>();
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [
                CustomColors.brandPurple.withOpacity(0.25),
                CustomColors.lightGrey
              ],
              center: Alignment.center,
              radius: 0.7,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Carrinho",
                  style: Fonts.headline3.copyWith(
                    color: CustomColors.black,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: _cartStore.cartList.length,
                  itemBuilder: (context, index) =>
                      CartProduct(product: _cartStore.cartList[index]),
                ),
              ),
              Container(
                height: 50,
                width: 300,
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        CustomColors.brandPurple),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                  ),
                  child: Text(
                    'Confirmar compra',
                    style:
                        Fonts.headline4.copyWith(fontWeight: FontWeight.w500),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
