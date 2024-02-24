import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HandelBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    debugPrint('-----------------onCreate--------------------\n'
        'onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('-----------------onChange--------------------\n'
        'onChange -- ${bloc.runtimeType} , $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    debugPrint('Error  occurred in ${bloc.runtimeType}\n'
        '-----------------Error--------------------\n'
        '$error'
        '-----------------StackTrace--------------------\n'
        '${stackTrace.toString()}');
    // debugPrint('onError -- ${bloc.runtimeType} , $error');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint('-----------------Bloc Transition------------------------\n'
        'bloc: ${bloc.runtimeType}\n'
        'Event: ${transition.event.runtimeType}\n'
        'CurrentState: ${transition.currentState.runtimeType}: ${transition.currentState.toString()} \n'
        'NextState: ${transition.nextState.runtimeType}: ${transition.nextState.toString()} \n'
        '----------------------------------------------------------\n');

    super.onTransition(bloc, transition);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    debugPrint('--------------------------Bloc Event-----------------------\n'
        'bloc: ${bloc.runtimeType}\n'
        'event: ${event.runtimeType}\n'
        '-------------------------------------------------------------\n');
    super.onEvent(bloc, event);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    debugPrint('-----------------onClose--------------------\n'
        'onClose -- ${bloc.runtimeType}');
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}