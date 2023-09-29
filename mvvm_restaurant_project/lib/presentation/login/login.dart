// ignore_for_file: prefer_final_fields

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvvm_restaurant_project/presentation/login/login_view_model.dart';
import 'package:mvvm_restaurant_project/presentation/resources/export_app_manager.dart';
import 'package:mvvm_restaurant_project/presentation/widget/custom_sizebox.dart';
import 'package:mvvm_restaurant_project/presentation/widget/custom_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  //TODO to pass the use case
  LoginViewModel _viewModel = LoginViewModel(null);
  StreamController _isAllInputValideStreamController =
      StreamController<void>.broadcast();

  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _bind() {
    _viewModel.start();
    _userNameController.addListener(() {
      _viewModel.setUserName(_userNameController.text);
    });

    _passwordController.addListener(() {
      _viewModel.setPassword(_passwordController.text);
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Login screen')),
    );
  }

  Widget _getContentWidget() {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(top: AppPadding.p100),
      color: ColorManager.white,
      child: SingleChildScrollView(
          child: Form(
        key: _formKey,
        child: Column(
          children: [
            SvgPicture.asset(ImageAssets.loginIc),
            SizedBox(
              height: AppSize.s28,
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: AppPadding.p28, right: AppPadding.p28),
              child: StreamBuilder<bool>(
                  stream: _viewModel.outputsIsUserNameValid,
                  builder: (context, snapshot) {
                    return TextFormField(
                      controller: _userNameController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: AppStrings.userName,
                        labelText: AppStrings.userName,
                        errorText: (snapshot.data ?? true)
                            ? null
                            : AppStrings.ErrorUserName,
                      ),
                    );
                  }),
            ),

            //using custome Widget
            CustomeSizeBox.sizedBoxH28(),
            CustomTextFields.textFieldXL(
                stream: _viewModel.outputsIsUserNameValid,
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                errorText: AppStrings.ErrorPassword,
                hintText: AppStrings.password,
                labelText: AppStrings.password),

            CustomeSizeBox.sizedBoxH28(),
            Padding(
              padding:
                  EdgeInsets.only(left: AppPadding.p28, right: AppPadding.p28),
              child: StreamBuilder<bool>(
                stream: _viewModel.outputsIsAllInputsValid,
                builder: (context, snapshot) {
                  return ElevatedButton(
                      onPressed: (snapshot.data ?? false)
                          ? null
                          : () {
                              _viewModel.login(); 
                            },
                      child: Text(AppStrings.login));
                },
              ),
            ),
          ],
        ),
      )),
    ));
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
