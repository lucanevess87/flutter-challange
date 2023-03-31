import 'package:flutter/material.dart';
import 'package:loomi_flutter_boilerplate/src/utils/custom_colors.dart';
import 'package:loomi_flutter_boilerplate/src/utils/fonts.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
                  "Perfil",
                  style: Fonts.headline3.copyWith(
                    color: CustomColors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0, top: 10.0),
                child: Container(
                  width: 350,
                  height: 150,
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: CustomColors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: CustomColors.grey.withOpacity(0.4),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(80.0),
                        child: Image.network("https://bit.ly/dan-abramov"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text("Eduardo Almeida",
                            style: Fonts.headline5.copyWith(
                              fontWeight: FontWeight.w700,
                            )),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 350,
                  height: 50,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: CustomColors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: CustomColors.grey.withOpacity(0.4),
                    ),
                  ),
                  child: Text(
                    "Fazer logout",
                    style: Fonts.headline5.copyWith(
                        fontWeight: FontWeight.w600,
                        color: CustomColors.brandPurple),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
