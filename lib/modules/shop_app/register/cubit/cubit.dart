import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/models/shop_app/login_model.dart';
import 'package:udemy/modules/shop_app/register/cubit/states.dart';
import 'package:udemy/modules/shop_app/shop_login_screen/cubit/states.dart';
import 'package:udemy/shared/network/end_points.dart';
import 'package:udemy/shared/network/remote/dio_helper.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterStates>{
  ShopRegisterCubit() : super(ShopRegisterInitialStates());
  static ShopRegisterCubit get(context) => BlocProvider.of(context);
     ShopLoginModel  ? loginmodel;

  void userRegister({
  required String email,
  required String password,
  required String name,
  required String phone,
})
  {
    emit(ShopRegisterLoadingStates());
    DioHelper.postdata(
      url: REGISTER,
      data:
      {
        'email':email,
        'password': password,
        'name': name,
        'phone': phone,
      }
      ,).then((value)
    {
      print(value.data);
      loginmodel = ShopLoginModel.fromjson(value.data);
      emit(ShopRegisterSuccessStates(loginmodel!));
    }).catchError((error)
    {
      print(error.toString());
     emit(ShopRegisterFailStates(error.toString()));
    }
    );
  }
  bool IsObsecure = true;
  IconData suffix = Icons.visibility_outlined;

  void ChangePasswordVisibility()
  {
    IsObsecure = !IsObsecure ;
    suffix = IsObsecure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ShopRegisterChangePasswordVisibilityStates());
  }
}