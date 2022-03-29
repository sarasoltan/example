//login
class UserNotFoundAuthException implements Exception {}

class WrongPasswordAuthException implements Exception {}

//register
class WeakPasswordAuthException implements Exception {}

class EmailAlreadyInUseAuthException implements Exception {}

class InavlidEmailAuthException implements Exception {}

//generic exceptions
class GenericAuthException implements Exception {}

class UserNotLoggedInAuthException implements Exception {}