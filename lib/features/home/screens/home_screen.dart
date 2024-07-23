import 'package:e_commerce_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/constants/assets.dart';
import '../../../core/constants/enums.dart';
import '../bloc/home_cubit.dart';
import '../bloc/home_state.dart';
import '../models/category/category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E), // Dark blue background
      appBar: _buildAppbar(),
      body: SingleChildScrollView(
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
            Column(
              children: [
                Stack(
                  children: [
                    Positioned(
                      child: SvgPicture.asset(
                        Assets.mainImageBg,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Assets.mainImage,
                          ),
                          Align(
                            alignment: const Alignment(-0.7, 0.1),
                            child: Text(
                              '30% Off',
                              style: TextStyle(
                                color: AppColors.light1.withOpacity(0.5),
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state.categoryFetchStatus == DataStatus.loading) {
                      return _buildShimmerLoader();
                    } else if (state.categoryFetchStatus ==
                        DataStatus.success) {
                      return CategorySelector(categories: state.categories!);
                    } else {
                      return const Center(
                          child: Text('Failed to load categories'));
                    }
                  },
                ),
                PopularItems(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 300,
      leading: const Center(
        child: Text(
          'Choose Your Bike',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(Assets.search),
          ),
        )
      ],
    );
  }

  Widget _buildShimmerLoader() {
    return Shimmer.fromColors(
      baseColor: AppColors.primary.withOpacity(0.5),
      highlightColor: AppColors.primary.withOpacity(0.7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(4, (index) => _buildShimmerCategoryIcon()),
      ),
    );
  }

  Widget _buildShimmerCategoryIcon() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(Icons.directions_bike, color: Colors.grey[100]),
    );
  }

  Widget CategorySelector({required List<Category> categories}) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:
            categories.map((category) => CategoryIcon(category.image)).toList(),
      );

  Widget CategoryIcon(String image) => Container(
        width: 50,
        height: 50,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.network(image),
      );

  Widget PopularItems() => ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => buildProductCard(index),
      );

  buildProductCard(int index) {
    return Container(
      // width: 100,
      // height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: AssetImage(Assets.cardBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(child: Text('Item $index')),
    );
  }
}
