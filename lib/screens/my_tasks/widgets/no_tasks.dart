import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/tab_manager.dart';

class NoTasks extends StatelessWidget {
  const NoTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      // 2
      child: Center(
        // 3
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.asset('assets/images/no_tasks.jpg'),
              ),
            ),
            Text(
              'No Tasks!',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Activate a course and start doing your daily tasks.',
              textAlign: TextAlign.center,
            ),
            MaterialButton(
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: Colors.teal,
              onPressed: () {
                Provider.of<TabManager>(context, listen: false).goToCourses();
              },
              child: const Text('Activate Course'),
            ),

          ],
        ),
      ),
    );
  }
}
