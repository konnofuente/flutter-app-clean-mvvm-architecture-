
// it enable us to use the input and output Basemodel function
abstract class BaseViewModel extends BaseViewModelInputs with BaseViewModelOutputs {
  //Shared variable and function that will be used through any view model.

}

abstract class BaseViewModelInputs {
  void start(); //will be calle when every screen load

  void dispose(); // will be called when the viewmodel dies
}

abstract class BaseViewModelOutputs {

}
