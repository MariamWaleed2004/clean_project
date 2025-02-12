import 'package:clean/features/domain/entities/user/user_entity.dart';
import 'package:clean/features/domain/repository/firebase_repository.dart';

class CreateUserUsecase {
  final FirebaseRepository repository;

  CreateUserUsecase({required this.repository});

  Future<void> call(UserEntity user) {
    return repository.createUser(user);
  }
}