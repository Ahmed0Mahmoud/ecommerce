import 'package:flutter/material.dart';

import '../../../../auth/presentation/views/widgets/log_out_button.dart';
import 'custom_appbar.dart';

class AccountScreenBody extends StatelessWidget {
  const AccountScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(title: 'Account'),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListView(
              children: [
                _buildListTile(Icons.inventory_2_outlined, "My Orders"),
                _buildDivider(7),
                _buildListTile(Icons.person_outline, "My Details"),
                _buildDivider(1),
                _buildListTile(Icons.home_outlined, "Address Book"),
                _buildDivider(1),
                _buildListTile(Icons.help_outline, "FAQs"),
                _buildDivider(1),
                _buildListTile(Icons.headset_mic_outlined, "Help Center"),
                _buildDivider(7),
                const SizedBox(height: 50),
                LogOutButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Widget _buildListTile(IconData icon, String title) {
  return ListTile(
    leading: Icon(icon, size: 28),
    title: Text(
      title,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    ),
    trailing: const Icon(Icons.arrow_forward_ios, size: 18),
    onTap: () {
      // Handle navigation
    },
  );
}

Widget _buildDivider(double think) {
  return Divider(thickness: think, color: Colors.grey);
}
