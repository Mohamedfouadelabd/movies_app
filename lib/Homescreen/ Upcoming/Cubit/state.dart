import 'package:movies_app/model/Response/UpComingSourceResponse.dart';

abstract class UpcomingState{}
class UpcomingLoadingState extends UpcomingState{}
class UpcomingErrorState extends UpcomingState{
  String errorMassage;
  UpcomingErrorState({required this.errorMassage});
}
class UpcomingSucsesState extends UpcomingState{
  UpComingSourceResponse? response;
  UpcomingSucsesState({required this.response});
}