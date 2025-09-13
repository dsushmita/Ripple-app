import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool _reminderEnabled = true;
  String _reminderMode = 'Static';
  String _repeat = 'Everyday';
  String _soundEffect = 'Droplet';
  String _smartSkip = '10 Mins';
  bool _stopWhen100 = true;

  // Time slots
  final Map<String, bool> _timeSlots = {
    '00:00 AM': false,
    '02:00 AM': false,
    '04:00 AM': true,
    '06:00 AM': true,
    '08:00 AM': true,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Reminder Toggle
            _buildToggleItem('Reminder', _reminderEnabled, (value) {
              setState(() {
                _reminderEnabled = value;
              });
            }),
            
            const SizedBox(height: 16),
            
            // Reminder Mode
            _buildSelectionItem('Reminder Mode', _reminderMode, ['Static', 'Dynamic', 'Smart'], (value) {
              setState(() {
                _reminderMode = value;
              });
            }),
            
            const SizedBox(height: 16),
            
            // Repeat
            _buildSelectionItem('Repeat', _repeat, ['Everyday', 'Weekdays', 'Weekend', 'Custom'], (value) {
              setState(() {
                _repeat = value;
              });
            }),
            
            const SizedBox(height: 16),
            
            // Sound Effect
            _buildSelectionItem('Sound Effect', _soundEffect, ['Droplet', 'Bell', 'Chime', 'None'], (value) {
              setState(() {
                _soundEffect = value;
              });
            }),
            
            const SizedBox(height: 16),
            
            // Smart Skip
            _buildSelectionItem('Smart Skip', _smartSkip, ['5 Mins', '10 Mins', '15 Mins', '30 Mins'], (value) {
              setState(() {
                _smartSkip = value;
              });
            }),
            
            const SizedBox(height: 16),
            
            // Reminder Message
            _buildTextItem('Reminder Message', 'Time to hydrate! 💧'),
            
            const SizedBox(height: 16),
            
            // Stop when 100%
            _buildToggleItem('Stop when 100%', _stopWhen100, (value) {
              setState(() {
                _stopWhen100 = value;
              });
            }),
            
            const SizedBox(height: 24),
            
            // Reminder Time Section
            _buildReminderTimeSection(),
            
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleItem(String title, bool value, Function(bool) onChanged) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildSelectionItem(String title, String currentValue, List<String> options, Function(String) onChanged) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              currentValue,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.textSecondary,
            ),
          ],
        ),
        onTap: () {
          _showSelectionDialog(title, currentValue, options, onChanged);
        },
      ),
    );
  }

  Widget _buildTextItem(String title, String value) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: AppColors.textSecondary,
        ),
        onTap: () {
          _showMessageDialog();
        },
      ),
    );
  }

  Widget _buildReminderTimeSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Reminder Time',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add, color: AppColors.primary),
                onPressed: _addNewTimeSlot,
              ),
            ],
          ),
          const SizedBox(height: 16),
          ..._timeSlots.entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    entry.key,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Switch(
                    value: entry.value,
                    onChanged: (value) {
                      setState(() {
                        _timeSlots[entry.key] = value;
                      });
                    },
                    activeColor: AppColors.primary,
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  void _showSelectionDialog(String title, String currentValue, List<String> options, Function(String) onChanged) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: options.map((option) {
            return ListTile(
              title: Text(option),
              leading: Radio<String>(
                value: option,
                groupValue: currentValue,
                onChanged: (value) {
                  onChanged(value!);
                  Navigator.pop(context);
                },
                activeColor: AppColors.primary,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  void _showMessageDialog() {
    final TextEditingController controller = TextEditingController(text: 'Time to hydrate! 💧');
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reminder Message'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Enter your reminder message',
            border: OutlineInputBorder(),
          ),
          maxLines: 3,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Save message
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Message updated!')),
              );
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _addNewTimeSlot() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((time) {
      if (time != null) {
        final String timeString = time.format(context);
        setState(() {
          _timeSlots[timeString] = true;
        });
      }
    });
  }
}