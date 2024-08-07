import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_bloc/cubit/app_cubit.dart';
import 'package:travel_app_bloc/cubit/app_cubit_states.dart';
import 'package:travel_app_bloc/misc/colors.dart';
import 'package:travel_app_bloc/services/data_services.dart';
import 'package:travel_app_bloc/widgets/app_buttons.dart';
import 'package:travel_app_bloc/widgets/app_large_text.dart';
import 'package:travel_app_bloc/widgets/app_text.dart';
import 'package:travel_app_bloc/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedIndex = -1;
  int gottenStars = 3;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      DetailState detail = state as DetailState;
      return SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Scaffold(
          body: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'http://mark.bslmeiyu.com/uploads/${detail.place.img}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                //RowPostioned
                left: 20,
                top: 70,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<AppCubits>(context).goHome();
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 235,
                right: 0,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  width: MediaQuery.of(context).size.height,
                  height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            AppLargeText(
                                text: detail.place.name, color: Colors.black54),
                            const Spacer(),
                            AppLargeText(
                                text: '\$ ${detail.place.price.toString()}',
                                color: AppColors.mainColor),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Icon(Icons.location_on,
                              color: AppColors.textColor1),
                          AppText(
                            text: detail.place.location,
                            color: AppColors.textColor1,
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(
                                5,
                                (index) => Icon(
                                      Icons.star,
                                      color: index < detail.place.stars
                                          ? AppColors.starColor
                                          : AppColors.textColor2,
                                    )),
                          ),
                          const AppText(text: ('(5.0)'))
                        ],
                      ),
                      const SizedBox(height: 15),
                      AppLargeText(
                        text: 'People',
                        color: Colors.black.withOpacity(0.8),
                      ),
                      const SizedBox(height: 5),
                      const AppText(
                        text: 'Number of people in your group',
                        color: AppColors.mainTextColor,
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        children: List.generate(5, (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: AppButtons(
                                color: selectedIndex == index
                                    ? Colors.white
                                    : Colors.black,
                                backgroundColor: selectedIndex == index
                                    ? Colors.black
                                    : AppColors.buttonBackground,
                                size: 50,
                                borderColor: selectedIndex == index
                                    ? Colors.black
                                    : AppColors.buttonBackground,
                                isIcon: false,
                                text: (index + 1).toString(),
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 10),
                      const AppLargeText(text: 'Description'),
                      const SizedBox(height: 5),
                      AppText(
                        text: detail.place.description,
                        color: AppColors.mainTextColor,
                      ),
                      const Expanded(
                        child: Row(
                          children: [
                            AppButtons(
                              color: AppColors.textColor2,
                              backgroundColor: Colors.white,
                              size: 60,
                              borderColor: AppColors.textColor2,
                              icon: Icons.favorite_border_outlined,
                              isIcon: true,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: ResponsiveButton(
                                isResposive: true,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
