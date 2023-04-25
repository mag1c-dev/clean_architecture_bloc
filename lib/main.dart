import 'package:clean_architecture_bloc/injection_container.dart';
import 'package:flutter/material.dart';
import 'app.dart';

void main() async {
  await initDependency();
  runApp(const App());
}
