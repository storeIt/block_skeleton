import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/base/presentation/bloc/app_bloc/app_bloc.dart';
import '../../../../core/base/presentation/bloc/base_bloc/base_bloc.dart';
import '../../../../core/base/presentation/view/app_widget.dart';
import '../../../../util/service/service_locator.dart';
import '../../data/datasource/local/number_local_data.dart';
import '../../data/datasource/remote/number_remote_data.dart';
import '../../data/repository/number_repository.dart';
import '../../domain/entity/number_ent.dart';
import '../../domain/use_case/concrete_number_use_case.dart';
import '../../domain/use_case/random_number_use_case.dart';
import '../cubit/number_cubit.dart';
import '../widget/message_display.dart';
import '../widget/number_control.dart';

class InputNumberPageWithAppWidget extends StatelessWidget {
  InputNumberPageWithAppWidget({super.key});

  late final SharedPreferences _shPrefs;
  late final NumberRemoteData _numberRemoteData;
  late final NumberLocalData _numberLocalData;
  late final NumberRepository _numberRepo;
  late final ConcreteNumberUseCase _concreteNumberUseCase;
  late final RandomNumberUseCase _randomNumberUseCase;

  void _init() async {
    _shPrefs = await SharedPreferences.getInstance();
    _numberRemoteData = NumberRemoteData(client: http.Client());
    _numberLocalData = NumberLocalData(sharedPreferences: _shPrefs);
    _numberRepo = NumberRepository(
      remoteDataSource: _numberRemoteData,
      localDataSource: _numberLocalData,
    );
    _concreteNumberUseCase = ConcreteNumberUseCase(_numberRepo);
    _randomNumberUseCase = RandomNumberUseCase(_numberRepo);
  }

  @override
  Widget build(BuildContext context) {
    _init();
    return Scaffold(
      appBar: AppBar(title: Text('Input number')),
      body: AppWidget(
        childWidget: _buildBody(context),
      ),
    );
  }

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
            BlocBuilder<NumberCubit, BaseState>(builder: (context, state) {
              print('log_tag state: $state');
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
            }),
            SizedBox(height: 20),
            NumberControls(),
          ],
        ),
      ),
    );
  }
}
