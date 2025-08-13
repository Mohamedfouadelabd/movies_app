import 'package:movies_app/model/Response/PopularSourceResponse.dart';

abstract class PopularState{}
class PopularLoadingState extends PopularState{}
class PopularErrorState extends PopularState{
  String? errorMassage;
  PopularErrorState({required this.errorMassage});
}
class PopularsSuccessState extends PopularState{
  PopularSourceResponse?response;
  PopularsSuccessState({required this.response});

}
