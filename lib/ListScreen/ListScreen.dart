import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reminder/Home/userReminderModel.dart';
import 'package:reminder/User/authContoller.dart';
import 'package:reminder/utils/Loder.dart';

class ListScreen extends ConsumerStatefulWidget {
  final String reminderUser;

  ListScreen({required this.reminderUser, super.key});
  @override
  ConsumerState<ListScreen> createState() {
    return _ListScreen();
  }
}

class _ListScreen extends ConsumerState<ListScreen> {
  void deleteReminder({required String reminderUId}) async {
    await ref
        .watch(authContoller.notifier)
        .getDeletedReminder(context: context, reminderUId: reminderUId);
  }

  @override
  Widget build(BuildContext context) {
    print(widget.reminderUser);
    return Scaffold(
      appBar: AppBar(
        title: Text("Reminders"),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: ref.watch(authContoller.notifier).getListRE(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoderScreen();
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              UserReminderModel listREminderr = snapshot.data![index];
              return ListTile(
                title: Text(listREminderr.title),
                subtitle: Text(listREminderr.ReminderText),
                trailing: IconButton(
                    onPressed: () =>
                        deleteReminder(reminderUId: widget.reminderUser),
                    icon: Icon(Icons.delete)),
              );
            },
          );
        },
      ),
    );
  }
}
