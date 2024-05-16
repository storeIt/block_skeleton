import 'package:block_skeleton/feature/input_number/presentation/cubit/number_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/number_bloc.dart';

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
    print('log_tag dispatchConcrete: $inputStr');
    // BlocProvider.of<NumberBloc>(context).add(GetConcreteNumberEvent(inputStr!));
    BlocProvider.of<NumberCubit>(context).getConcreteNumber(inputStr!);
  }
}
