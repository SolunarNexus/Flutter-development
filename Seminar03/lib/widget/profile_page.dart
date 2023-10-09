import 'package:exercise2/widget/avatar.dart';
import 'package:exercise2/model/user.dart';
import 'package:exercise2/widget/settings_card.dart';
import 'package:exercise2/widget/user_detail_display.dart';
import 'package:exercise2/widget/user_detail_form.dart';
import 'package:flutter/material.dart';

const _horizontal_padding = 12.0;
const _vertical_padding = 8.0;

const _settings_item_size = 32.0;
const _large_font_size = 25.0;
const _standard_font_size = 17.0;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var _user = User.default_user;
  var _editingName = true;

  double get _uiFontSize {
    return _user.largeFont ? _large_font_size : _standard_font_size;
  }

  @override
  Widget build(BuildContext context) {
    if (_editingName) {
      return UserDetailForm(
          details: _user.details,
          onSubmit: (newDetails) => setState(() {
                _user = _user.copyWith(details: newDetails);
                _editingName = false;
              }));
    }
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Profile')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: _horizontal_padding,
            vertical: _vertical_padding,
          ),
          child: Column(
            children: [
              _buildUserDetailSection(),
              _buildSwitchSettingsCard(
                label: 'Notifications',
                toggled: _user.notifications,
                onChange: (value) =>
                    _user = _user.copyWith(notifications: value),
              ),
              _buildSwitchSettingsCard(
                label: 'Newsletter',
                toggled: _user.newsletter,
                onChange: (value) => _user = _user.copyWith(newsletter: value),
              ),
              _buildSwitchSettingsCard(
                label: 'Large font',
                toggled: _user.largeFont,
                onChange: (value) => _user = _user.copyWith(largeFont: value),
              ),
              SettingsCard(
                label: 'Username',
                child: Text(
                  _user.username,
                  style: TextStyle(fontSize: _uiFontSize),
                ),
                fontSize: _uiFontSize,
              ),
              SettingsCard(
                label: 'Favorite color',
                fontSize: _uiFontSize,
                child: Container(
                  width: _settings_item_size,
                  height: _settings_item_size,
                  color: _user.favorite_color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchSettingsCard({
    required String label,
    required bool toggled,
    required ValueChanged<bool> onChange,
  }) {
    return SettingsCard(
      label: label,
      child: Switch(
          value: toggled,
          onChanged: (value) => setState(() => onChange(value))),
      fontSize: _uiFontSize,
    );
  }

  Row _buildUserDetailSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Avatar(user: _user),
        UserDetailDisplay(
          details: _user.details,
          uiFontSize: _uiFontSize,
          onEditPressed: () => setState(() => _editingName = true),
        ),
      ],
    );
  }
}
