import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/stores/marketplace_store.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/store/components/home/productsView/product.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/widgets/search_bar_component.dart';
import 'package:loomi_flutter_boilerplate/src/utils/custom_colors.dart';
import 'package:loomi_flutter_boilerplate/src/utils/fonts.dart';

class HomeStore extends StatefulWidget {
  const HomeStore({super.key});

  @override
  State<HomeStore> createState() => _HomeStoreState();
}

class _HomeStoreState extends State<HomeStore> {
  final MarketPlaceStore _marketplaceStore = GetIt.I.get<MarketPlaceStore>();

  @override
  void didChangeDependencies() async {
    _marketplaceStore.getMarketplaceProducts();
    super.didChangeDependencies();
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        bool isTop = _scrollController.position.pixels == 0;
        if (!isTop) {
          _marketplaceStore.loadMoreProducts();
        }
      }
    });

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Observer(builder: (context) {
        return SafeArea(
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
                    "Opções de tintas",
                    style: Fonts.headline3.copyWith(
                      color: CustomColors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
                  child: SearchBarComponent(
                    hintText: "Buscar...",
                    onChanged: (value) {
                      _marketplaceStore.setSearch(value);
                    },
                    enabled: true,
                    verticalPadding: 4,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Switch(
                              value: _marketplaceStore.isDeliveryFree,
                              onChanged: (value) {
                                _marketplaceStore.filterByDeliveryStatus(value);
                              },
                              activeColor: CustomColors.brandPurple,
                            ),
                            Text("Apenas entrega grátis")
                          ],
                        ),
                        Text(
                          "${_marketplaceStore.productList.length.toString()} resultados",
                          style: Fonts.headline6.copyWith(
                            color: CustomColors.grey.withOpacity(0.6),
                          ),
                        )
                      ],
                    )),
                _marketplaceStore.loading == true
                    ? SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          backgroundColor: CustomColors.brandPurple,
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          controller: _scrollController,
                          scrollDirection: Axis.vertical,
                          itemCount: _marketplaceStore.productList.length,
                          itemBuilder: (context, index) {
                            return Product(
                              id: _marketplaceStore.productList[index].id,
                              name: _marketplaceStore.productList[index].name,
                              coverImage: _marketplaceStore
                                  .productList[index].coverImage,
                              deliveryFree: _marketplaceStore
                                  .productList[index].deliveryFree,
                              price: _marketplaceStore.productList[index].price,
                              description: _marketplaceStore
                                  .productList[index].description,
                            );
                          },
                        ),
                      ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
