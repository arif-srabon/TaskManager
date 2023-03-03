import 'package:shared_preferences/shared_preferences.dart';

class AuthUtils {
  static String? firstName, lastName, email, mobile, photo, token;

  static Future<void> saveUserData(String ufirstName, String ulastName, String uemail,
     String umobile, String uphoto, String utoken) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', utoken);
    await sharedPreferences.setString('firstName', ufirstName);
    await sharedPreferences.setString('lastName', ulastName);
    await sharedPreferences.setString('email', uemail);
    await sharedPreferences.setString('mobile', umobile);
    await sharedPreferences.setString('photo', uphoto);
    firstName = ufirstName;
    lastName = ufirstName;
    email = uemail;
    mobile = umobile;
    photo = uphoto;
    token = utoken;
  }

  static Future<bool> checkLoginState() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? Token = sharedPreferences.getString('token');
    if( Token == null){
      return false;
    }
    return true;
  }

  static Future<void> getAuthData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token');
    firstName = sharedPreferences.getString('firstName');
    lastName = sharedPreferences.getString('lastName');
    email = sharedPreferences.getString('email');
    mobile = sharedPreferences.getString('mobile');
    photo = sharedPreferences.getString('photo');

  }

  static Future<void> clearAuthData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}
