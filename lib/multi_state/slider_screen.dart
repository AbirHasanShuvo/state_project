import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_project/multi_state/slider_provider.dart';

class SliderScreen extends ConsumerWidget {
  const SliderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final slider = ref.watch(sliderProvider);
    print('build');
    return Scaffold(

      appBar: AppBar(title: Text('Slider Page'), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(
            builder: (context, ref, child) {
              print('build eye');
              //when i used full state then it become accessible for both eye and also
              //slider so i needed to specify and select the specific variable for it

              final showPassword = ref.watch(
                sliderProvider.select((state) => state.showPassword),
              );
              return InkWell(
                onTap: () {
                  final stateProvider = ref.watch(sliderProvider.notifier);
                  stateProvider.state = stateProvider.state.copyWith(
                    showPassword: !showPassword,
                  );
                },
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: showPassword
                      ? Icon(Icons.remove_red_eye)
                      : Icon(Icons.image),
                ),
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              print('slider');

              final slider = ref.watch(
                sliderProvider.select((state) => state.slider),
              );
              return Container(
                height: 200,
                width: 200,
                color: Colors.red.withOpacity(slider),
              );
            },
          ),

          //here where where used the ref.watch we should use this in the consumer child
          Consumer(
            builder: (context, ref, child) {
              final slider = ref.watch(
                sliderProvider.select((state) => state.slider),
              );
              return Slider(
                value: slider,
                onChanged: (value) {
                  final stateProvider = ref.watch(sliderProvider.notifier);
                  stateProvider.state = stateProvider.state.copyWith(
                    slider: value,
                  );
                },
              );
            },
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
