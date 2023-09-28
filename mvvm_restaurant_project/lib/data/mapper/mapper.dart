

import 'package:mvvm_restaurant_project/app/extension.dart';

import '../../domain/models/Authentication.dart';
import '../../domain/models/contact.dart';
import '../../domain/models/customer.dart';
import '../../presentation/resources/export_app_manager.dart';
import '../responses/responses.dart';



extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
        id:this?.id?.orEmpty() ?? Constant.EMPTY,
        name:this?.name?.orEmpty() ?? Constant.EMPTY,
       numOfNotifications: this?.numOfNotifications?.orZero() ?? Constant.ZERO);
  }
}

extension ContactsResponseMapper on ContactsResponse? {
  Contacts toDomain() {
    return Contacts(email :this?.email?.orEmpty() ?? Constant.EMPTY,
        phone : this?.phone?.orEmpty() ?? Constant.EMPTY,link: this?.link?.orEmpty() ?? Constant.EMPTY,);
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
        customer : this!.customer!.toDomain(), contact : this!.contacts!.toDomain());
  }
}
