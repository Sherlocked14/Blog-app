import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/features/auth/domain/entity/user.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignUp implements Usecase<User, userSignupParams> {
  final AuthRepository authRepository;
  const UserSignUp(this.authRepository);

  @override
  Future<Either<Failure, User>> call(userSignupParams params) async {
      return await authRepository.signUpWithEmailAndPassword(
        name: params.name,
        email: params.email,
        password: params.password,
      );
  }
}

class userSignupParams {
  final String name;
  final String email;
  final String password;

  const userSignupParams({
    required this.name,
    required this.email,
    required this.password,
  });
}
