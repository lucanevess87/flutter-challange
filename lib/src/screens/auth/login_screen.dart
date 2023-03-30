import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loomi_flutter_boilerplate/src/utils/custom_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
        color: CustomColors.brandPurple,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/vectors/bucket_and_paint.svg"),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Só Tintas",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: CustomColors.white,
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
