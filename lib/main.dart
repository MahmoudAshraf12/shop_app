import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:udemy/layout/news_app/cubit/cubit.dart';
import 'package:udemy/layout/news_app/cubit/states.dart';
import 'package:udemy/layout/news_app/news_layout.dart';
import 'package:udemy/layout/shop_app/cubit/cubit.dart';
import 'package:udemy/modules/home/Home_Screen.dart';
import 'package:udemy/modules/messenger/Messenger_Screen.dart';
import 'package:udemy/modules/shop_app/on_boarding/on_boarding_Screen.dart';
import 'package:udemy/modules/users/Users_Screen.dart';
import 'package:udemy/shared/bloc_observer.dart';
import 'package:udemy/shared/network/local/shared_preferences.dart';
import 'package:udemy/shared/network/remote/dio_helper.dart';
import 'package:udemy/shared/shared_components/constants.dart';
import 'package:udemy/shared/styles/themes.dart';

void main() {
  //var blocObserver = MyBlocObserver();
  DioHelper.init();
   CacheHelper.init();
   token =CacheHelper.getData(key: 'token');
  // bool onBoarding =CacheHelper.getData(key: 'onBoarding');
  // print(onBoarding);
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return MultiBlocProvider(
    providers:
    [
      BlocProvider(
      create: (BuildContext context) => NewsCubit(),
      ),
      BlocProvider(
      create: (BuildContext context) => ShopCubit()..getHomeData()..getcategoriesModel()..getFavorites()..getUserData(),
      ),
    ],
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state){},
        builder: (context, state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.light,
            home: OnBoardingScreen() ,
          );
        },
      ),
    );
  }


}
