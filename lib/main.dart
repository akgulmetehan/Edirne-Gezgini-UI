import 'package:edirne_gezgini_ui/util/auth_credential_store.dart';
import 'package:edirne_gezgini_ui/widget/edirne_gezgini.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  final GetIt getIt = GetIt.instance;
  getIt.registerSingleton<AuthCredentialStore>(AuthCredentialStore());
  runApp(const EdirneGezgini());
}


