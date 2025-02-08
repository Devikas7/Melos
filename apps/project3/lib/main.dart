import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool pushNotifications = false;
  bool backup = true;
  String selectedTheme = "Light";
  String selectedLanguage = "English";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/profile.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: Container(
                    color: Colors.black.withValues(alpha: 0.3),
                  ),
                ),
              ),
              SafeArea(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 14),
                    Text('Settings', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                    Icon(Icons.more_horiz, color: Colors.white),
                  ],
                ),
              )),
              Positioned(
                left: 10,
                right: 0,
                bottom: -50,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 48,
                        backgroundImage: AssetImage('assets/profile.jpg'), // Profile Image
                      ),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "NAGA DEVIKA MUVVA",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on, size: 12, color: Colors.grey),
                            const Text(
                              "GUNTUR, India",
                              style: TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Text("Profile Settings", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Divider(),
                ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: const Text("Theme", style: TextStyle(fontSize: 16, color: Colors.grey)),
                  trailing: DropdownButton<String>(
                    icon: Icon(Icons.keyboard_arrow_right, color: Colors.grey),
                    value: selectedTheme,
                    items: ["Light", "Dark"].map((theme) {
                      return DropdownMenuItem(value: theme, child: Text(theme));
                    }).toList(),
                    style: TextStyle( color: Colors.grey),
                    onChanged: (value) {
                      setState(() {
                        selectedTheme = value!;
                      });
                    },
                  ),
                ),
                SwitchListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: const Text("Send push notifications", style: TextStyle(fontSize: 16,color: Colors.grey)),
                  value: pushNotifications,
                  onChanged: (value) {
                    setState(() {
                      pushNotifications = value;
                    });
                  },
                ),
                SwitchListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: const Text("Backup", style: TextStyle(fontSize: 16,color: Colors.grey)),
                  value: backup,
                  activeColor: Colors.purple,
                  onChanged: (value) {
                    setState(() {
                      backup = value;
                    });
                  },
                ),
                const Text("Account", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const Divider(),
                ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: const Text("Two-factor authentication", style: TextStyle(fontSize: 16,color: Colors.grey)),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                ),
                ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: const Text("Mobile data use", style: TextStyle(fontSize: 16,color: Colors.grey)),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16,color: Colors.grey),
                ),
                ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: const Text("Language", style: TextStyle(fontSize: 16,color: Colors.grey)),
                  trailing: DropdownButton<String>(
                    icon: Icon(Icons.keyboard_arrow_right,color: Colors.grey),
                    value: selectedLanguage,
                    items: ["English", "Hindi"].map((lang) {
                      return DropdownMenuItem(value: lang, child: Text(lang));
                    }).toList(),
                    style: TextStyle(color: Colors.grey),
                    onChanged: (value) {
                      setState(() {
                        selectedLanguage = value!;
                      });
                    },
                  ),
                ),
                const Text("Support", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const Divider(),
                ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: const Text("Call us", style: TextStyle(fontSize: 16, color: Colors.grey)),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                ),
                ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: const Text("Feedback", style: TextStyle(fontSize: 16, color: Colors.grey)),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16,color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}