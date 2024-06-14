import 'package:flutter/material.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  TextEditingController initialCounterController = TextEditingController();
  int counter = 3;
  int newInitialCounter = 0;

  increaseCounterByOne() {
    setState(() {
      counter++;
    });
  }

  setCounter(int newCounter) {
    setState(() {
      counter = newCounter;
      newInitialCounter = 0;
      initialCounterController.clear();
    });
  }

  @override
  void dispose() {
    initialCounterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextField(
                  key: const Key('initial_counter_controller'),
                  controller: initialCounterController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Initial counter',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setCounter(int.tryParse(initialCounterController.text) ?? 0);
                  FocusScope.of(context).unfocus();
                },
                child: const Text('Set counter'),
              ),
              const SizedBox(height: 24),
              Column(
                children: [
                  const Text('click counter'),
                  Text(counter.toString()),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => increaseCounterByOne(),
                    child: const Text('Add 1 to counter'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
