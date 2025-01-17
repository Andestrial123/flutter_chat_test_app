import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_test_app/config/router/app_router.gr.dart';
import 'package:flutter_chat_test_app/di.dart';
import 'package:flutter_chat_test_app/features/login/bloc/login_bloc.dart';

import '../../shared/widgets/text_fields.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _form = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(authRepository: getIt()),
      child: Scaffold(
        body: SafeArea(
            child: BlocConsumer<LoginBloc, LoginState>(
          buildWhen: (prev, current) => current is LoginLoading || current is LoginInitial,
          builder: (context, state) {
            if (state is LoginInitial) {
              return Form(
                key: _form,
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      LoginTextField(
                        controller: _textEditingController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            final isValid = _form.currentState!.validate();
                            if (isValid) {
                              context.read<LoginBloc>().add(LoginSendEvent(_textEditingController.text));
                            }
                          },
                          child: const Text("Start chat!"))
                    ],
                  ),
                ),
              );
            } else if (state is LoginLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
          listener: (BuildContext context, LoginState state) {
            if (state is LoginSuccess) {
              context.router.replaceAll([const ChatPageRoute()]);
            }
            if (state is LoginFailed) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
        )),
      ),
    );
  }
}
