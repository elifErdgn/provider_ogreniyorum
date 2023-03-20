import 'package:dio/dio.dart';

import 'models.dart';

abstract class IUserService {
  IUserService(this.dio);

  final Dio dio;

  Future<UserModel?> fetchUsersItem();
}

class UserService extends IUserService {
  UserService(super.dio);

  /// dio yu üst class tan çağırdık

  @override
  Future<UserModel?> fetchUsersItem() async {
    final response =
        await dio.post('/users', data: {'name': 'elif', 'job': 'ddd'});
    if (response.statusCode == 200) {
      final jsonBody = response.data;
      if(jsonBody is Map<String, dynamic>){
        return UserModel.fromJson(jsonBody);
      }
      print(response.statusCode);
      print(response.data);
      print("kayıt başarılı");
    }
    return null;
  }
}

class ProjectDioMixin {
  //final baseUrl =  Uri.parse("https://reqres.in/api/users");
  final baseURL = Dio(BaseOptions(baseUrl: "https://reqres.in/api"));
}
