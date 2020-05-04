import 'dart:async';
import 'dart:io';

Directory storage = Directory('/storage/emulated/0/');

StreamController mainstream = StreamController();

List<FileSystemEntity> directories = [];

void setDirectory(String path) {
  storage = Directory(path);
}

void streamhelm() {
  print(storage.parent);
  directories.clear();

  storage.list().listen((dirs) {
    directories.add(dirs);
  }).onDone(() {
    mainstream.add(directories);
  });
}
