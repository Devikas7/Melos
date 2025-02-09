import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/settings_provider.dart';

class SettingsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final settingsNotifier = ref.read(settingsProvider.notifier);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(screenHeight, screenWidth),
            SizedBox(height: screenHeight * 0.06), // Adjust spacing dynamically
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle("Profile Settings"),
                    _buildDropdown(
                      title: "Theme",
                      value: settings.selectedTheme,
                      options: ["Light", "Dark"],
                      onChanged: settingsNotifier.changeTheme,
                    ),
                    _buildSwitch(
                      title: "Send push notifications",
                      value: settings.pushNotifications,
                      onChanged: settingsNotifier.togglePushNotifications,
                    ),
                    _buildSwitch(
                      title: "Backup",
                      value: settings.backup,
                      onChanged: settingsNotifier.toggleBackup,
                    ),
                    _buildSectionTitle("Account"),
                    _buildListTile("Two-factor authentication"),
                    _buildListTile("Mobile data use"),
                    _buildDropdown(
                      title: "Language",
                      value: settings.selectedLanguage,
                      options: ["English", "Hindi"],
                      onChanged: settingsNotifier.changeLanguage,
                    ),
                    _buildSectionTitle("Support"),
                    _buildListTile("Call us"),
                    _buildListTile("Feedback"),
                    SizedBox(height: screenHeight * 0.05), // Add extra space at bottom
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(double screenHeight, double screenWidth) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: screenHeight * 0.3,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/profile.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(color: Colors.black.withOpacity(0.3)),
          ),
        ),
        Positioned(
          top: screenHeight * 0.02,
          left: screenWidth * 0.05,
          right: screenWidth * 0.05,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 18),
              Text('Settings', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
              Icon(Icons.more_horiz, color: Colors.white),
            ],
          ),
        ),
        Positioned(
          left: screenWidth * 0.05,
          bottom: -screenHeight * 0.06,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CircleAvatar(
                radius: screenWidth * 0.13,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: screenWidth * 0.12,
                  backgroundImage: AssetImage('assets/profile.jpg'),
                ),
              ),
              SizedBox(width: screenWidth * 0.03),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "NAGA DEVIKA MUVVA",
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: screenWidth * 0.04, color: Colors.grey),
                      Text(
                        "GUNTUR, India",
                        style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const Divider(),
      ],
    );
  }

  Widget _buildListTile(String title) {
    return ListTile(
      dense: true,
      title: Text(title, style: const TextStyle(fontSize: 16, color: Colors.grey)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
    );
  }

  Widget _buildDropdown({
    required String title,
    required String value,
    required List<String> options,
    required Function(String) onChanged,
  }) {
    return ListTile(
      dense: true,
      title: Text(title, style: const TextStyle(fontSize: 16, color: Colors.grey)),
      trailing: DropdownButton<String>(
        icon: const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
        value: value,
        items: options.map((option) {
          return DropdownMenuItem(value: option, child: Text(option));
        }).toList(),
        style: const TextStyle(color: Colors.grey),
        onChanged: (value) => onChanged(value!),
      ),
    );
  }

  Widget _buildSwitch({
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return SwitchListTile(
      dense: true,
      title: Text(title, style: const TextStyle(fontSize: 16, color: Colors.grey)),
      value: value,
      onChanged: onChanged,
    );
  }
}
