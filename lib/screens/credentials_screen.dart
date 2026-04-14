import 'package:flutter/material.dart';

class CredentialsScreen extends StatelessWidget {
  const CredentialsScreen({super.key});

  final List<Map<String, String>> certs = const [
    {'title': 'CISSP', 'org': 'ISC2', 'year': 'Since 2021', 'color': '0xFF4A90D9'},
    {'title': 'ISSAP', 'org': 'ISC2', 'year': 'Since 2021', 'color': '0xFF4A90D9'},
    {'title': 'CISM', 'org': 'ISACA', 'year': 'Since 2021', 'color': '0xFF7B68EE'},
    {'title': 'CRISC', 'org': 'ISACA', 'year': 'Since 2024', 'color': '0xFF7B68EE'},
    {'title': 'CCSP', 'org': 'ISC2', 'year': 'Since 2022', 'color': '0xFF4A90D9'},
    {'title': 'AWS Security', 'org': 'Amazon', 'year': 'Issued 2025', 'color': '0xFFFF9900'},
    {'title': 'Azure Cybersecurity\nArchitect', 'org': 'Microsoft', 'year': 'Since 2024', 'color': '0xFF0078D4'},
    {'title': 'Azure Security\nEngineer', 'org': 'Microsoft', 'year': 'Issued 2025', 'color': '0xFF0078D4'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0a0a0a),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color(0xFF0a0a0a),
            expandedHeight: 140,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Credentials', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF0d1f2d), Color(0xFF0a0a0a)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: const Center(
                  child: Icon(Icons.verified_user, color: Color(0xFF00d4ff), size: 60),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Verified Certifications',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    '8+ Enterprise-level security certifications',
                    style: TextStyle(color: Colors.white60, fontSize: 13),
                  ),
                  const SizedBox(height: 16),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1.2,
                    ),
                    itemCount: certs.length,
                    itemBuilder: (context, i) => _certCard(certs[i]),
                  ),
                  const SizedBox(height: 24),
                  // Frameworks
                  const Text(
                    'Frameworks & Standards',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      'CIS Controls', 'NIST CSF', 'NIST 800-53', 'ISO 27001',
                      'SOC 2 Type I & II', 'PCI-DSS', 'OWASP Top 10',
                      'NIST AI RMF', 'Zero Trust',
                    ].map((f) => _frameworkChip(f)).toList(),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _certCard(Map<String, String> cert) {
    final color = Color(int.parse(cert['color']!));
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.verified, color: color, size: 26),
          ),
          const SizedBox(height: 8),
          Text(
            cert['title']!,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          ),
          Text(cert['org']!, style: TextStyle(color: color, fontSize: 12)),
          Text(cert['year']!, style: const TextStyle(color: Colors.white54, fontSize: 11)),
        ],
      ),
    );
  }

  Widget _frameworkChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF00d4ff).withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF00d4ff).withOpacity(0.3)),
      ),
      child: Text(label, style: const TextStyle(color: Color(0xFF00d4ff), fontSize: 12)),
    );
  }
}
