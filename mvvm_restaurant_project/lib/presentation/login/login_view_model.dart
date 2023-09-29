import 'dart:async';

import 'package:mvvm_restaurant_project/domain/use_case/login_usecase.dart';
import 'package:mvvm_restaurant_project/presentation/base/baseviewmodel.dart';
import 'package:mvvm_restaurant_project/presentation/common/freezed_data_classes.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModellOutputs {
  StreamController _userNameStreamController =
      StreamController<String>.broadcast();

  StreamController _passwordStreamController =
      StreamController<String>.broadcast();

  var loginObject = LoginObject("userName", "password");

  LoginUseCase _loginUseCase;
  LoginViewModel(this._loginUseCase);

  @override
  void dispose() {
    _passwordStreamController.close();
    _userNameStreamController.close();
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  login() async {
    (await _loginUseCase.execute(LoginUseCaseInput(
            email: loginObject.userName, password: loginObject.password)))
        .fold((failure) => {
          //failure login
          print(failure.message)
        }, (data) => {
          //success login

          print(data.customer?.name)

        });
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
  }

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
    loginObject = loginObject.copyWith(userName: userName);
  }

  @override
  Stream<bool> get outputsIsUserNameValid => _userNameStreamController.stream
      .map((userName) => _isUserNameValid(userName));

  @override
  // TODO: implement outputsIsPasswordValid
  Stream<bool> get outputsIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isUserNameValid(String userName) {
    return userName.isNotEmpty;
  }
}

abstract class LoginViewModelInputs {
  //action function
  setUserName(String name) {}
  setUserPassword(String password) {}
  login();

  //let declare our sinks

  Sink get inputUserName;

  Sink get inputPassword;
}

abstract class LoginViewModellOutputs {
  Stream<bool> get outputsIsUserNameValid;
  Stream<bool> get outputsIsPasswordValid;
}
