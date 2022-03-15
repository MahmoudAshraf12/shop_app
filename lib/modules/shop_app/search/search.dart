import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/modules/shop_app/search/cubit/cubit.dart';
import 'package:udemy/modules/shop_app/search/cubit/states.dart';

import '../../../shared/shared_components/components.dart';

class SearchScreen extends StatelessWidget {
  var formKey= GlobalKey<FormState>();
  var searchController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state)
        {
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children:
                  [
                    TextFormField(
                      onFieldSubmitted: (String text)
                      {
                        SearchCubit.get(context).search(text);
                      },
                      controller:searchController ,
                      keyboardType: TextInputType.text ,
                      validator: (String ? value)
                      {
                        if(value!.isEmpty){
                          return ' enter text to search';
                        }
                      } ,
                      decoration:InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        labelText: 'Search',
                        border: OutlineInputBorder(),
                      ) ,
                    ),
                    SizedBox(height: 10.0,),
                    if(state is SearchLoadingStates)
                    LinearProgressIndicator(),
                    SizedBox(height: 15.0,),
                    if(state is SearchSuccessStates)
                    Expanded(
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) => buildListProduct(SearchCubit.get(context).model!.data!.data![index], context, isOldPrice: false),
                        separatorBuilder: (context, index) => MyDevider(),
                        itemCount: SearchCubit.get(context).model!.data!.data!.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
