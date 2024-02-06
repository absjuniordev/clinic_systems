import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';

import './user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RestClient restClient;

  UserRepositoryImpl({
    required this.restClient,
  });

  @override
  Future<Either<AuthException, String>> login(
      String email, String passowrd) async {
    try {
      final response = await restClient.post('/auth', data: {
        'email': email,
        'passowrd': passowrd,
        'admin': true,
      });

      print(response);
      final Response(data: {'access_token': accessToken}) =
          await restClient.unAuth.post('/auth', data: {
        'email': email,
        'passowrd': passowrd,
        'admin': true,
      });
      return Right(accessToken);
    } on DioException catch (e, s) {
      log('Error ao realizar login', error: e, stackTrace: s);
      return switch (e) {
        DioException(response: Response(statusCode: HttpStatus.forbidden)?) =>
          Left(AuthUnauthorizedException()),
        _ => Left(AuthError(message: 'Error ao realizar login'))
      };
    }
  }
}
