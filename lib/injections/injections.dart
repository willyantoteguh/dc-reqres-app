import '../app/core/di/dependency.dart';
import '../domains/users/di/dependency.dart';

class Injections {
  Future<void> initialize() async {
    _registerDomains();
  }

  Future<void> _registerDomains() async {
    UsersDepency();
    RegisterCoreModule();
  }
}