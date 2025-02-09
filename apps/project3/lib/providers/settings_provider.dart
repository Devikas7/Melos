import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsState {
  final bool pushNotifications;
  final bool backup;
  final String selectedTheme;
  final String selectedLanguage;

  SettingsState({
    this.pushNotifications = false,
    this.backup = true,
    this.selectedTheme = "Light",
    this.selectedLanguage = "English",
  });

  SettingsState copyWith({
    bool? pushNotifications,
    bool? backup,
    String? selectedTheme,
    String? selectedLanguage,
  }) {
    return SettingsState(
      pushNotifications: pushNotifications ?? this.pushNotifications,
      backup: backup ?? this.backup,
      selectedTheme: selectedTheme ?? this.selectedTheme,
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
    );
  }
}

class SettingsNotifier extends StateNotifier<SettingsState> {
  SettingsNotifier() : super(SettingsState());

  void togglePushNotifications(bool value) {
    state = state.copyWith(pushNotifications: value);
  }

  void toggleBackup(bool value) {
    state = state.copyWith(backup: value);
  }

  void changeTheme(String theme) {
    state = state.copyWith(selectedTheme: theme);
  }

  void changeLanguage(String language) {
    state = state.copyWith(selectedLanguage: language);
  }
}

final settingsProvider = StateNotifierProvider<SettingsNotifier, SettingsState>(
  (ref) => SettingsNotifier(),
);
