import 'package:auto_route/annotations.dart';
import 'package:clean_architecture_bloc/feature/presentation/blocs/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import 'login_layout.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => di<LoginBloc>(),
        ),
      ],
      child: const LoginLayout(),
    );
  }
}
