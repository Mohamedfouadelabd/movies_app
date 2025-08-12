import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/Firebase/my_movie.dart';

class FireBaseUtils {





static  CollectionReference<MyMovie> getMovieCollection() {
    return FirebaseFirestore.instance
        .collection(MyMovie.Collection)
        .withConverter<MyMovie>(
      fromFirestore: (snapshot, options) =>
          MyMovie.fromFireStore(snapshot.data() ?? {}),
      toFirestore: (myMovie, options) => myMovie.toFireStore(),
    );
  }

  static Future<void> addMovie(MyMovie myMovie){

    var movieCollection=getMovieCollection();
var docRef=movieCollection.doc(myMovie.id);
  return docRef.set(myMovie);

  }

 static Future<void> deleteMovie(MyMovie myMovie){
  var movieCollection=getMovieCollection();
   return movieCollection.doc(myMovie.id).delete();
}

}
