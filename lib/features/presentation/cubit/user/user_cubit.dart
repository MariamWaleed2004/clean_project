import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:clean/features/domain/entities/user/user_entity.dart';
import 'package:clean/features/domain/usecases/firebase_usecases/user/get_current_uid_usecase.dart';
import 'package:clean/features/domain/usecases/firebase_usecases/user/get_users_usecase.dart';
import 'package:clean/features/domain/usecases/firebase_usecases/user/update_user_usecase.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UpdateUserUsecase updateUserUsecase;
  final GetUsersUsecase getUsersUsecase;

  UserCubit({
    required this.updateUserUsecase, 
    required this.getUsersUsecase,
    }) : super(UserInitial());



    Future<void> getUsers({required UserEntity user}) async {
       try {
        final streamResponse = getUsersUsecase.call(user);
        streamResponse.listen((users) {
          emit(UserLoaded(users: users));
        });
       } on SocketException catch (_) {
        emit(UserFailure());
       } catch (_) {
        emit(UserFailure());
       }
    }



    Future<void> updateUser({required UserEntity user}) async {
        try {
          await updateUserUsecase.call(user);
        } on SocketException catch (_) {
          emit(UserFailure());
        } catch (_) {
          emit(UserFailure());
        }
      }
}
