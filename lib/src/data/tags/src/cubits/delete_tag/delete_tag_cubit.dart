import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_tag_state.dart';
part 'delete_tag_cubit.freezed.dart';

class DeleteTagCubit extends Cubit<DeleteTagState> {
  DeleteTagCubit() : super(const DeleteTagState.initial());
}
