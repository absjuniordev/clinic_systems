import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'attendant_desk_assignment_repository.dart';

class AttendantDeskAssignmentImpl implements AttendantDeskAssignmentRepository {
  RestClient restClient;
  AttendantDeskAssignmentImpl({
    required this.restClient,
  });
  @override
  Future<Either<RepositoryException, Unit>> startService(int deskNumber) async {
    final Either<RepositoryException, Unit> result = await _clearDeskByNumber();

    switch (result) {
      case Left(value: final RepositoryException exception):
        return Left<RepositoryException, Unit>(exception);
      case Right():
        await restClient.auth
            .post<dynamic>('/attendantDeskAssignment', data: <String, Object>{
          'user_id': '#userAuthRef',
          'desk_number': deskNumber,
          'date_created': DateTime.now().toIso8601String(),
          'status': 'Available'
        });
        return Right<RepositoryException, Unit>(unit);
    }
  }

  Future<Either<RepositoryException, Unit>> _clearDeskByNumber() async {
    try {
      final desk = await _getDeskByUser();

      if (desk != null) {
        await restClient.auth.delete('/attendantDeskAssignment/${desk.id}');
      }

      return Right(unit);
    } on DioException catch (e, s) {
      log('Erro ao deletar nnumero do guiche', error: e, stackTrace: s);
      return Left(RepositoryException());
    }
  }

  Future<({String id, int deskNumber})?> _getDeskByUser() async {
    final Response(:List data) = await restClient.auth.get(
        '/attendantDeskAssignment',
        queryParameters: {'user_id': '#userAuthRef'});
    if (data
        case List(
          isNotEmpty: true,
          first: {'ida': String id, 'desk_number': int deskNumber}
        )) {
      return (
        id: id,
        deskNumber: deskNumber,
      );
    }
    return null;
  }
}
