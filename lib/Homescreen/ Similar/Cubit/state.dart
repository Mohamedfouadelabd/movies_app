import 'package:movies_app/model/Response/SimilarSourceResponse.dart';

abstract class SimilarState{}
class SimilarLoadingState extends SimilarState{}
class SimilarErrorState extends SimilarState{
  String ?errorMassage;
  SimilarErrorState({required this.errorMassage});
}
class SimilarSucssesState extends SimilarState{
  SimilarSourceResponse ?response;
  SimilarSucssesState({required this.response});
}