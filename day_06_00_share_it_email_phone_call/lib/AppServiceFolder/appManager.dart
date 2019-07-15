import 'package:get_it/get_it.dart';
import 'calls_and_messages_service.dart';

GetIt sharedAppManager = GetIt();

void setupSharedManagerSingleton() {
  sharedAppManager.registerSingleton(CallAndMessageServiceClass());
}
