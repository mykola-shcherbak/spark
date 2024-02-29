import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spark_test/bloc/tasks_list_cubit.dart';
import 'package:spark_test/constants/color_constants.dart';
import 'package:spark_test/constants/text_constants.dart';
import 'package:spark_test/screens/result_screen.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:spark_test/widgets.dart/custom_app_bar.dart';
import 'package:spark_test/widgets.dart/custom_button.dart';

class ProcessScreen extends StatelessWidget {
  const ProcessScreen({super.key});

  static String path = '/process_screen';
  static String route = 'process_screen';

  @override
  Widget build(BuildContext context) {
    void onPressed() {
      context.read<TasksListCubit>().postSolution(context);
    }

    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, TextConstants.processScreen, context.pop),
        body: BlocBuilder<TasksListCubit, TasksListState>(
          builder: (context, state) {
            final double percent = state.loadingProcess;
            final percentText = '${percent * 100} %';

            return Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CircularPercentIndicator(
                      radius: 130.0,
                      animation: true,
                      animationDuration: 1200,
                      lineWidth: 15.0,
                      percent: percent,
                      progressColor: ColorConstants.accentColor,
                      header: Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 80,
                              child: Text(
                                percent == 1
                                    ? TextConstants.calculationsFinised
                                    : '',
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Text(
                              percentText,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  customButton(TextConstants.sendResult,
                      state.isLoading ? null : onPressed)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
