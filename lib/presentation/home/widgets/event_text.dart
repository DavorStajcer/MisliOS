import 'dart:developer';
import 'package:html/dom.dart' as dom;
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:misli_os_app/domain/models/event_model.dart';
import 'package:misli_os_app/presentation/common/text_styles.dart';
import 'package:misli_os_app/presentation/common/util/custom_html_tags.dart';
import 'package:misli_os_app/presentation/common/util/html_render_matcher.dart';
import 'package:url_launcher/url_launcher.dart';

class EventText extends StatelessWidget {
  final EventModel eventModel;
  const EventText({
    super.key,
    required this.eventModel,
  });

/*   Future<String> readTestHtml() async {
    try {
      String html = await rootBundle.loadString('files/test_html.html');
      log('read file $html');
      return html;
    } catch (e) {
      log('Error: ${e.toString()}');
      return '<p>Not able to read html test file</p>';
    }
  } */

  void _onHtmlLinkTap(String? url, RenderContext renderContexct,
      Map<String, String> attributes, dom.Element? element) {
    log('On link tap, url $url');
    if (url == null) {
      return;
    }
    final Uri? uri = Uri.tryParse(url);
    if (uri != null) {
      launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Html(
      tagsList: Html.tags..addAll(CustomHtmlTags.allCustomTags),
      data: eventModel.body,
      onLinkTap: _onHtmlLinkTap,
      style: {
        'p': Style(
          margin: Margins.zero,
        )
      },
      customRenders: {
        HtmlRenderMatcher.tagName(CustomHtmlTags.eventTitle):
            CustomRender.widget(widget: (renderContext, buildChildren) {
          bool didHappen =
              renderContext.tree.element!.attributes['didhappen'] != null;
          String text = renderContext.tree.element!.attributes['text'] ?? '';
          bool underlined =
              renderContext.tree.element!.attributes['underlined'] != null;
          bool highlight =
              renderContext.tree.element!.attributes['highlight'] != null;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyles.eventTitle.copyWith(
                  decoration: underlined ? TextDecoration.underline : null,
                  color: highlight ? Colors.lightBlue : null,
                ),
              ),
              didHappen
                  ? const Text(
                      '(Odrzano)',
                      style: TextStyles.eventTitle,
                    )
                  : const SizedBox(),
            ],
          );
        })
      },
    );
  }
}
