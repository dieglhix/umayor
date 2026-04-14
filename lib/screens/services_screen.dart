import 'package:flutter/material.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  final List<Map<String, String>> services = const [
    {
      'icon': '🔍',
      'title': 'AWS Security Assessment',
      'desc': 'Comprehensive evaluation against CIS AWS Foundations Benchmark, NIST CSF, and ISO 27001 controls with actionable remediation roadmap.',
    },
    {
      'icon': '🔒',
      'title': 'Cloud Infrastructure Hardening',
      'desc': 'Implementation of CIS Benchmarks, NIST 800-53 controls, and PCI-DSS requirements across AWS services.',
    },
    {
      'icon': '⚡',
      'title': 'Lambda Security Architecture',
      'desc': 'Serverless security aligned with OWASP Top 10, secure coding practices, secrets management, and least-privilege execution roles.',
    },
    {
      'icon': '🔑',
      'title': 'AWS IAM Transformation',
      'desc': 'Zero-trust identity management following NIST Zero Trust Architecture with AWS SSO and SCPs.',
    },
    {
      'icon': '☁️',
      'title': 'Azure Security Integration',
      'desc': 'Multi-cloud security with Entra ID integration meeting NIST CSF and ISO 27001 requirements.',
    },
    {
      'icon': '🤖',
      'title': 'AI & LLM Security',
      'desc': 'Protecting AI workloads and language models following OWASP AI Security guidelines and NIST AI RMF alignment.',
    },
    {
      'icon': '📋',
      'title': 'SOC 2 Preparation',
      'desc': 'Complete SOC 2 Type I & II preparation with automated evidence collection and continuous control monitoring.',
    },
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
              title: const Text('Core Services', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF0d1f2d), Color(0xFF0a0a0a)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: const Center(
                  child: Icon(Icons.shield, color: Color(0xFF00d4ff), size: 60),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _serviceCard(services[index]),
                childCount: services.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _serviceCard(Map<String, String> service) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF00d4ff).withOpacity(0.2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF00d4ff).withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(service['icon']!, style: const TextStyle(fontSize: 24)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  service['title']!,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(height: 6),
                Text(
                  service['desc']!,
                  style: const TextStyle(color: Colors.white60, fontSize: 13, height: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
