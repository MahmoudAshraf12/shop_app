import 'package:udemy/models/shop_app/login_model.dart';

abstract class ShopLoginStates{}

class ShopLoginInitialStates extends ShopLoginStates{}

class ShopLoginLoadingStates extends ShopLoginStates{}

class ShopLoginSuccessStates extends ShopLoginStates
{
  final ShopLoginModel loginModel;

  ShopLoginSuccessStates(this.loginModel);
}


class ShopLoginFailStates extends ShopLoginStates{
  final String error;

  ShopLoginFailStates(this.error);
}
class ShopChangePasswordVisibilityStates extends ShopLoginStates{}