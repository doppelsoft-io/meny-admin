import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meny_admin/src/data/stores/stores.dart';
import 'package:meny_admin/src/data/tags/tags.dart';
import 'package:meny_admin/src/presentation/resources/widgets/delete_resource_button.dart';
import 'package:meny_admin/src/presentation/shared/shared.dart';
import 'package:meny_admin/src/presentation/sheet_args.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_admin/themes.dart';
import 'package:meny_core/meny_core.dart';

class UpdateTagSheetParams {
  UpdateTagSheetParams({
    required this.nameController,
  });

  final TextEditingController nameController;

  void seed({
    String name = '',
  }) {
    TextEditingControllerHelper.setText(nameController, name);
  }
}

class UpdateTagSheet extends StatelessWidget {
  const UpdateTagSheet({
    Key? key,
    required this.resource,
  }) : super(key: key);

  final TagModel resource;

  static const String routeName = '/updateTag';

  static Route route(SheetArgs args) {
    return MaterialPageRoute<Widget>(
      fullscreenDialog: true,
      builder: (context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<EditTagCubit>(
              create: (context) => EditTagCubit(
                storeCubit: context.read<StoreCubit>(),
              )..loadItem(args.resource as TagModel),
            ),
            BlocProvider<DeleteTagCubit>(
              create: (context) => DeleteTagCubit(),
            ),
          ],
          child: const _UpdateTagSheet(),
        );
      },
    );
  }

  static Future<Object?> open({
    required BuildContext context,
    required TagModel resource,
  }) {
    return Navigator.of(context).pushNamed(
      UpdateTagSheet.routeName,
      arguments: SheetArgs(resource: resource),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const _UpdateTagSheet();
  }
}

class _UpdateTagSheet extends HookWidget {
  const _UpdateTagSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deleteTagState = context.watch<DeleteTagCubit>().state;
    final params = UpdateTagSheetParams(
      nameController: useTextEditingController(),
    );

    return BlocConsumer<EditTagCubit, EditTagState>(
      listener: (context, editTagState) {
        editTagState.maybeWhen(
          success: (_) => Navigator.pop(context),
          error: (category, exception) {
            DialogService.showErrorDialog(
              context: context,
              failure: CustomException(message: exception.toString()),
            );
          },
          loaded: (tag) {
            params.seed(name: tag.name);
          },
          orElse: () {},
        );
      },
      builder: (context, editTagState) {
        return editTagState.maybeWhen(
          loading: (_) => ScaffoldBuilder.loading(),
          error: (_, exception) => ScaffoldBuilder.error(
            exception: exception,
          ),
          orElse: () {
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                iconTheme: const IconThemeData(color: Colors.black),
                backgroundColor: Colors.white,
                title: const Text(
                  'Edit Tag',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                centerTitle: false,
                actions: [
                  Center(child: _DeleteTagButton(tag: editTagState.tag)),
                  HorizontalSpacing.small(),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<EditTagCubit>().update(
                              editTagState.tag
                                  .copyWith(name: params.nameController.text),
                            );
                      },
                      child: const Text('Save'),
                    ),
                  ),
                  HorizontalSpacing.medium(),
                ],
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(8),
                  child: Visibility(
                    visible: editTagState.maybeWhen(
                          orElse: () => false,
                          updating: (_) => true,
                        ) ||
                        deleteTagState.maybeWhen(
                          orElse: () => false,
                          deleting: () => true,
                        ),
                    child: const LinearProgressIndicator(),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(Spacing.pageSpacing),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DText.subtitle1('Name'),
                    VerticalSpacing.smallest(),
                    DTextFormField(
                      theme: Themes.theme.textFormFieldThemeData,
                      args: DTextFormFieldArgs(
                        autofocus: true,
                        controller: params.nameController,
                        decoration: const InputDecoration(
                          hintText: 'Enter a name',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _DeleteTagButton extends StatelessWidget {
  const _DeleteTagButton({
    Key? key,
    required this.tag,
  }) : super(key: key);

  final TagModel tag;

  void showConfirmationDialog({
    required BuildContext context,
    required TagModel tag,
  }) {
    showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete ${tag.name}?'),
          content: Text(
            'This will remove this tag from all menus or menu items',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          actions: [
            OutlinedButton(
              onPressed: () => Navigator.of(context).pop(false),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black),
              ),
              child: const Text('NO'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).errorColor),
              ),
              child: const Text('YES'),
            ),
          ],
        );
      },
    ).then((value) {});
  }

  @override
  Widget build(BuildContext context) {
    final deleteTagState = context.watch<DeleteTagCubit>().state;

    return DeleteResourceButton(
      args: DeleteResourceButtonArgs(
        onPressed: deleteTagState.maybeWhen(
          deleting: () {
            return null;
          },
          orElse: () => () async {
            final result = await DConfirmDialog.open<bool>(
              context,
              args: DConfirmDialogArgs(
                title: Text('Delete ${tag.name}?'),
                content: Text(
                  'This will remove this tag from all menus or menu items',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                confirmArgs: DConfirmDialogConfirmArgs(
                  buttonStyle: ElevatedButton.styleFrom(
                    primary: Theme.of(context).errorColor,
                  ),
                ),
              ),
            );

            if (result != null && result) {
              // TODO
            }
          },
        ),
      ),
    );
  }
}
