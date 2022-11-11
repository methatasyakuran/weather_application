import 'package:geolocator/geolocator.dart';

class LocationService{
  late double latitude;
  late double longitude;

  Future<dynamic> getCurrentLocation() async{
    try{
      await Geolocator.requestPermission();
      Position currentPosition = await Geolocator
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      latitude = currentPosition.latitude;
      longitude=currentPosition.longitude;
      print(latitude);
      print(longitude);
    } catch(e){
      print(e);
    }
  }
}