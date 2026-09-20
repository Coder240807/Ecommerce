import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Profile',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 44,
                      backgroundColor: Colors.deepPurple.shade50,
                      child: const Icon(
                        Icons.person_rounded,
                        size: 44,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Peter Parker',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              _section([
                _tile(icon: Icons.inventory_2_outlined, label: 'My Orders'),
                _tile(icon: Icons.location_on_outlined, label: 'Addresses'),
                _tile(
                  icon: Icons.credit_card_outlined,
                  label: 'Payment Methods',
                ),
              ]),
              const SizedBox(height: 16),
              _section([
                _tile(
                  icon: Icons.notifications_none_rounded,
                  label: 'Notifications',
                ),
                _tile(
                  icon: Icons.help_outline_rounded,
                  label: 'Help & Support',
                ),
              ]),
              const SizedBox(height: 16),
              _section([
                _tile(
                  icon: Icons.logout_rounded,
                  label: 'Log Out',
                  color: Colors.red,
                  showArrow: false,
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _section(List<Widget> tiles) {
  return Material(
    color: Colors.grey.shade50,
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: BorderSide(color: Colors.grey.shade200),
    ),
    child: Column(
      children: [
        for (int i = 0; i < tiles.length; i++) ...[
          tiles[i],
          if (i != tiles.length - 1)
            Divider(height: 1, indent: 66, color: Colors.grey.shade200),
        ],
      ],
    ),
  );
}

Widget _tile({
  required IconData icon,
  required String label,
  Color color = Colors.deepPurple,
  bool showArrow = true,
  VoidCallback? onTap,
}) {
  return InkWell(
    onTap: onTap ?? () {},
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withAlpha(25),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 20, color: color),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: color == Colors.red ? Colors.red : Colors.black87,
              ),
            ),
          ),
          if (showArrow)
            Icon(Icons.chevron_right_rounded, color: Colors.grey.shade400),
        ],
      ),
    ),
  );
}
