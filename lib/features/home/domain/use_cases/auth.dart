import '../repositories/repository.dart';

class VerifyAuthUseCase {
  final HomeRepository repository;

  VerifyAuthUseCase({
    required this.repository,
  });

  Future<Map<String, dynamic>> call() async {
    final result = await repository.getVerify();

    return result;
  }
}
