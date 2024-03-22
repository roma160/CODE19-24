import 'package:flutter/material.dart';

class DataFilter extends StatefulWidget {
  const DataFilter({super.key});

  @override
  State<DataFilter> createState() => _DataFilterState();
}

class _DataFilterState extends State<DataFilter> {
  DateTime? _startDate;
  DateTime? _lastDate;

  void _setStart() async {
    final data = await showDateRangePicker(
        builder: (context, child) {
          return Theme(
            // Define custom text styles for date picker elements
            data: ThemeData(
              textTheme: const TextTheme(
                headlineMedium: TextStyle(
                    color: Colors.red), // Example: change header text color
                labelSmall: TextStyle(
                    color: Colors.blue), // Example: change body text color
              ),
            ),
            child: Placeholder(),
          );
        },
        barrierColor: const Color.fromARGB(255, 50, 39, 5),
        context: context,
        firstDate: DateTime(2023),
        lastDate: DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    // return Column(
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     Text(
    //       "Choose your date",
    //       style: Theme.of(context).textTheme.bodyLarge,
    //     ),
    //     const SizedBox(
    //       height: 30,
    //     ),
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
    //       children: [
    //         ElevatedButton.icon(
    //           icon: const Icon(Icons.calendar_month),
    //           label: const Text("First date"),
    //           onPressed: _setStart,
    //         ),
    //         ElevatedButton.icon(
    //           icon: const Icon(Icons.calendar_month),
    //           label: const Text("Last date"),
    //           onPressed: () {},
    //         ),
    //       ],
    //     )
    //   ],
    // );
    return DateRangePickerDialog(
        initialEntryMode: DatePickerEntryMode.calendar,
        firstDate: DateTime(now.year - 1, now.month, now.day),
        lastDate: DateTime.now());
  }
}
