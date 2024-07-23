import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/assets.dart';
import '../../../core/routes/route_generator.dart';
import '../../../core/theme/app_colors.dart';
import '../../auth/bloc/auth_cubit.dart';
import '../../auth/screens/auth_screen.dart';
import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    // Check firebase user is logged in or not
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.pushNamed(
        context,
        RouteGenerator.routeMain,
      );
    } else {
      Navigator.pushReplacementNamed(
        context,
        RouteGenerator.routeAuth,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.primary,
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 150,
              left: -50,
              child: SvgPicture.asset(
                Assets.splashBg,
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.logo,
                    width: 60,
                    height: 60,
                  ),
                  const SpinKitDoubleBounce(
                    color: AppColors.white,
                    size: 50.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // body: Stack(
      //   fit: StackFit.expand,
      //   children: [
      //     Positioned(
      //       top: 0,
      //       left: 0,
      //       right: 0,
      //       bottom: 0,
      //       child: SvgPicture.asset(
      //         Assets.logo,
      //         width: 60,
      //         height: 60,
      //       ),
      //     ),
      // const Positioned(
      //   top: 0,
      //   left: 0,
      //   right: 0,
      //   bottom: 0,
      //   child: SpinKitDoubleBounce(
      //     color: AppColors.white,
      //     size: 50.0,
      //   ),
      // ),
      //   ],
      // ),
    );
  }
}
