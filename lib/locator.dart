import 'package:bitdrill/providers/auth_provider.dart';
import 'package:bitdrill/providers/home_provider.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.I;

void setUpLocators(){
   locator.registerLazySingleton<AuthProvider>(() => AuthProvider());
   locator.registerLazySingleton<HomeProvider>(() => HomeProvider());
}