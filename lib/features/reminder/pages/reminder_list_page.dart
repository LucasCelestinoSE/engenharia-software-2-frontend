import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testando/features/reminder/pages/add_reminder_page.dart';
import 'package:testando/features/reminder/providers/reminder_provider.dart';

class ReminderListPage extends StatelessWidget {
  static const String routeName = '/reminders';

  const ReminderListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final reminderProvider = context.watch<ReminderProvider>();
    final bgColor = const Color(0xFFD9CFC2);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text(
          'Lembrete',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w700,
            fontSize: 26,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
        child: ListView.separated(
          itemCount: reminderProvider.reminders.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final reminder = reminderProvider.reminders[index];
            return GestureDetector(
              onLongPress: () {
                // Excluir lembrete ao segurar
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Excluir lembrete?'),
                    content: const Text('Deseja remover este lembrete?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(ctx).pop(),
                        child: const Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () {
                          reminderProvider.removeReminderAt(index);
                          Navigator.of(ctx).pop();
                        },
                        child: const Text('Excluir', style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reminder.days.join('. ') + '.',
                      style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${reminder.time} - ${reminder.name}',
                      style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddReminderPage.routeName);
        },
        backgroundColor: const Color(0xFF7DD6FF),
        child: const Icon(Icons.add, color: Colors.white, size: 32),
      ),
    );
  }
}