import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:misli_os_app/domain/models/event_model.dart';
import 'package:misli_os_app/presentation/common/util/custom_html_tags.dart';
import 'package:misli_os_app/presentation/common/util/html_redirect.dart';
import 'package:misli_os_app/presentation/common/util/html_render_matcher.dart';
import 'package:misli_os_app/presentation/common/values/app_colors.dart';
import 'package:misli_os_app/presentation/common/values/app_fonts.dart';
import 'package:misli_os_app/presentation/common/values/app_html_styles.dart';
import 'package:misli_os_app/presentation/common/values/app_strings.dart';
import 'package:misli_os_app/presentation/common/values/app_text_styles.dart';

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

  @override
  Widget build(BuildContext context) {
    return Html(
      tagsList: Html.tags..addAll(CustomHtmlTags.allCustomTags),
      data: eventModel.body,
      onLinkTap: HtmlRedirect.onHtmlLinkTap,
      style: AppHtmlStyles.mainStyle,
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
                style: AppTextStyles.eventTitle.copyWith(
                  decoration: underlined ? TextDecoration.underline : null,
                  color: highlight ? AppColors.ternary : null,
                ),
              ),
              didHappen
                  ? const Text(
                      AppStrings.odrzano,
                      style: AppTextStyles.eventTitle,
                    )
                  : const SizedBox(),
            ],
          );
        })
      },
    );
  }
}
