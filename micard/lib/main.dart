import 'package:flutter/material.dart';

void main() {
  runApp(const MiCardApp());
}

class MiCardApp extends StatelessWidget {
  const MiCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MiCard - Lê Mẫn',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF087E78),
        ),
      ),
      home: const MiCardPage(),
    );
  }
}

class MiCardPage extends StatelessWidget {
  const MiCardPage({super.key});

  static const Color _deepTeal = Color(0xFF075E59);
  static const Color _teal = Color(0xFF087E78);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F6F5),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x1A164B47),
                      blurRadius: 32,
                      offset: Offset(0, 16),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildProfileHeader(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 25, 24, 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'THÔNG TIN LIÊN HỆ',
                            style: TextStyle(
                              color: Color(0xFF71817F),
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.5,
                            ),
                          ),
                          const SizedBox(height: 14),
                          const _ContactTile(
                            icon: Icons.phone_rounded,
                            label: 'SỐ ĐIỆN THOẠI',
                            value: '0123456789',
                          ),
                          const SizedBox(height: 12),
                          const _ContactTile(
                            icon: Icons.alternate_email_rounded,
                            label: 'EMAIL',
                            value: 'manlv.23it@vku.udn.vn',
                          ),
                          const SizedBox(height: 22),
                          const Divider(height: 1, color: Color(0xFFE7EEEC)),
                          const SizedBox(height: 18),
                          const Center(
                            child: Text(
                              'Rất vui được kết nối cùng bạn',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF71817F),
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 28),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [_deepTeal, _teal],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white.withValues(alpha: 0.75)),
            ),
            child: const CircleAvatar(
              radius: 57,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('images/cat_avatar.jpg'),
            ),
          ),
          const SizedBox(height: 19),
          const Text(
            'Lê Mẫn',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            'MY DIGITAL CARD',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.78),
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 2.2,
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactTile extends StatelessWidget {
  const _ContactTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F9F8),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE8F0EE)),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFFE2F2EF),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: const Color(0xFF087E78), size: 21),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Color(0xFF71817F),
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.1,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    color: Color(0xFF193B38),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
