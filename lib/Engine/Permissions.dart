
import 'package:permission_handler/permission_handler.dart';

void getPermissions() async{
  await Permission.storage.request();
}