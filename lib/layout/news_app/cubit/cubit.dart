import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/layout/news_app/cubit/states.dart';
import 'package:udemy/modules/business/business_screen.dart';
import 'package:udemy/modules/science/science_screen.dart';
import 'package:udemy/modules/settings/settings_screen.dart';
import 'package:udemy/modules/sports/sports_screen.dart';
import 'package:udemy/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int CurrentIndex=0;
  List<BottomNavigationBarItem> BootomItem = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.business_center,
        ),
      label: 'Business',
  ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.sports,
        ),
      label: 'Sports',
  ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.science,
        ),
      label: 'Science',
  ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.settings,
        ),
      label: 'Settings',
  ),
  ];
  void ChangeBottomNavBar(int index){
    CurrentIndex= index;
    if(index==1)
      GetSports();
    if(index==2)
      GetScience();
    emit(NewsBottomNavState());
}
List<Widget> Screens= [
  BusinessScreen(),
  SportsScreen(),
  ScienceScreen(),
  SettingsScreen(),
];
  List<dynamic> business=[];

  void GetBusiness()
  {
    emit(NewsLoadingState());
    DioHelper.getData(
      url:'v2/top-headlines' ,
      query: {
        'country' : 'eg',
        'category' : 'business',
        'apiKey' : '0845913380df45f39fb2ff0d8a7aa9c7',
      },
    ).then((value) {
      //print(value.data['articles'][0]['title']);
      business = value.data['articles'];
      print(business[0]['title']);

      emit(NewsGetBusinessSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessFailState(error.toString()));
    });
  }
  List<dynamic> sports =[];

  void GetSports()
  {
    if(sports.length==0){
      DioHelper.getData(
        url:'v2/top-headlines' ,
        query: {
          'country' : 'eg',
          'category' : 'sports',
          'apiKey' : '0845913380df45f39fb2ff0d8a7aa9c7',
        },
      ).then((value) {
        //print(value.data['articles'][0]['title']);
        sports = value.data['articles'];
        print(sports[0]['title']);

      }).catchError((error){
        print(error.toString());
        emit(NewsGetSportsFailState(error.toString()));
      });
    }
    else
    {
      emit(NewsGetSportsSuccessState());

    }

  }
  List<dynamic> science =[];
  void GetScience()
  {
    if(science.length==0){
      DioHelper.getData(
        url:'v2/top-headlines' ,
        query: {
          'country' : 'eg',
          'category' : 'science',
          'apiKey' : '0845913380df45f39fb2ff0d8a7aa9c7',
        },
      ).then((value) {
        //print(value.data['articles'][0]['title']);
        science = value.data['articles'];
        print(science[0]['title']);

      }).catchError((error){
        print(error.toString());
        emit(NewsGetScienceFailState(error.toString()));
      });
    }else{
      emit(NewsGetScienceSuccessState());
    }
  }
  List<dynamic> search =[];
  void GetSearch( String value)
  {
    DioHelper.getData(
      url:'v2/everything' ,
      query: {
        'q' : '$value',
        'apiKey' : '0845913380df45f39fb2ff0d8a7aa9c7',
      },
    ).then((value) {
      //print(value.data['articles'][0]['title']);
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearcheFailState(error.toString()));
    });
  }
  bool isDark= true;
  void ChangeAppMode()
  {
    isDark= !isDark;
    emit(AppChangeModeState());
  }
}
//0845913380df45f39fb2ff0d8a7aa9c7