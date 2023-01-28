import 'package:flutter_html/html_parser.dart';
import 'package:html/dom.dart' as dom;
import 'package:url_launcher/url_launcher.dart';

abstract class HtmlRedirect {
  static onHtmlLinkTap(String? url, RenderContext renderContexct,
      Map<String, String> attributes, dom.Element? element) {
    if (url == null) {
      return;
    }
    final Uri? uri = Uri.tryParse(url);
    if (uri != null) {
      launchUrl(uri);
    }
  }

  static redirectoToUrl(String? url) {
    if (url == null) {
      return;
    }
    final Uri? uri = Uri.tryParse(url);
    if (uri != null) {
      launchUrl(uri);
    }
  }
}
