import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TermsAndConditionsPage(),
    );
  }
}

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terms & Conditions"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Implement back navigation
          },
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Terms & Conditions",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Please read the following Notices and Terms & Conditions carefully. Foodiee Pakistan (Foodiee) maintains this website www.foodiee.com.pk for your information, education, enjoyment and use. Please feel free to browse the website. By accessing and browsing the website, you agree to accept, without limitation or qualification, the Privacy Policy and the Legal Notices, Anti-Spam Notice and Website Terms and Conditions stated below.",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            SizedBox(height: 16),
            SectionTitle("Age"),
            SizedBox(height: 8),
            Text(
              "If you are under 13 years of age, you should always have the express consent of a parent or legal guardian before using the internet including this website.",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            SizedBox(height: 16),
            SectionTitle("Legal Notices"),
            SizedBox(height: 8),
            Text(
              "If you are browsing this website as a non-commercial consumer, you may access material displayed on the website for your non-commercial, personal use only and subject to the Website Terms and Conditions stated below.",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            SizedBox(height: 8),
            Text(
              "If you are browsing this website as an employee/agent/member of any business or organization, you may access or download material displayed on the website only in accordance with the Website Terms and Conditions stated below. This permission is specifically conditioned on you maintaining all copyright, trademark and other proprietary notices contained on the materials and keeping all such material intact and in the same form as presented on the website. Additionally, you may not:",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            SizedBox(height: 16),
            SectionTitle("Anti-Spam Notice"),
            SizedBox(height: 8),
            Text(
              "Publication of electronic addresses on the website is for the purpose of professional communication only and must not be used to infer consent to the receipt of unsolicited commercial electronic messages.",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}
