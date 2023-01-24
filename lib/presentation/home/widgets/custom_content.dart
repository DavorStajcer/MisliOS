import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:misli_os_app/presentation/common/util/custom_html_tags.dart';
import 'package:misli_os_app/presentation/common/util/html_render_matcher.dart';
import 'package:misli_os_app/presentation/common/values/text_styles.dart';
import 'package:misli_os_app/presentation/home/widgets/go_to_top.dart';

class CustomContent extends StatelessWidget {
  final String body;
  const CustomContent(
    this.body, {
    super.key,
  });

  /*  Future<String> readTestHtml() async {
    try {
      String html = await rootBundle.loadString('files/test_html.html');
      log('read file $html');
      return html;
    } catch (e) {
      log('Error: ${e.toString()}');
      return '<p>Not able to read html test file</p>';
    }
  }
 */
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
          child: Html(
            data: body,
            tagsList: Html.tags..addAll(CustomHtmlTags.allCustomTags),
            customRenders: {
              HtmlRenderMatcher.tagName(CustomHtmlTags.middle):
                  CustomRender.widget(widget: (renderContext, buildChildren) {
                log('middle: Rendering middle tag');
                String text =
                    renderContext.tree.element!.attributes['text'] ?? '';
                bool underlined =
                    renderContext.tree.element!.attributes['underlined'] !=
                        null;
                bool highlight =
                    renderContext.tree.element!.attributes['highlight'] != null;

                return Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    text,
                    style: TextStyles.eventTitle.copyWith(
                      decoration: underlined ? TextDecoration.underline : null,
                      color: highlight ? Colors.lightBlue : null,
                    ),
                  ),
                );
              }),
              HtmlRenderMatcher.tagName(CustomHtmlTags.customImage):
                  CustomRender.widget(widget: (renderContext, buildChildren) {
                log('custom_image: rendering custom image');

                String? imageUrl =
                    renderContext.tree.element?.attributes['imageurl'];
                log('custom_image: imageUrl $imageUrl, attributes ${renderContext.tree.element?.attributes.keys}');

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
        /* FutureBuilder(
          future: body,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                child: Html(
                  data: snapshot.data,
                  tagsList: Html.tags..addAll(CustomHtmlTags.allCustomTags),
                  customRenders: {
                    HtmlRenderMatcher.tagName(CustomHtmlTags.middle):
                        CustomRender.widget(
                            widget: (renderContext, buildChildren) {
                      log('middle: Rendering middle tag');
                      String text =
                          renderContext.tree.element!.attributes['text'] ?? '';
                      bool underlined = renderContext
                              .tree.element!.attributes['underlined'] !=
                          null;
                      bool highlight =
                          renderContext.tree.element!.attributes['highlight'] !=
                              null;

                      return Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          text,
                          style: TextStyles.eventTitle.copyWith(
                            decoration:
                                underlined ? TextDecoration.underline : null,
                            color: highlight ? Colors.lightBlue : null,
                          ),
                        ),
                      );
                    }),
                    HtmlRenderMatcher.tagName(CustomHtmlTags.customImage):
                        CustomRender.widget(
                            widget: (renderContext, buildChildren) {
                      log('custom_image: rendering custom image');

                      String? imageUrl =
                          renderContext.tree.element?.attributes['imageurl'];
                      log('custom_image: imageUrl $imageUrl, attributes ${renderContext.tree.element?.attributes.keys}');

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
              );
            }
            return const SizedBox();
          },
        ), */
        const GoToTop(),
      ],
    );
  }
}
