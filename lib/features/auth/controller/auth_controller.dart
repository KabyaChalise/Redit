import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit/features/auth/repository/auth_repository.dart';


final authControllerProvider = Provider<AuthController>((ref) => AuthController(authRepository: ref.read(authRepositoryProvider)));



class AuthController {
  final AuthRepository _authRepository;
  AuthController({required AuthRepository authRepository}) : _authRepository = authRepository;

  void signInWithGoogle(){
    _authRepository.signInWithGoogle();
  }
}
