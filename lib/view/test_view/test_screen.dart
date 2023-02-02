import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'state_provider_example.dart';

final messageProvider = Provider<String>((ref) {
  return 'bismillahir rahmanir rahim';
});
final nextProvider = Provider<String>(((ref) => "Next"));
final dateFormetterProvider = Provider<DateFormat>((ref) {
  return DateFormat.MMMEd();
});

class TestScreen extends ConsumerWidget {
  const TestScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final message = ref.watch(messageProvider);
    final nextText = ref.watch(nextProvider);
    final currentDate = ref.watch(dateFormetterProvider);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(message),
              Text(currentDate.format(DateTime.now())),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const StateProviderExapmle(),
                  ));
                },
                child: Text(nextText),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// consumer
class ConsumerTest extends StatelessWidget {
  const ConsumerTest({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Consumer(
            builder: (context, ref, child) {
              final message = ref.watch(messageProvider);
              return Text(
                message,
                style: const TextStyle(color: Colors.blue),
              );
            },
          ),
        ),
      ),
    );
  }
}

// ConsumerStatefulWidget
class MyWidget extends ConsumerStatefulWidget {
  const MyWidget({super.key});

  @override
  ConsumerState<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends ConsumerState<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
