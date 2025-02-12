import 'package:clean/features/domain/entities/user/user_entity.dart';

abstract class FirebaseRemoteDataSource {

  // Credential
  Future<void> signInUser(UserEntity user);

  Future<void> signUpUser(UserEntity user);
  
  Future<bool> isSignIn();

  Future<void> signOut(); 

  //user 
  Stream<List<UserEntity>> getUsers(UserEntity user);

  Stream<List<UserEntity>> getSingleUser(String uid);

  Future<String> getCurrentUid();

  Future<void> createUser(UserEntity user);

  Future<void> updateUser(UserEntity user);
}