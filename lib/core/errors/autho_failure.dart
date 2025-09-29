
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthoFailure {
 final String errorMsg;

  AuthoFailure(this.errorMsg);
 
}


class AuthoServerFailure extends  AuthoFailure  {
  AuthoServerFailure(super.errorMsg);

  factory AuthoServerFailure.fromSupabaseAuth(AuthException exception) {
    return AuthoServerFailure(exception.message);
  }

  factory AuthoServerFailure.fromSupabase(PostgrestException exception) {
    return AuthoServerFailure(exception.message);
  }

  factory AuthoServerFailure.unexpectedError([String? msg]) {
    return AuthoServerFailure(msg ?? "Unexpected Error, Please try again!");
  }
}
