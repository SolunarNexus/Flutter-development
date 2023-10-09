import 'package:exercise2/model/user_details.dart';
import 'package:flutter/material.dart';

class UserDetailForm extends StatefulWidget {
  final UserDetails details;
  final ValueChanged<UserDetails> onSubmit;

  const UserDetailForm({
    super.key,
    required this.details,
    required this.onSubmit,
  });

  @override
  State<UserDetailForm> createState() => _UserDetailFormState();
}

class _UserDetailFormState extends State<UserDetailForm> {
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.details.name;
    _surnameController.text = widget.details.surname;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Details')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildClearableInput(label: 'Name', controller: _nameController),
            SizedBox(height: 20),
            _buildClearableInput(
                label: 'Surname', controller: _surnameController),
            Spacer(),
            ElevatedButton(
              onPressed: _submitForm,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('Save'),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    final details = UserDetails(
      name: _nameController.text,
      surname: _surnameController.text,
    );
    widget.onSubmit(details);
  }

  Widget _buildClearableInput({
    required String label,
    required TextEditingController controller,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(label: Text(label)),
            controller: controller,
          ),
        ),
        TextButton(
          onPressed: () => controller.text = '',
          child: Icon(Icons.close),
        )
      ],
    );
  }
}
