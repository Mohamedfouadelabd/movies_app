class MyMovie{
static const String Collection='my_movie';

  String? titel;
  String ?id;
  String? images;
String ?dateTime;
String? ratingImages;
String?ratingNum;
  MyMovie({required this.id,required this.images,required this.titel,this.dateTime,
  this.ratingImages,this.ratingNum

  });


MyMovie.fromFireStore(Map<String,dynamic>data){
  id=data['id'];
  titel=data['titel'];
  images=data['images'];
  dateTime=data['dateTime'];
  ratingImages=data['ratingImages'];
  ratingNum=data['ratingNum'];

}


  Map<String,dynamic>toFireStore(){
  return{
    'id':id,
    'titel':titel,
    'images':images,
    'dateTime':dateTime,
    'ratingImages':ratingImages,
  'ratingNum':ratingNum,
  };

}
}