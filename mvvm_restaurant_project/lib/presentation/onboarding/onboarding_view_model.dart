// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:mvvm_restaurant_project/presentation/base/baseviewmodel.dart';
import 'package:mvvm_restaurant_project/presentation/onboarding/onboarding.dart';

import '../../domain/models/slider_object.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInput, OnBoardingViewModelOutput {
  //stream controller
  final StreamController _streamController =
      StreamController<SliderViewObject>();

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  void goNext() {
    // TODO: implement goNext
  }

  @override
  void goPrevious() {
    // TODO: implement goPrevious
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
