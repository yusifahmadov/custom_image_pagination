import 'dart:io';

String jsonReader(String name) =>
    File('test/core/json/$name').readAsStringSync();
