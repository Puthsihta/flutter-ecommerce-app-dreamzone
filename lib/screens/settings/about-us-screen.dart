import 'package:dreamzone/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../constants/constants.dart';

class AboutUsScreen extends StatelessWidget {
  static const routeName = "/profile/aboutus";
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteSmoke,
      appBar: AppBar(
        backgroundColor: baseColor,
        title: const Text("About Us"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: marginAll,
          child: const HtmlWidget(
            "<p>Dear All,</p>\r\n<p>I'm thrilled to introduce you to Dream Zone &ndash; your ultimate tool for financial empowerment.</p>\r\n<p>Dream Zone is more than just an app; it's a pathway to financial freedom. With features designed to help you earn smarter and save better, Dream Zone is your partner in achieving your financial goals.</p>\r\n<p>Here's what Dream Zone offers:</p>\r\n<ol>\r\n<li>\r\n<p><strong>Income Opportunities:</strong> Explore various ways to earn money, from freelancing to investment insights.</p>\r\n</li>\r\n<li>\r\n<p><strong>Smart Saving Tools:</strong> Learn how to save and invest wisely with personalized strategies and budgeting tips.</p>\r\n</li>\r\n<li>\r\n<p><strong>Community Support:</strong> Join a supportive community of individuals on the same journey toward financial success.</p>\r\n</li>\r\n<li>\r\n<p><strong>Continuous Learning:</strong> Access educational resources to enhance your financial knowledge and skills.</p>\r\n</li>\r\n</ol>\r\n<p>Join us on Dream Zone today and start building the future you deserve.</p>\r\n<p>Best regards,</p>\r\n<p>PISETH KEO&nbsp;</p>\r\n<p>&nbsp;Founder, Dream Zone</p>\r\n<p>&nbsp;</p>",
          ),
        ),
      ),
    );
  }
}
