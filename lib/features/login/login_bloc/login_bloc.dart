import 'package:bloc/bloc.dart';

part 'login_events.dart';
part 'login_states.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<EmailEvent>(emailEvent);
  }

  void emailEvent(EmailEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }
}
