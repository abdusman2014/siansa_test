import 'user_auth_repository.dart';

class UserRepository {
  // Sub-repositories
  late final UserAuthRepository _authRepository;

  // Constructor
  UserRepository() : _authRepository = UserAuthRepository();

  // Exposing the sub-repositories as properties
  UserAuthRepository get auth => _authRepository;
}
