import 'package:bitdrill/providers/auth_provider.dart';
import 'package:bitdrill/providers/home_provider.dart';
import 'package:bitdrill/providers/profile_provider.dart';
import 'package:bitdrill/providers/report_provider.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.I;

void setUpLocators(){
   locator.registerLazySingleton<AuthProvider>(() => AuthProvider());
   locator.registerLazySingleton<HomeProvider>(() => HomeProvider());
   locator.registerLazySingleton<ProfileProvider>(() => ProfileProvider());
   locator.registerLazySingleton<ReportProvider>(() => ReportProvider());
}