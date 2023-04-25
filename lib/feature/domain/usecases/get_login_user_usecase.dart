import 'package:clean_architecture_bloc/feature/domain/entities/user.dart';

import '../../../core/usecase/usecase.dart';
import '../repositories/user_repository.dart';

class GetLoginUserUsecase implements Usecase<Future<User>, NoParam> {
  GetLoginUserUsecase({required UserRepository userRepository})
      : _userRepository = userRepository;

  final UserRepository _userRepository;

  @override
  Future<User> call(NoParam param) {
    return _userRepository.user;
  }
}
