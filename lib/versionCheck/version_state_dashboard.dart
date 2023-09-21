import 'package:flutter/material.dart';
import 'package:souchi/versionCheck/version_state.dart';

class versionDashboard extends StatefulWidget {
  @override
  _versionDashboardState createState() => _versionDashboardState();
}

class _versionDashboardState extends State<versionDashboard> {
  final TextEditingController stateController = TextEditingController();
  final TextEditingController infoController = TextEditingController();

  @override
  void dispose() {
    stateController.dispose();
    infoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Change Values:'),
            TextFormField(
              controller: stateController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'State (0 or 1)'),
            ),
            TextFormField(
              controller: infoController,
              decoration: InputDecoration(labelText: 'Info'),
            ),
            ElevatedButton(
              onPressed: () async {
                int intValue = int.tryParse(stateController.text) ?? 0;
                String textValue = infoController.text;

                // Update the data in Firebase
                await AppDataController().updateData(intValue, textValue);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Data updated successfully')),
                );
              },
              child: Text('Update Data'),
            ),
          ],
        ),
      ),
    );
  }
}
