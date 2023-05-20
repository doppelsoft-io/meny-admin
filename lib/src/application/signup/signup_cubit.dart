import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/extensions/extensions.dart';
import 'package:meny_admin/src/infrastructure/infrastructure.dart';
import 'package:meny_core/meny_core.dart';

part 'signup_state.dart';
part 'signup_cubit.freezed.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({
    AuthRepository? authRepository,
    StoreRepository? storeRepository,
    FirebaseFirestore? firebaseFirestore,
    UuidService? uuidService,
    required AuthCubit authCubit,
  })  : _authRepository = authRepository ?? Locator.instance(),
        _storeRepository = storeRepository ?? Locator.instance(),
        _firebaseFirestore = firebaseFirestore ?? Locator.instance(),
        _uuidService = uuidService ?? Locator.instance(),
        _authCubit = authCubit,
        super(SignupState.initial(store: StoreModel.empty()));

  final AuthRepository _authRepository;
  final StoreRepository _storeRepository;
  final FirebaseFirestore _firebaseFirestore;
  final UuidService _uuidService;
  final AuthCubit _authCubit;

  Future<void> handleSignUp({
    required String storeName,
    required String email,
    required String password,
  }) async {
    try {
      emit(
        _SigningIn(
          store: state.store,
          email: email,
          password: password,
        ),
      );

      await _authRepository.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = await _authRepository.loginWithEmailAndPassword(
        email: email,
        password: password,
      );

      final newUserId = user.id;

      if (newUserId == null) {
        throw const CustomException(
          message: 'Failed creating user',
        );
      }

      final storeUuid = _uuidService.uuid;

      final newStore = StoreModel.empty().copyWith(
        id: storeUuid,
        name: storeName,
        owner: newUserId,
        users: [newUserId],
        roles: {
          newUserId: StoreRole.owner.asString(),
        },
      );

      final storeRef = _firebaseFirestore.storesCollection().doc(storeUuid);

      final batch = _firebaseFirestore.batch();

      final usersRef = _firebaseFirestore.usersDocument(
        userId: user.id ?? '',
      );

      batch
        ..set(usersRef, user.toJson())
        ..set(storeRef, newStore.toJson(), SetOptions(merge: true));

      await batch.commit();

      emit(
        SignupState.done(
          store: state.store,
          email: state.email,
          password: state.password,
          result: right(true),
        ),
      );
    } on CustomException catch (err) {
      print('MEE: err $err');
      emit(
        SignupState.done(
          store: state.store,
          email: state.email,
          password: state.password,
          result: left(err),
        ),
      );
    } catch (err) {
      print('MEE: err ${err.runtimeType}');
      emit(
        SignupState.done(
          store: state.store,
          email: state.email,
          password: state.password,
          result: left(CustomException(message: err.toString())),
        ),
      );
    } finally {
      emit(
        SignupState.initial(
          store: state.store,
          email: state.email,
          password: state.password,
        ),
      );
    }
  }
}
