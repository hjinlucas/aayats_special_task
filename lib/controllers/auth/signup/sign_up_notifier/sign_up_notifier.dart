import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'sign_up_state.dart';
part 'sign_up_notifier.g.dart';

@riverpod
class SignUpNotifier extends _$SignUpNotifier {
  @override
  SignUpState build() {
    return SignUpState();
  }

  void onUserNameChange(String userName) {
    state = state.copyWith(userName: userName);
  }

  void onEmailChange(String email) {
    state = state.copyWith(email: email);
  }

  void onPasswordChange(String password) {
    state = state.copyWith(password: password);
  }

  void onRePasswordChange(String rePassword) {
    state = state.copyWith(rePassword: rePassword);
  }
}
