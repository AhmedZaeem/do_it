import 'package:do_it/views/tasks_list_view/tasks_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h),
        child: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.primary,
          onPressed: () {},
          child: Icon(
            Icons.article_outlined,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 145.h),
            Row(
              children: <Widget>[
                Text('Task List',
                    style: Theme.of(context).textTheme.displayLarge),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.sunny,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border,
                    )),
              ],
            ),
            SizedBox(height: 20.h),
            TasksList(),
          ],
        ),
      ),
    );
  }
}
