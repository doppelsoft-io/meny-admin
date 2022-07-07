import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/data/auth/auth.dart';
import 'package:meny_admin/src/data/signup/signup.dart';
import 'package:meny_admin/src/data/stores/stores.dart';
import 'package:meny_admin/src/presentation/shared/shared.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_admin/src/utils/utils.dart';
import 'package:meny_admin/themes.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(
        authCubit: context.read<AuthCubit>(),
      ),
      child: const _SignupScreen(),
    );
  }
}

class _SignupScreen extends HookWidget {
  const _SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signupFormKey = useState(GlobalKey<FormState>());
    final storeNameController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    final updateStoreName = useValueListenable(storeNameController);

    final emailController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    final updateEmail = useValueListenable(emailController);

    final passwordController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    final updatePassword = useValueListenable(passwordController);

    useEffect(() {
      TextEditingControllerHelper.setText(
        storeNameController,
        updateStoreName.text,
      );

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
      updateStoreName,
      updateEmail,
      updatePassword,
    ]);

    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        state.maybeMap(
          done: (state) {
            state.result.fold(
              (failure) => DialogService.showErrorDialog(
                context: context,
                failure: failure,
              ),
              (result) {
                /// Pop Signup Screen
                Navigator.of(context).pop();

                /// Pop Login Screen
                Navigator.of(context).pop();

                Locator.instance<ToastService>().showNotification(
                  const Text('Your sign up was successful!'),
                );
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
              key: signupFormKey.value,
              child: Column(
                children: [
                  Text(
                    'Create an account to save and publish your menus',
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: Spacing.textFieldVerticalSpacing * 2),
                  DTextFormField(
                    theme: Themes.theme.textFormFieldThemeData,
                    args: DTextFormFieldArgs(
                      autocorrect: false,
                      autovalidateMode: AutovalidateMode.always,
                      controller: storeNameController,
                      decoration: const InputDecoration(
                        label: Text('Business name'),
                        hintText: 'Add the name of your business',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (value) {
                        signupFormKey.value.currentState?.validate();
                      },
                      onEditingComplete: () {
                        signupFormKey.value.currentState?.validate();
                      },
                      validator: (value) {
                        if (value == null) return null;
                        if (value.isEmpty) return null;
                        return value.isNotEmpty && value.trim().isNotEmpty
                            ? null
                            : 'You must provide a valid name';
                      },
                    ),
                  ),
                  const SizedBox(height: Spacing.textFieldVerticalSpacing),
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
                        signupFormKey.value.currentState?.validate();
                      },
                      onEditingComplete: () {
                        signupFormKey.value.currentState?.validate();
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
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        label: Text('Password'),
                        hintText: 'Enter a password',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                    ),
                  ),
                  const SizedBox(height: Spacing.textFieldVerticalSpacing),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: [
                            storeNameController.text,
                            emailController.text,
                            passwordController.text
                          ].any((value) => value.isEmpty)
                              ? null
                              : () {
                                  final isValid = signupFormKey
                                      .value.currentState!
                                      .validate();
                                  if (isValid) {
                                    final store =
                                        context.read<StoreCubit>().state.store;
                                    context.read<SignupCubit>().handleSignUp(
                                          store: store.copyWith(
                                            name:
                                                storeNameController.text.trim(),
                                          ),
                                          email: emailController.text.trim(),
                                          password:
                                              passwordController.text.trim(),
                                        );
                                  }
                                },
                          child: state.maybeMap(
                            signingIn: (_) => SizedBox(
                              height: 18,
                              width: 18,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.green.shade50,
                              ),
                            ),
                            orElse: () => const Text('Sign Up'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Already have an account?'),
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
