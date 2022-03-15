import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/models/shop_app/favoritesmodel.dart';

import '../../../layout/shop_app/cubit/cubit.dart';
import '../../../layout/shop_app/cubit/states.dart';
import '../../../shared/shared_components/components.dart';

class FavoritesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        return ConditionalBuilder(
          condition: state is! ShopLoadingGetFavoritesState,
          builder: (context) =>  ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildListProduct(ShopCubit.get(context).favoritesModel!.data!.data![index].product!, context),
            separatorBuilder: (context, index) => MyDevider(),
            itemCount: ShopCubit.get(context).favoritesModel!.data!.data!.length,
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  //Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         children:
//         [
//           TextFormField(
//             controller:nameController ,
//             keyboardType: TextInputType.text ,
//             validator: (String ? value)
//             {
//               if(value!.isEmpty){
//                 return 'name must not be empty';
//               }
//             } ,
//             decoration:InputDecoration(
//               prefixIcon: Icon(Icons.person),
//               labelText: 'Name',
//               border: OutlineInputBorder(),
//             ) ,
//           ),
//         ],
//       ),
//     );
}
