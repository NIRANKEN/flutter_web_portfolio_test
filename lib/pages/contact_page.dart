import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_test/components/page_title.dart';
import 'package:flutter_web_portfolio_test/main_container.dart';
import 'package:flutter_web_portfolio_test/utils/display_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainContainer(
        color: Colors.white,
        child: Column(
          children: [
            PageTitle(
                title: "Contact", color: Theme.of(context).colorScheme.primary),
            Container(
              margin: const EdgeInsets.all(32.0),
              child: GestureDetector(
                onTap: () {
                  _launchUrl(Uri(
                      scheme: 'https', host: 'misskey.io', path: '@niranken'));
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset("assets/images/misskey.png",
                        width: DisplayUtils.isLargeSize(context)
                            ? 256
                            : DisplayUtils.isMediumSize(context)
                                ? 196
                                : MediaQuery.of(context).size.width * 0.25,
                        height: DisplayUtils.isLargeSize(context)
                            ? 256
                            : DisplayUtils.isMediumSize(context)
                                ? 196
                                : MediaQuery.of(context).size.width * 0.25,
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  void _launchUrl(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not launch $url');
    }
  }
}
