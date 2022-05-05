import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'developer_state.dart';
part 'developer_cubit.freezed.dart';

class DeveloperCubit extends Cubit<DeveloperState> {
  DeveloperCubit() : super(const DeveloperState.initial());
}
