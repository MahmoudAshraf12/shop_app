import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/layout/shop_app/cubit/states.dart';
import 'package:udemy/models/shop_app/categories_model.dart';
import 'package:udemy/models/shop_app/favoritesmodel.dart';
import 'package:udemy/models/shop_app/home_model.dart';
import 'package:udemy/models/shop_app/login_model.dart';
import 'package:udemy/modules/settings/settings_screen.dart';
import 'package:udemy/modules/shop_app/categories/categories.dart';
import 'package:udemy/modules/shop_app/favorites/favorites.dart';
import 'package:udemy/modules/shop_app/products/products.dart';
import 'package:udemy/modules/shop_app/settings/setting_screen.dart';
import 'package:udemy/shared/network/remote/dio_helper.dart';
import 'package:udemy/shared/shared_components/constants.dart';

import '../../../models/shop_app/change_favorites_model.dart';
import '../../../shared/network/end_points.dart';
import '../../../shared/shared_components/components.dart';

class ShopCubit extends Cubit<ShopStates>
{
  ShopCubit() : super(ShopInitialState());
  static ShopCubit get(context) => BlocProvider.of(context);

  int CurrentIndex = 0;

  List<Widget> bottomScreens=
  [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    Settingscreen(),
  ];

  void changeBottom(int index)
  {
    CurrentIndex = index ;
    emit(ShopChangeBottomNavState());
  }


  HomeModel ? homeModel;

  Map<int, bool> favorites = {};

  void getHomeData()
  {
    emit(ShopLoadingHomeDataState());
      DioHelper.getData(url: HOME, token: token).then((value){
      homeModel = HomeModel.fromjson(value.data);
      // printFullText(homeModel!.data!.banners.toString());
      // print(homeModel!.status);
      homeModel!.data!.products!.forEach((element)
      {
        favorites.addAll({
        element.id! : element.in_favorites!,
        });
      });
      print(favorites.toString());
      emit(ShopSuccessHomeDataState());
    }).catchError((error){
      print(error.toString());
      emit(ShopFailHomeDataState());
    });
  }

  CategoriesModel ? categoriesModel;
  void getcategoriesModel()
  {
    DioHelper.getData(url: GET_GATEGORIES, token: token).then((value){
      categoriesModel = CategoriesModel.fromjson(value.data);
      emit(ShopSuccessCategoriesState());
    }).catchError((error){
      print(error.toString());
      emit(ShopFailCategoriesState());
    });
  }


  ChangeFavoritesModel ? changeFavoritesModel;
  void changeFavorites(int productId)
  {
    favorites[productId] = !favorites[productId]!;
    emit(ShopChangeFavoritesState());
    DioHelper.postdata(
        url: FAVORITES,
        token: token,
        data:
        {
          'product_id' : productId,
        },
    ).then((value)
    {
      changeFavoritesModel= ChangeFavoritesModel.fromjson(value.data);
      print(value.data);
      if(! changeFavoritesModel!.status!){
        favorites[productId] = !favorites[productId]!;
      }else{
        getFavorites();
      }
      emit(ShopSuccessChangeFavoritesState(changeFavoritesModel!));
    },
    ).catchError((error)
    {
      favorites[productId] = !favorites[productId]!;
      emit(ShopFailChangeFavoritesState());
    },
    );
  }

  FavoritesModel ? favoritesModel;
  void getFavorites()
  {
    emit(ShopLoadingGetFavoritesState());
    DioHelper.getData(url: FAVORITES, token: token).then((value){
      favoritesModel = FavoritesModel.fromJson(value.data);
      printFullText(value.data.toString());
      emit(ShopSuccessGetFavoritesState());
    }).catchError((error){
      print(error.toString());
      emit(ShopFailGetFavoritesState());
    });
  }

  ShopLoginModel ? userModel;
  void getUserData()
   {
    emit(ShopLoadingUserDataState());
    DioHelper.getData(
        url: PROFILE,
        token: token,
    ).then((value){
      userModel = ShopLoginModel.fromjson(value.data);
      print(userModel!.data!.name);
      emit(ShopSuccessUserDataState(userModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShopFailUserDataState());
    });
  }

  void UpdateUserData({
  required String name,
  required String email,
  required String phone,
})
  {
    emit(ShopLoadingUpdateUserState());
    DioHelper.putdata(
      url: UPDATE_PROFILE,
      token: token,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
      },
    ).then((value){
      userModel = ShopLoginModel.fromjson(value.data);
      print(userModel!.data!.name);
      emit(ShopSuccessUpdateUserState(userModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShopFailUpdateUserState());
    });
  }
}