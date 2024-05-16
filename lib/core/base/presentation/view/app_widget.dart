import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/app_bloc/app_bloc.dart';
import '../bloc/base_bloc/base_bloc.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(),
      child: BlocConsumer<AppBloc, BaseState>(
        listener: (BuildContext context, BaseState state) {
          if (state.isLoading) {
            // showProgressIndicatorIfNotShowing();
          } else {
            // hideProgressIndicator();
          }
        },
        builder: (context, state) {
          print('log_tag state: $state');
          return _manageAppState(state);
        },
      ),
    );
  }

  Widget _manageAppState(BaseState state) => switch (state) {
        Loading _ => CircularProgressIndicator(),
        FailureState _ => Text('Error'),
        Loaded _ => Text('Loaded'),
        Empty _ => Text('Empty'),
        _ => Container(),
      };
}
