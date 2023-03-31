import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
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
  bool isOnlyFree = false;

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
                  onChanged: (value) {},
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
                            value: isOnlyFree,
                            onChanged: (value) {
                              setState(() {
                                isOnlyFree = value;
                              });
                            },
                            activeColor: CustomColors.brandPurple,
                          ),
                          Text("Apenas entrega grátis")
                        ],
                      ),
                      Text(
                        "100 resultados",
                        style: Fonts.headline6.copyWith(
                          color: CustomColors.grey.withOpacity(0.6),
                        ),
                      )
                    ],
                  )),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: _marketplaceStore.storeList.length,
                  itemBuilder: (context, index) => Product(
                    id: _marketplaceStore.storeList[index].id,
                    name: _marketplaceStore.storeList[index].name,
                    image: _marketplaceStore.storeList[index].image,
                    isFree: _marketplaceStore.storeList[index].isFree,
                    price: _marketplaceStore.storeList[index].price,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
