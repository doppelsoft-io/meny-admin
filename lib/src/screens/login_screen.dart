import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meny/src/constants/spacing.dart';
import 'package:meny/src/data/login/login.dart';
import 'package:meny/src/screens/signup_screen.dart';
import 'package:meny/src/services/services.dart';
import 'package:meny/src/utils/utils.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = '/login';

  static Route route() {
    return MaterialPageRoute<Widget>(
      builder: (context) {
        return BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
          child: const LoginScreen(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final loginFormKey = useState(GlobalKey<FormState>());
    final emailController = useTextEditingController();
    final updateEmail = useValueListenable(emailController);
    final passwordController = useTextEditingController();
    final updatePassword = useValueListenable(passwordController);

    useEffect(() {
      emailController
        ..text = updateEmail.text
        ..selection =
            TextSelection.collapsed(offset: emailController.text.length);

      passwordController
        ..text = updatePassword.text
        ..selection =
            TextSelection.collapsed(offset: passwordController.text.length);
      return null;
    }, [
      updateEmail,
      updatePassword,
    ]);

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        state.maybeWhen(
          done: (result) {
            result.fold(
              (failure) => DialogService.showErrorDialog(
                context: context,
                failure: failure,
              ),
              (user) {
                /// Pop login screen
                Navigator.of(context).pop();
                ToastService.showNotification(const Text("You're logged in!"));
              },
            );
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Log In'),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(
              getValueForScreenType<double>(
                context: context,
                mobile: Spacing.formPadding / 2,
                tablet: Spacing.formPadding,
                desktop: Spacing.formPadding,
              ),
            ),
            child: Form(
              key: loginFormKey.value,
              child: Column(
                children: [
                  Text(
                    'Log in to your account',
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: Spacing.textFieldVerticalSpacing * 2),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      label: Text('Email'),
                      hintText: 'Enter your email address',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [
                      ValidatorInputFormatter(
                        editingValidator: EmailEditingRegexValidator(),
                      ),
                    ],
                    onFieldSubmitted: (value) {
                      loginFormKey.value.currentState?.validate();
                    },
                    onEditingComplete: () {
                      loginFormKey.value.currentState?.validate();
                    },
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        return EmailSubmitRegexValidator().isValid(value)
                            ? null
                            : 'Email is invalid';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: Spacing.textFieldVerticalSpacing),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      label: Text('Password'),
                      hintText: 'Enter your password',
                    ),
                    onFieldSubmitted: (value) {
                      loginFormKey.value.currentState?.validate();
                    },
                    onEditingComplete: () {
                      loginFormKey.value.currentState?.validate();
                    },
                  ),
                  const SizedBox(height: Spacing.textFieldVerticalSpacing),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: [
                            emailController.text,
                            passwordController.text
                          ].any((value) => value.isEmpty)
                              ? null
                              : () {
                                  final isValid = loginFormKey
                                      .value.currentState!
                                      .validate();
                                  if (isValid) {
                                    context
                                        .read<LoginCubit>()
                                        .loginWithCredentials(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        );
                                  }
                                },
                          child: state.maybeWhen(
                            loggingIn: () => SizedBox(
                              height: 18,
                              width: 18,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.green.shade50,
                              ),
                            ),
                            orElse: () => const Text('Log In'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed(SignupScreen.routeName),
                    child: const Text("Don't have an account?"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
