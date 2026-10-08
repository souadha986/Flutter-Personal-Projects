import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:e_commerce_app/core/navigation/app_routes.dart';
import 'package:e_commerce_app/core/styling/app_colors.dart';
import 'package:e_commerce_app/core/styling/app_styles.dart';
import 'package:e_commerce_app/core/utils/snack_bar.dart';

import 'package:e_commerce_app/core/widgets/spacing.dart';
import 'package:e_commerce_app/core/widgets/text_field.dart';
import 'package:e_commerce_app/features/homescreen/cubit/categoriescubit/categories_cubit.dart';
import 'package:e_commerce_app/features/homescreen/cubit/categoriescubit/categories_states.dart';
import 'package:e_commerce_app/features/homescreen/cubit/productcubit/product_cubit.dart';
import 'package:e_commerce_app/features/homescreen/cubit/productcubit/product_states.dart';
import 'package:e_commerce_app/features/homescreen/widgets/category_item.dart';
import 'package:e_commerce_app/features/homescreen/widgets/item_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String cart = "All";
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().fetchproducts();
    context.read<CategoriesCubit>().fetchcategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeightSpace(16),
              Text("Discover", style: AppStyles.black32w600),
              const HeightSpace(16),
              Row(
                children: [
                  Fields(
                    isPassword: false,
                    title: "Search for clothes",
                    width: 281.w,
                  ),
                  const WidthSpace(8),
                  Container(
                    width: 52.w,
                    height: 52.h,
                    decoration: BoxDecoration(
                      color: AppColors.blueColor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Icon(Icons.search, color: Colors.white),
                  ),
                ],
              ),
              const HeightSpace(16),
              BlocConsumer<CategoriesCubit, CategoriesStates>(
                listener: (context, state) {
                  if (state is CategoryErrorState) {
                    ShowSnackBar.showAnimatedSnackDialog(
                      context: context,
                      message: state.error,
                      type: AnimatedSnackBarType.error,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is CategoryLoadedState) {
                    return SizedBox(
                      height: 40.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.categories.length + 1,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return CategoryItem(
                              title: "All",
                              onTap: () {
                                cart = "All";
                                context.read<ProductCubit>().fetchproducts();
                                setState(() {});
                              },
                              isselected: cart == "All" ? true : false,
                            );
                          } else {
                            final category = state.categories[index - 1];
                            return CategoryItem(
                              title: category,
                              isselected: cart == category ? true : false,
                              onTap: () {
                                cart = category;
                                context.read<ProductCubit>().categoryProduct(
                                  category: category,
                                );
                                setState(() {});
                              },
                            );
                          }
                        },
                      ),
                    );
                  }
                  return SizedBox();
                },
              ),
              const HeightSpace(24),

              BlocConsumer<ProductCubit, ProductStates>(
                listener: (context, state) {
                  if (state is ErrorState) {
                    ShowSnackBar.showAnimatedSnackDialog(
                      context: context,
                      message: state.error,
                      type: AnimatedSnackBarType.error,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is LoadingState) {
                    return Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 8.h,
                          crossAxisSpacing: 17.w,
                          crossAxisCount: 2,
                          childAspectRatio: 0.8,
                        ),
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey[350]!,
                            highlightColor: Colors.grey[200]!,
                            child: Container(
                              width: 200.0,
                              height: 50.0,
                              color: Colors.grey[350]!,
                            ),
                          );
                        },
                      ),
                    );
                  }
                  if (state is LoadedState) {
                    if (state.products.isEmpty) {
                      return Center(child: Text("No Results Found"));
                    } else {
                      return Expanded(
                        child: RefreshIndicator(
                          color: AppColors.blueColor,
                          backgroundColor: AppColors.whiteColor,
                          onRefresh: () async {
                            if (cart == "All") {
                              await context
                                  .read<ProductCubit>()
                                  .fetchproducts();
                            } else {
                              await context
                                  .read<ProductCubit>()
                                  .categoryProduct(category: cart);
                            }
                            setState(() {});
                          },
                          child: AnimationLimiter(
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 8.h,
                                    crossAxisSpacing: 17.w,
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.7,
                                  ),
                              itemCount: state.products.length,
                              itemBuilder: (context, index) {
                                return AnimationConfiguration.staggeredList(
                                  position: index,

                                  duration: const Duration(milliseconds: 375),
                                  child: SlideAnimation(
                                    verticalOffset: 50.0,
                                    child: FadeInAnimation(
                                      child: ItemCart(
                                        imageUrl: state.products[index].image,
                                        itemname:
                                            state.products[index].title ??
                                            "No name",
                                        price:
                                            "${state.products[index].price} £",
                                        onTap: () {
                                          context.pushNamed(
                                            AppRoutes.productdetails,
                                            extra: state.products[index],
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    }
                  }
                  return SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
