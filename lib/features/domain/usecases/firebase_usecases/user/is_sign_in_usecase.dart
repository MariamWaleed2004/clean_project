import 'package:clean/features/domain/repository/firebase_repository.dart';

class IsSignInUsecase {
  final FirebaseRepository repository;

  IsSignInUsecase({required this.repository});

  Future<bool> call() {
    return repository.isSignIn();
  }
}