class AppConstants {
  const AppConstants();

  static Api appApi = const Api();
  static ApiKey apiKey = const ApiKey();
  static ErrorKey errorKey = const ErrorKey();
  static ErrorMessage errorMessage = const ErrorMessage();
}

class Api {
  const Api();

  String get baseUrlProd => 'https://reqres.in/';

  String get baseUrlDev => 'https://reqres.in/';

  String get allUsers => '/api/users?page=';

  String get createUser => '/api/users';

  String get updateUser => '/api/users/';

  String get deleteUser => '/api/users/';
}

class ApiKey {
  const ApiKey();

  String get myApiKey => 'apiKey=';
}

class ErrorKey {
  const ErrorKey();

  String get message => "message";
}

class ErrorMessage {
  const ErrorMessage();

  String get apiKeyDisabled => "username must not empty";

  String get apiKeyExhausted => "password must not empty";

  String get apiKeyInvalid => "confirm password must not empty";

  String get apiKeyMissing => "password and confirm password must same";

  String get parameterInvalid => "username and password must not empty";

  String get parametersMissing => 'failed get onboarding status';

  String get rateLimited => 'failed get onboarding status';

  String get sourcesTooMany => "full name must not empty";

  String get sourceDoesNotExist => "email must not empty";

  String get unexpectedError => "address must not empty";
}
