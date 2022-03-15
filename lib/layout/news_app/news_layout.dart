import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/layout/news_app/cubit/cubit.dart';
import 'package:udemy/layout/news_app/cubit/states.dart';
import 'package:udemy/modules/search/search_screen.dart';
import 'package:udemy/shared/network/remote/dio_helper.dart';
import 'package:udemy/shared/shared_components/components.dart';

class News_App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..GetBusiness(),
      child: BlocConsumer<NewsCubit, NewsStates>(
       listener: (context, state) {},
          builder: (context, state)
      {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
             title: Text(
              'News App',
           ),
              actions: [
                IconButton(onPressed:()
                {
                  navicateTo(context, SearchScreen());
                },
                  icon: Icon(Icons.search),
                ),
                IconButton(onPressed:(){
                  NewsCubit.get(context).ChangeAppMode();
                },
                  icon: Icon(Icons.brightness_4_outlined),),
              ],
         ),
          body: cubit.Screens[cubit.CurrentIndex],
          bottomNavigationBar: BottomNavigationBar(
             currentIndex: cubit.CurrentIndex,
             onTap: (int index)
             {
                cubit.ChangeBottomNavBar(index);
             },
             items:cubit.BootomItem,
          ),
        );
       },
     ),
    );
  }
}
