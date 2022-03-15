import 'package:udemy/models/shop_app/login_model.dart';

abstract class ShopRegisterStates{}

class ShopRegisterInitialStates extends ShopRegisterStates{}

class ShopRegisterLoadingStates extends ShopRegisterStates{}

class ShopRegisterSuccessStates extends ShopRegisterStates
{
  final ShopLoginModel loginModel;

  ShopRegisterSuccessStates(this.loginModel);
}
class ShopRegisterChangePasswordVisibilityStates extends ShopRegisterStates{}

class ShopRegisterFailStates extends ShopRegisterStates{
  final String error;

  ShopRegisterFailStates(this.error);
}