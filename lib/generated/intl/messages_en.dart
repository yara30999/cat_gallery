// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alreadyHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Already have an account?"),
        "appTitle":
            MessageLookupByLibrary.simpleMessage("Flutter cat information app"),
        "createAccount": MessageLookupByLibrary.simpleMessage("Create Account"),
        "emailLabel": MessageLookupByLibrary.simpleMessage("Email Id"),
        "emailNotValid":
            MessageLookupByLibrary.simpleMessage("Email not formatted well"),
        "emptyMsg": MessageLookupByLibrary.simpleMessage("Field is required"),
        "forgotYourPassword":
            MessageLookupByLibrary.simpleMessage("Forgot Your Password?"),
        "hello": MessageLookupByLibrary.simpleMessage("Hello!"),
        "loginLabel": MessageLookupByLibrary.simpleMessage("Login"),
        "loginTitle":
            MessageLookupByLibrary.simpleMessage("Sign into your Account."),
        "noRouteFound": MessageLookupByLibrary.simpleMessage("no_route_found"),
        "notAMember": MessageLookupByLibrary.simpleMessage("Not a member?"),
        "orContinueWith":
            MessageLookupByLibrary.simpleMessage("Or Continue With"),
        "passwordConfirmLabel":
            MessageLookupByLibrary.simpleMessage("Confirm Password"),
        "passwordLabel": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordNotValid": MessageLookupByLibrary.simpleMessage(
            "Password must be at least 6 characters long"),
        "passwordsDoNotMatch":
            MessageLookupByLibrary.simpleMessage("Passwords do not match"),
        "registerLabel": MessageLookupByLibrary.simpleMessage("Register"),
        "usernameLabel": MessageLookupByLibrary.simpleMessage("Username"),
        "usernameNotValid":
            MessageLookupByLibrary.simpleMessage("Username not valid"),
        "usernameTooLong":
            MessageLookupByLibrary.simpleMessage("Username too long"),
        "usernameTooShort":
            MessageLookupByLibrary.simpleMessage("Username too short")
      };
}
