
import 'package:finnogate_challenge/src/constants/general_constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String? passwordValidator(String? value,AppLocalizations localizations){
  if(value!.isEmpty) return localizations.required;
  if(value.length<6) {
    return localizations.password_short;
  } else {
    return null;
  }
}

String? confirmPasswordValidator(String? value,String? passwordValue,AppLocalizations localizations){
  if(value!.isEmpty) return localizations.required;
  if(value != passwordValue) {
    return localizations.not_match;
  } else {
    return null;
  }
}



String? emailValidator(String? value,AppLocalizations localizations){
  if(value!.isEmpty) return localizations.required;
  if(!emailRegex.hasMatch(value)) {
    return localizations.email_invalid;
  } else {
    return null;
  }
}