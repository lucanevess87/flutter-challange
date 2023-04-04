import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:loomi_flutter_boilerplate/src/external/models/cart_product_model.dart';
import 'package:loomi_flutter_boilerplate/src/external/models/product_model.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/stores/cart_store.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/store/components/cart/remove_product_dialog.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/store/store_screen.dart';
import 'package:loomi_flutter_boilerplate/src/utils/custom_colors.dart';
import 'package:loomi_flutter_boilerplate/src/utils/fonts.dart';
import 'package:get_it/get_it.dart';

class CartProduct extends StatelessWidget {
  const CartProduct({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final CartStore _cartStore = GetIt.I.get<CartStore>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: InkWell(
        onTap: () {
          showDeleteDialogHelper(
            onTap: () => {
              _cartStore.removeProduct(product.id),
              Navigator.pushNamed(context, StoreScreen.routeName),
            },
            context: context,
            confirmButtonText: "Deletar",
            title: "Deseja deletar item do carrinho?",
            body:
                "E aqui o contéudo todo e aqui o contéudo todo e aqui o contéudo todo e aqui o contéudo todo e aqui o contéudo todo",
          );
        },
        child: Container(
          width: 200,
          height: 90,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: CustomColors.white.withOpacity(0.7),
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: CustomColors.grey.withOpacity(0.4)),
          ),
          child: Row(children: [
            Image.network(product.coverImage),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      width: 300,
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: CustomColors.grey.withOpacity(0.5)),
                        ),
                      ),
                      child: Text(
                        product.name,
                        style: Fonts.headline5.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        product.deliveryFree
                            ? Container(
                                width: 100,
                                height: 22,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: CustomColors.darkPurple,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Text("Entrega grátis",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: CustomColors.black)),
                              )
                            : Container(),
                        Text(
                          product.price,
                          style: Fonts.headline5
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
