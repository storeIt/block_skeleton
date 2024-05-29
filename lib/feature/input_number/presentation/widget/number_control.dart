import 'package:app_ui/app_ui.dart';
import 'package:block_skeleton/core/base/presentation/bloc/app_bloc/app_bloc.dart';
import 'package:block_skeleton/feature/input_number/presentation/cubit/number_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberControls extends StatefulWidget {
  const NumberControls({
    super.key,
  });

  @override
  State<NumberControls> createState() => _NumberControlsState();
}

class _NumberControlsState extends State<NumberControls> {
  String? inputStr;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter a number',
          ),
          onChanged: (value) {
            inputStr = value;
          },
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
                child: ElevatedButton(
              onPressed: () {
                dispatchConcrete();
              },
              child: Text('Search'),
            )),
            SizedBox(width: 10),
            Expanded(
                child: ElevatedButton(
              onPressed: () {},
              child: Text('Get Random Number'),
            )),
          ],
        ),
      ],
    );
  }

  void dispatchConcrete() {
    // BlocProvider.of<NumberBloc>(context).add(GetConcreteNumberEvent(inputStr!));
    // BlocProvider.of<NumberCubit>(context).getConcreteNumber(inputStr!);
    print('log_tag ${this.runtimeType} add DialogEvent');
    context.read<AppBloc>().add(
          DialogEvent(
            type: DialogType.common,
            args: DialogArgsCommon(
              title: 'Test Args title',
              message: 'Test Args, do you approve?',
            ),
          ),
        );
    BlocProvider.of<NumberCubit>(context).getConcreteNumber(inputStr!);
  }
}
