import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/layout/news_app/cubit/cubit.dart';
import 'package:udemy/layout/news_app/cubit/states.dart';
import 'package:udemy/shared/shared_components/components.dart';
class SportsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list= NewsCubit.get(context).sports;
        return ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder:(context, index) => buildArticleItem(list[index], context),
            separatorBuilder: (context, index) => MyDevider() ,
            itemCount:list.length );
      },
    );
  }
}
