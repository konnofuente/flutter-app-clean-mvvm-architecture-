import 'package:mvvm_restaurant_project/presentation/base/baseviewmodel.dart';

class OnBoardingViewModel extends BaseViewModel with OnBoardingViewModelInput , OnBoardingViewModelOutput{
 
 //stream controller 
 
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

  void onPageChanged(int index){

  }
}

//output means data or reslt that will be sent from out view model to our view
abstract class OnBoardingViewModelOutput {}
