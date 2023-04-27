abstract class LoginRepository {
  Future<bool> authentication(String email, String password);
}
