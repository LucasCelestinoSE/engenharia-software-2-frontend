import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testando/features/reminder/models/reminder_model.dart';
import 'package:testando/features/reminder/providers/reminder_provider.dart';

class AddReminderPage extends StatefulWidget {
  static const String routeName = '/add-reminder';

  const AddReminderPage({super.key});

  @override
  State<AddReminderPage> createState() => _AddReminderPageState();
}

class _AddReminderPageState extends State<AddReminderPage> {
  final _textController = TextEditingController();
  int _selectedHour = 1;
  int _selectedMinute = 2;
  final List<String> _days = ['Seg.', 'Ter.', 'Qua.', 'Qui.', 'Sex.', 'Sab.', 'Dom.'];
  final Set<int> _selectedDays = {};

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _adicionarLembrete() {
    if (_textController.text.isEmpty || _selectedDays.isEmpty) return;

    final novoLembrete = Reminder(
      name: _textController.text,
      time: "${_selectedHour.toString().padLeft(2, '0')}:${_selectedMinute.toString().padLeft(2, '0')}",
      days: _selectedDays.map((i) => _days[i].substring(0, 3).toLowerCase()).toList(),
    );

    context.read<ReminderProvider>().addReminder(novoLembrete);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            const Text(
              'Adicionar lembrete',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 60,
                  height: 100,
                  child: CupertinoPicker(
                    scrollController: FixedExtentScrollController(initialItem: _selectedHour),
                    itemExtent: 40,
                    onSelectedItemChanged: (value) => setState(() => _selectedHour = value),
                    children: List.generate(24, (i) => Center(
                      child: Text(i.toString().padLeft(2, '0'),
                        style: TextStyle(
                          fontSize: i == _selectedHour ? 32 : 22,
                          fontWeight: i == _selectedHour ? FontWeight.bold : FontWeight.normal,
                          color: Colors.black87.withOpacity(i == _selectedHour ? 1 : 0.4),
                        ),
                      ),
                    )),
                  ),
                ),
                const SizedBox(width: 24),
                SizedBox(
                  width: 60,
                  height: 100,
                  child: CupertinoPicker(
                    scrollController: FixedExtentScrollController(initialItem: _selectedMinute),
                    itemExtent: 40,
                    onSelectedItemChanged: (value) => setState(() => _selectedMinute = value),
                    children: List.generate(60, (i) => Center(
                      child: Text(i.toString().padLeft(2, '0'),
                        style: TextStyle(
                          fontSize: i == _selectedMinute ? 32 : 22,
                          fontWeight: i == _selectedMinute ? FontWeight.bold : FontWeight.normal,
                          color: Colors.black87.withOpacity(i == _selectedMinute ? 1 : 0.4),
                        ),
                      ),
                    )),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Dias da semana',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87.withOpacity(0.8),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(_days.length, (i) {
                final selected = _selectedDays.contains(i);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (selected) {
                        _selectedDays.remove(i);
                      } else {
                        _selectedDays.add(i);
                      }
                    });
                  },
                  child: Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: selected ? Colors.black87 : Colors.grey.shade400,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      _days[i],
                      style: TextStyle(
                        color: selected ? Colors.white : Colors.black87,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 18),
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade400,
                labelText: 'Nome',
                labelStyle: const TextStyle(color: Colors.black87),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _adicionarLembrete,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7DD6FF),
                  foregroundColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  elevation: 0,
                ),
                child: const Text('Cadastrar lembrete'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}