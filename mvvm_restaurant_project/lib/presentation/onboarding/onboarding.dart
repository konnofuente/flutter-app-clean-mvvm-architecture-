// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvvm_restaurant_project/presentation/onboarding/onboarding_view_model.dart';
import 'package:mvvm_restaurant_project/presentation/resources/color_manager.dart';
import 'package:mvvm_restaurant_project/presentation/resources/route_manager.dart';
import 'package:mvvm_restaurant_project/presentation/resources/style_manager.dart';
import 'package:mvvm_restaurant_project/presentation/resources/value_manager.dart';
import 'package:mvvm_restaurant_project/test.dart';

import '../../domain/models/slider_object.dart';
import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController _pageController = PageController(initialPage: 0);

  OnBoardingViewModel _viewModel = OnBoardingViewModel();

  @override
  _bind() {
    _viewModel.start();
  }
  void initState() {
    _bind();
  }

  @override
  void dispose() {
    _viewModel.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
        stream: _viewModel.outputSliderViewObject,
        builder: (context, snapshot) {
          return _getContentWidget(snapshot.data);
        });
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject) {
    return sliderViewObject == null
        ? Container(
            child: Center(
              child: Text(
                'No slider available for the app to launch',
                style: getBoldStyle(
                  color: ColorManager.error,
                ),
              ),
            ),
          )
        : Scaffold(
            backgroundColor: ColorManager.white,
            appBar: AppBar(
              backgroundColor: ColorManager.white,
              elevation: AppSize.s0,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: ColorManager.white,
                statusBarBrightness: Brightness.dark,
                statusBarIconBrightness: Brightness.dark,
              ),
            ),
            body: PageView.builder(
                controller: _pageController,
                itemCount: sliderViewObject.numOfSlides,
                onPageChanged: (index) {
                  setState(() {
                    _viewModel.onPageChanged(index);
                  });
                },
                itemBuilder: (context, index) {
                  return OnBoardingPage(sliderViewObject.sliderObject);
                }),
            //permit us to add a small bottom layer for the next page
            bottomSheet: Container(
              color: ColorManager.white,
              height: AppSize.s100,
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, Routes.loginRoute);
                        },
                        child: Text(
                          AppStrings.skip,
                          style: Theme.of(context).textTheme.subtitle2,
                          textAlign: TextAlign.end,
                        ),
                      )),
                  // add layout for indicator and arrows
                  _getBottomSheetWidget(sliderViewObject),
                ],
              ),
            ),
          );
  }

  Widget _getBottomSheetWidget(SliderViewObject sliderViewObject) {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                  height: AppSize.s20,
                  width: AppSize.s20,
                  child: SvgPicture.asset(ImageAssets.left_arrow_ic)),
              onTap: () {
                _pageController.animateToPage(_viewModel.goPrevious(),
                    duration: Duration(milliseconds: DurationConstant.d300),
                    curve: Curves.bounceInOut);
                //function to move to previous page
              },
            ),
          ),
          Row(
            children: [
              for (int i = 0; i < sliderViewObject.numOfSlides; i++)
                Padding(
                  padding: EdgeInsets.all(AppPadding.p8),
                  child: _getProperCircle(i , sliderViewObject.currentIndex),
                )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                  height: AppSize.s20,
                  width: AppSize.s20,
                  child: SvgPicture.asset(ImageAssets.right_arrow_ic)),
              onTap: () {
                //function to move to next page
                _pageController.animateToPage(_viewModel.goNext(),
                    duration: Duration(milliseconds: DurationConstant.d300),
                    curve: Curves.bounceInOut);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _getProperCircle(int index , int currentIndex) {
    return SvgPicture.asset(index == currentIndex // -1
        ? ImageAssets.hollow_cirlce_ic
        : ImageAssets.solid_circle_ic);
  }
}

class OnBoardingPage extends StatelessWidget {
  SliderObject _sliderObject;

  OnBoardingPage(this._sliderObject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: AppSize.s40),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        SizedBox(
          height: AppSize.s60,
        ),
        SvgPicture.asset(_sliderObject.image)
        // image widget
      ],
    );
  }
}
