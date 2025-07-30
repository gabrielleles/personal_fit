import '../entities/personal.dart';

abstract class PersonalRepository {
  Future<List<Personal>> getAll();
}
