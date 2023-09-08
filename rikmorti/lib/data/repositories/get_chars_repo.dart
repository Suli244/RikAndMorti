import 'package:dio/dio.dart';
import '../models/character_Model.dart';

class GetCharsRepo {
  final Dio dio;
  GetCharsRepo({required this.dio });  

  Future<CharacterModel> getData ({String? name}) async {
   final response = await dio.get('character/', queryParameters:{"name":  name});
   return  CharacterModel.fromJson(response.data);
  }
}