import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:clean/features/domain/entities/user/user_entity.dart';
import 'package:clean/features/domain/usecases/firebase_usecases/user/get_single_user_usecase.dart';
import 'package:equatable/equatable.dart';

part 'get_single_user_state.dart';

class GetSingleUserCubit extends Cubit<GetSingleUserState> {
  final GetSingleUserUsecase getSingleUserUsecase;
  GetSingleUserCubit({
    required this.getSingleUserUsecase
    }) : super(GetSingleUserInitial());

      Future<void> getSingleUser({required String uid}) async {
        emit(GetSingleUserLoading());
       try {
        final streamResponse = getSingleUserUsecase.call(uid);
        streamResponse.listen((users) {
          emit(GetSingleUserLoaded(user: users.first));
        });
       } on SocketException catch (_) {
        emit(GetSingleUserFailure());
       } catch (_) {
        emit(GetSingleUserFailure());
       }
    }
}
