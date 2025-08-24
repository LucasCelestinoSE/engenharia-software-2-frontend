import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testando/features/reminder/pages/add_reminder_page.dart';
import 'package:testando/features/reminder/providers/reminder_provider.dart';

class ReminderListPage extends StatefulWidget { // Mudança aqui
  static const String routeName = '/reminders';

  const ReminderListPage({super.key});

  @override
  State<ReminderListPage> createState() => _ReminderListPageState(); // Adicione esta linha
}

class _ReminderListPageState extends State<ReminderListPage> { // Crie esta nova classe
  @override
  void initState() { // Aqui vai o initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ReminderProvider>().getReminderList(); // ou .init() se você criou esse método
    });
  }

  @override
  Widget build(BuildContext context) { // Mova todo o código do build para cá
    final reminderProvider = context.watch<ReminderProvider>();
    final bgColor = const Color(0xFFDFD9CB);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
        child: Consumer<ReminderProvider>(
          builder: (context, reminderProvider, child) {
            if (reminderProvider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (reminderProvider.reminders.isEmpty) {
              return const Center(
                child: Text(
                  'Nenhum lembrete cadastrado.',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              );
            } else {
              return ListView.separated(
                itemCount: reminderProvider.reminders.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final reminder = reminderProvider.reminders[index];
                  return GestureDetector(
                    // resto do código do item...
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
              );
            }
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