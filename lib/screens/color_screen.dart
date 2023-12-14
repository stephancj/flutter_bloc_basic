import 'package:bloc_course/bloc/color_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorScreen extends StatefulWidget {
  const ColorScreen({super.key});

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<ColorBloc>().add(InitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('colors'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<ColorBloc, ColorState>(listener: (context, state) {
            print(state);
          }, builder: (context, state) {
            if (state is ColorUpdateState) {
              return Column(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    color:
                        state.initialState == true ? Colors.blue : Colors.red,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () =>
                            context.read<ColorBloc>().add(ColorToBlue()),
                        child: Container(
                          width: 50,
                          height: 30,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                          ),
                          child: const Center(child: Text('blue')),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () =>
                            context.read<ColorBloc>().add(ColorToRed()),
                        child: Container(
                          width: 50,
                          height: 30,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                          ),
                          child: const Center(child: Text('red')),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            } else {
              return Container();
            }
          }),
        ],
      ),
    );
  }
}
