import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/data/login/login.dart';
import 'package:meny_admin/src/presentation/shared/app_header.dart';
import 'package:meny_admin/src/screens/signup_screen.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_admin/src/utils/utils.dart';
import 'package:meny_admin/themes.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: const _LoginScreen(),
    );
  }
}

class _LoginScreen extends HookWidget {
  const _LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginFormKey = useState(GlobalKey<FormState>());
    final emailController = useTextEditingController();
    final updateEmail = useValueListenable(emailController);
    final passwordController = useTextEditingController();
    final updatePassword = useValueListenable(passwordController);

    useEffect(() {
      TextEditingControllerHelper.setText(
        emailController,
        updateEmail.text,
      );

      TextEditingControllerHelper.setText(
        passwordController,
        updatePassword.text,
      );
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
                Locator.instance<ToastService>()
                    .showNotification(const Text("You're logged in!"));
              },
            );
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(
              getValueForScreenType<double>(
                context: context,
                mobile: kToolbarHeight,
                desktop: 76,
              ),
            ),
            child: const AppHeader(),
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
                  DTextFormField(
                    theme: Themes.theme.textFormFieldThemeData,
                    args: DTextFormFieldArgs(
                      autocorrect: false,
                      controller: emailController,
                      decoration: const InputDecoration(
                        label: Text('Email'),
                        hintText: 'Enter your email address',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
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
                  ),
                  const SizedBox(height: Spacing.textFieldVerticalSpacing),
                  DTextFormField(
                    theme: Themes.theme.textFormFieldThemeData,
                    args: DTextFormFieldArgs(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        label: Text('Password'),
                        hintText: 'Enter your password',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      onFieldSubmitted: (value) {
                        loginFormKey.value.currentState?.validate();
                      },
                      onEditingComplete: () {
                        loginFormKey.value.currentState?.validate();
                      },
                    ),
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
                  const SizedBox(height: 24),
                  TextButton(
                    onPressed: () {
                      GoRouter.of(context).pushNamed(SignupScreen.routeName);
                    },
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
