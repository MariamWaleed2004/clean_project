import 'package:clean/features/domain/entities/user/user_entity.dart';
import 'package:clean/features/domain/repository/firebase_repository.dart';

class SignInUserUsecase {
  final FirebaseRepository repository;

  SignInUserUsecase({required this.repository});

  Future<void> call(UserEntity user) {
    return repository.signInUser(user);
  }
}