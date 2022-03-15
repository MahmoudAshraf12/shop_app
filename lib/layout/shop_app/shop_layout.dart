import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/layout/shop_app/cubit/cubit.dart';
import 'package:udemy/layout/shop_app/cubit/states.dart';
import 'package:udemy/modules/shop_app/search/search.dart';
import 'package:udemy/modules/shop_app/shop_login_screen/shop_login_screen.dart';
import 'package:udemy/shared/shared_components/components.dart';

class ShopLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var cubit = ShopCubit.get(context);
       return Scaffold(
          appBar: AppBar(
            title: Text(
                'Salla'
            ),
            actions:
            [
             IconButton(
                 onPressed: ()
                 {
                   navicateTo(context, SearchScreen());
                 },
                 icon: Icon(Icons.search),
             ),
            ],
          ),
          body: cubit.bottomScreens[cubit.CurrentIndex],
          bottomNavigationBar: BottomNavigationBar(
           onTap: (index)
           {
             cubit.changeBottom(index);
           },
            currentIndex: cubit.CurrentIndex,
            items:
          [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.apps,
              ),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: 'Settings',
            ),
          ],
          ),
        );
      },
    );
  }
}
