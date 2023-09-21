// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:mvvm_restaurant_project/presentation/base/baseviewmodel.dart';
import 'package:mvvm_restaurant_project/presentation/onboarding/onboarding.dart';

import '../../domain/models/slider_object.dart';
import '../resources/export_app_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInput, OnBoardingViewModelOutput {
  //stream controller
  final StreamController _streamController =
      StreamController<SliderViewObject>();
  late final List<SliderObject> _list;
  int _currentIndex = 0;

  @override
  void dispose() {
    //
    _streamController.close();
  }

  @override
  void start() {
    //
    _list = _getSliderData();

    // send this slider data to our view

    _postDataToView();
  }

  @override
  void goNext() {
    // TODO: implement goNext
  }

  @override
  void goPrevious() {
    // TODO: implement goPrevious
  }

  @override
  // input
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  // TODO: Output
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  List<SliderObject> _getSliderData() => [
        SliderObject(AppStrings.onBoardingSubTitle1,
            AppStrings.onBoardingSubTitle1, ImageAssets.onboardingLogo1),
        SliderObject(AppStrings.onBoardingSubTitle2,
            AppStrings.onBoardingSubTitle2, ImageAssets.onboardingLogo2),
        SliderObject(AppStrings.onBoardingSubTitle3,
            AppStrings.onBoardingSubTitle3, ImageAssets.onboardingLogo3),
        SliderObject(AppStrings.onBoardingSubTitle4,
            AppStrings.onBoardingSubTitle4, ImageAssets.onboardingLogo4)
      ];

  _postDataToView(){
    inputSliderViewObject.add(SliderViewObject(sliderObject: _list[_currentIndex], numOfSlides: _list.length, currentIndex: _currentIndex))
  }
}

//input mean order that the view model will recieve from our view
abstract class OnBoardingViewModelInput {
  //when the user click the next/righ arrow
  void goNext();

  //when the user click the previous/left arrow
  void goPrevious();

  void onPageChanged(int index) {}

  Sink get inputSliderViewObject;
}

//output means data or reslt that will be sent from out view model to our view
abstract class OnBoardingViewModelOutput {
  Stream<SliderViewObject> get outputSliderViewObject;
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;

  SliderViewObject({
    required this.sliderObject,
    required this.numOfSlides,
    required this.currentIndex,
  });
}
