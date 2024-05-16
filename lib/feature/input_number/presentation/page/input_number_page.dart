import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/base/presentation/bloc/app_bloc/app_bloc.dart';
import '../../../../core/base/presentation/bloc/base_bloc/base_bloc.dart';
import '../../../../core/base/presentation/view/base_ui_state.dart';
import '../../../../util/service/service_locator.dart';
import '../../domain/entity/number_ent.dart';
import '../../domain/use_case/concrete_number_use_case.dart';
import '../../domain/use_case/random_number_use_case.dart';
import '../cubit/number_cubit.dart';
import '../widget/message_display.dart';
import '../widget/number_control.dart';

/**
 * Flutter UI Widget should only display data and dispatch events.
 */
class InputNumberPage extends StatelessWidget {
  const InputNumberPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _InputNumberPage();
  }
}

class _InputNumberPage extends StatefulWidget {
  const _InputNumberPage({super.key});

  @override
  State<_InputNumberPage> createState() => _InputNumberPageState();
}

class _InputNumberPageState extends BaseUiState<_InputNumberPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Input number')),
      body: _buildBody(context),
    );
  }

  // Widget _buildBody(BuildContext context) {
  //   return BlocProvider(
  //     create: (context) => NumberBloc(
  //       Empty(),
  //       concreteNumberUseCase: sl<ConcreteNumberUseCase>(),
  //       randomNumberUseCase: sl<RandomNumberUseCase>(),
  //     ),
  //     child: Padding(
  //       padding: const EdgeInsets.all(10.0),
  //       child: Column(
  //         children: [
  //           SizedBox(height: 10),
  //           BlocBuilder<NumberBloc, BaseState>(
  //             builder: (context, state) {
  //               print('log_tag state: $state');
  //               String? message;
  //               switch (state) {
  //                 case Loading():
  //                   message = 'Loading...';
  //                 case Loaded():
  //                   print('log_tag LoadedState');
  //                   message = (state.data as NumberEntity).text;
  //                   break;
  //                 case FailureState():
  //                   message = state.message;
  //                   break;
  //                 default:
  //                   message = 'Start searching';
  //               }
  //               return MessageDisplay(message: message!);
  //             },
  //           ),
  //           SizedBox(height: 20),
  //           NumberControls(),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _buildBody(BuildContext context) {
    return BlocProvider(
      create: (context) => NumberCubit(
        concreteNumberUseCase: sl<ConcreteNumberUseCase>(),
        randomNumberUseCase: sl<RandomNumberUseCase>(),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            BlocConsumer<NumberCubit, BaseState>(
              builder: (context, state) {
                String? message;
                switch (state) {
                  case Loading():
                    message = 'Loading...';
                  case Loaded():
                    print('log_tag LoadedState');
                    message = (state.data as NumberEntity).text;
                    break;
                  case FailureState():
                    message = state.message;
                    break;
                  default:
                    message = 'Start searching';
                }
                return MessageDisplay(message: message);
              },
              listener: (BuildContext context, BaseState state) {
                if (state.isLoading) {
                  showProgressIndicatorIfNotShowing();
                } else {
                  hideProgressIndicator();
                }
              },
            ),
            SizedBox(height: 20),
            NumberControls(),
          ],
        ),
      ),
    );
  }

  @override
  String get tag => 'log_tag';
}
