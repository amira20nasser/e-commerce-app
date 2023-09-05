import 'package:ecommerce/dataprovider/remote/firebasehelper.dart';

class UserData {
  String id;
  String username;
  String email;
  List favourites;
  UserData()
      : id = FireBaseHelper().getCurrentUserId(),
        username = FireBaseHelper().getCurrentUsername(),
        email = FireBaseHelper().getCurrentUserEmail(),
        favourites = [];
}
