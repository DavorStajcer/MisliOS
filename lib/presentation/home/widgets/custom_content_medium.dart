import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:misli_os_app/presentation/common/util/custom_html_tags.dart';
import 'package:misli_os_app/presentation/common/util/html_redirect.dart';
import 'package:misli_os_app/presentation/common/util/html_render_matcher.dart';
import 'package:misli_os_app/presentation/common/values/app_colors.dart';
import 'package:misli_os_app/presentation/common/values/app_html_styles.dart';
import 'package:misli_os_app/presentation/common/values/app_text_styles.dart';
import 'package:misli_os_app/presentation/home/widgets/go_to_top.dart';

class CustomContentMedium extends StatelessWidget {
  final String body;

  const CustomContentMedium(
    this.body, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          const Expanded(
            child: SizedBox(),
          ),
          Expanded(
            flex: 4,
            child: Html(
              data: body,
              onLinkTap: HtmlRedirect.onHtmlLinkTap,
              tagsList: Html.tags..addAll(CustomHtmlTags.allCustomTags),
              style: AppHtmlStyles.mainStyle,
              customRenders: {
                HtmlRenderMatcher.tagName(CustomHtmlTags.middle):
                    CustomRender.widget(widget: (renderContext, buildChildren) {
                  String text =
                      renderContext.tree.element!.attributes['text'] ?? '';
                  bool underlined =
                      renderContext.tree.element!.attributes['underlined'] !=
                          null;
                  bool highlight =
                      renderContext.tree.element!.attributes['highlight'] !=
                          null;

                  return Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      text,
                      style: AppTextStyles.eventTitle.copyWith(
                        decoration:
                            underlined ? TextDecoration.underline : null,
                        color: highlight ? AppColors.ternary : null,
                      ),
                    ),
                  );
                }),
                HtmlRenderMatcher.tagName(CustomHtmlTags.customImage):
                    CustomRender.widget(widget: (renderContext, buildChildren) {
                  String? imageUrl =
                      renderContext.tree.element?.attributes['imageurl'];
                  return imageUrl != null
                      ? Container(
                          width: double.infinity,
                          height: 350,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(24)),
                            image: DecorationImage(
                              image: NetworkImage(
                                imageUrl,
                              ),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        )
                      : const SizedBox();
                }),
              },
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
