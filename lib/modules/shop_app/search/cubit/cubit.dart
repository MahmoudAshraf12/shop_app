import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/models/shop_app/search_model.dart';
import 'package:udemy/modules/shop_app/search/cubit/states.dart';
import 'package:udemy/shared/network/end_points.dart';
import 'package:udemy/shared/network/remote/dio_helper.dart';
import 'package:udemy/shared/shared_components/constants.dart';

class SearchCubit extends Cubit<SearchStates>
{
  SearchCubit() : super(SearchInitialStates());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel ? model;
  void search(String text)
  {
    emit(SearchLoadingStates());
    DioHelper.postdata(
      url: SEARCH,
      token: token,
      data: {
      'text' : text
      },
    ).then((value) {
      model= SearchModel.fromJson(value.data);
      emit(SearchSuccessStates());
    },
    ).catchError((error)
    {
      print(error.toString());
      emit(SearchFailStates());
    },
    );
  }
}