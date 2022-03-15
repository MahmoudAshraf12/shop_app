abstract class NewsStates{}

class NewsInitialState extends NewsStates{}


class NewsBottomNavState extends NewsStates{}


class NewsLoadingState extends NewsStates{}


class NewsGetBusinessSuccessState extends NewsStates{}


class NewsGetBusinessFailState extends NewsStates{
  late final String error;

  NewsGetBusinessFailState(this.error);
}
class NewsGetSportsSuccessState extends NewsStates{}


class NewsGetSportsFailState extends NewsStates{
  late final String error;

  NewsGetSportsFailState(this.error);
}
class NewsGetScienceSuccessState extends NewsStates{}


class NewsGetScienceFailState extends NewsStates{
  late final String error;

  NewsGetScienceFailState(this.error);
}
class NewsGetSearchSuccessState extends NewsStates{}


class NewsGetSearcheFailState extends NewsStates{
  late final String error;

  NewsGetSearcheFailState(this.error);
}
class AppChangeModeState extends NewsStates{}