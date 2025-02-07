import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool pushNotifications = false;
  bool backupEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(),
            _buildSettingsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/images/profile.jpg'),
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Divyanka Tripathi",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text("📍 Mumbai, India", style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsList() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          _buildSectionTitle("Profile Settings"),
          _buildListTile("Theme", "Light"),
          _buildSwitchTile("Send push notifications", pushNotifications, (value) {
            setState(() => pushNotifications = value);
          }),
          _buildSwitchTile("Backup", backupEnabled, (value) {
            setState(() => backupEnabled = value);
          }),
          SizedBox(height: 10),
          _buildSectionTitle("Account"),
          _buildListTile("Two-factor authentication"),
          _buildListTile("Mobile data use"),
          _buildListTile("Language", "English"),
          SizedBox(height: 10),
          _buildSectionTitle("Support"),
          _buildListTile("Call us"),
          _buildListTile("Feedback"),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
    );
  }

  Widget _buildListTile(String title, [String? subtitle]) {
    return ListTile(
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle, style: TextStyle(color: Colors.grey)) : null,
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }

  Widget _buildSwitchTile(String title, bool value, Function(bool) onChanged) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
      activeColor: Colors.purple,
    );
  }
}
