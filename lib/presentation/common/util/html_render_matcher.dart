import 'package:flutter_html/custom_render.dart';

abstract class HtmlRenderMatcher {
  static CustomRenderMatcher tagName(String tag) =>
      (renderContext) => renderContext.tree.element?.localName == tag;
}
