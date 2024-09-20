
import 'package:chat_apps/core/service/firebase_service.dart';
import 'package:chat_apps/feature/chat/provider/chat_provider.dart';
import 'package:get_it/get_it.dart';

final GetIt di = GetIt.instance;

Future setup() async {
  // Service
  di.registerFactory<FirebaseService>(() => FirebaseService());

  // Provider
  di.registerFactory<ChatProvider>(() => ChatProvider(di<FirebaseService>()));
}