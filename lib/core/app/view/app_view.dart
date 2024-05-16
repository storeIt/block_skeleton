import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/base/presentation/bloc/app_bloc/app_bloc.dart';
import '../../../feature/input_number/domain/use_case/concrete_number_use_case.dart';
import '../../../feature/input_number/domain/use_case/random_number_use_case.dart';
import '../../../feature/input_number/presentation/bloc/number_bloc.dart';
import '../../../feature/input_number/presentation/page/input_number_page_app_widget.dart';
import '../../../util/service/service_locator.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppBloc()),
        BlocProvider(
          create: (context) => NumberBloc(
            Empty(),
            concreteNumberUseCase: sl<ConcreteNumberUseCase>(),
            randomNumberUseCase: sl<RandomNumberUseCase>(),
          ),
        ),
      ],
      // child: InputNumberPage(),
      child: InputNumberPageWithAppWidget(),
    );
  }
}
