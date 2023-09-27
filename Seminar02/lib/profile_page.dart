import 'package:exercise2/avatar.dart';
import 'package:exercise2/user.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final User currentUser;

  const ProfilePage({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              _buildUserInfoRow(),
              _buildUserSettingsList(),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildUserSettingsList() {
    return Column(
      children: [
        _buildProfileSettingContainer(
            settingName: 'Notifications',
            feature: Switch(value: true, onChanged: (bool) {})),
        _buildProfileSettingContainer(
            settingName: 'Newsletter',
            feature: Switch(value: false, onChanged: (bool) {})),
        _buildProfileSettingContainer(
            settingName: 'Large font',
            feature: Switch(value: false, onChanged: (bool) {})),
        _buildProfileSettingContainer(
            settingName: 'Username',
            feature: Text(
              currentUser.username,
              style: TextStyle(fontSize: 17),
            )),
        _buildProfileSettingContainer(
            settingName: 'Favourite color',
            feature: Container(
                width: 40.0, height: 40.0, color: currentUser.favorite_color)),
      ],
    );
  }

  Row _buildUserInfoRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildAvatar(),
        _buildUserInfo(),
      ],
    );
  }

  Padding _buildUserInfo() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildUserNameRow(text: 'Name: ', value: currentUser.name),
          _buildUserNameRow(text: 'Surname: ', value: currentUser.surname),
        ],
      ),
    );
  }

  Padding _buildAvatar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Avatar(user: currentUser),
        ],
      ),
    );
  }

  Padding _buildProfileSettingContainer(
      {required settingName, required StatelessWidget feature}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      child: Container(
        height: 70,
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        color: Colors.blue[100],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              settingName,
              style: TextStyle(fontSize: 17),
            ),
            feature,
          ],
        ),
      ),
    );
  }

  Row _buildUserNameRow({required text, required value}) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(color: Colors.grey),
        ),
        Text(
          value,
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
