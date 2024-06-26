import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:smooth_guide/resources/app_icons.dart';
import 'package:smooth_guide/theme_colors.dart';
import 'package:smooth_guide/utils/text_utils.dart';

class GuidesParagraph extends StatelessWidget {
  const GuidesParagraph({
    super.key,
    required this.title,
    required this.content,
  });

  static const double _HORIZONTAL_PADDING = 20.0;

  final String title;
  final List<Widget> content;

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      pushPinnedChildren: true,
      children: [
        SliverPadding(
          padding: const EdgeInsetsDirectional.only(
            bottom: 8.0,
          ),
          sliver: SliverPinnedHeader(
            child: _GuidesParagraphTitle(title: title),
          ),
        ),
        DefaultTextStyle.merge(
          style: const TextStyle(
            fontSize: 15.0,
            height: 1.75,
          ),
          child: AppIconTheme(
            size: 21.0,
            color: Colors.white,
            child: SliverPadding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 15.0,
              ),
              sliver: SliverList.builder(
                itemCount: content.length,
                itemBuilder: (BuildContext context, int position) {
                  return content[position];
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _GuidesParagraphTitle extends StatelessWidget {
  const _GuidesParagraphTitle({
    required this.title,
  }) : assert(title.length > 0);

  final String title;

  @override
  Widget build(BuildContext context) {
    final SmoothColorsThemeExtension colors =
        Theme.of(context).extension<SmoothColorsThemeExtension>()!;

    return Semantics(
      label: title,
      header: true,
      excludeSemantics: true,
      child: ColoredBox(
        color: colors.primaryDark,
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: GuidesParagraph._HORIZONTAL_PADDING,
            vertical: 10.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.ideographic,
            children: [
              const Padding(
                padding: EdgeInsetsDirectional.only(top: 3.3),
                child: _GuidesParagraphArrow(),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GuidesParagraphArrow extends StatelessWidget {
  const _GuidesParagraphArrow();

  @override
  Widget build(BuildContext context) {
    final SmoothColorsThemeExtension colors =
        Theme.of(context).extension<SmoothColorsThemeExtension>()!;

    return SizedBox.square(
      dimension: 20.0,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.orange,
          shape: BoxShape.circle,
        ),
        child: const Arrow.right(
          color: Colors.white,
          size: 12.0,
        ),
      ),
    );
  }
}

class GuidesText extends StatelessWidget {
  const GuidesText({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: 10.0,
        start: GuidesParagraph._HORIZONTAL_PADDING,
        end: GuidesParagraph._HORIZONTAL_PADDING,
      ),
      child: _GuidesFormattedText(
        text: text,
      ),
    );
  }
}

class _GuidesFormattedText extends StatelessWidget {
  const _GuidesFormattedText({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    const TextStyle defaultTextStyle = TextStyle();

    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: TextHighlighter.getPartsBetweenSymbol(
                text: text,
                symbol: '\\*\\*',
                symbolLength: 2,
                defaultStyle: defaultTextStyle,
                highlightedStyle: const TextStyle(fontWeight: FontWeight.bold))
            .map(
          ((String, TextStyle?) part) {
            return TextSpan(
              text: part.$1,
              style: defaultTextStyle.merge(part.$2),
            );
          },
        ).toList(growable: false),
      ),
    );
  }
}

class GuidesIllustratedText extends StatelessWidget {
  const GuidesIllustratedText({
    required this.text,
    required this.imagePath,
    required this.desiredWidthPercent,
    super.key,
  })  : assert(text.length > 0),
        assert(imagePath.length > 0);

  final String text;
  final String imagePath;
  final double? desiredWidthPercent;

  @override
  Widget build(BuildContext context) {
    final SmoothColorsThemeExtension colors =
        Theme.of(context).extension<SmoothColorsThemeExtension>()!;
    final int imageWidth =
        (desiredWidthPercent != null ? desiredWidthPercent! : 0.25) *
            100.0 ~/
            1;

    return Semantics(
      label: text,
      excludeSemantics: true,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
          top: 20.0,
        ),
        child: ColoredBox(
          color: colors.primaryMedium,
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
              vertical: 15.0,
              horizontal: GuidesParagraph._HORIZONTAL_PADDING,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: imageWidth,
                  child: _ImageFromAssets(
                    imagePath: imagePath,
                  ),
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  flex: 100 - imageWidth,
                  child: _GuidesFormattedText(text: text),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GuidesTitleWithText extends StatelessWidget {
  const GuidesTitleWithText({
    required this.title,
    required this.icon,
    required this.text,
    super.key,
  });

  final String title;
  final AppIcon icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: 15.0,
        bottom: 15.0,
        start: GuidesParagraph._HORIZONTAL_PADDING - 2.0,
        end: GuidesParagraph._HORIZONTAL_PADDING - 2.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _GuidesTextTitle(
            title: title,
            icon: icon,
          ),
          const SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: _GuidesFormattedText(
              text: text,
            ),
          ),
        ],
      ),
    );
  }
}

class _GuidesTextTitle extends StatelessWidget {
  const _GuidesTextTitle({
    required this.title,
    required this.icon,
  }) : assert(title.length > 0);

  final String title;
  final AppIcon icon;

  @override
  Widget build(BuildContext context) {
    final SmoothColorsThemeExtension colors =
        Theme.of(context).extension<SmoothColorsThemeExtension>()!;

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: colors.orange,
      ),
      child: Row(
        children: [
          const SizedBox(width: 14.0),
          icon,
          const SizedBox(width: 11.0),
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: colors.primarySemiDark,
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 14.0,
                  end: 14.0,
                  top: 5.0,
                  bottom: 6.0,
                ),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GuidesImage extends StatelessWidget {
  const GuidesImage({
    required this.imagePath,
    required this.caption,
    this.desiredWidthPercent,
    this.desiredHeightPercent,
    super.key,
  })  : assert(caption.length > 0),
        assert(desiredWidthPercent == null ||
            desiredWidthPercent >= 0.0 && desiredWidthPercent <= 1.0),
        assert(desiredHeightPercent == null ||
            desiredHeightPercent >= 0.0 && desiredHeightPercent <= 1.0);

  final String imagePath;
  final double? desiredWidthPercent;
  final double? desiredHeightPercent;
  final String caption;

  @override
  Widget build(BuildContext context) {
    final SmoothColorsThemeExtension colors =
        Theme.of(context).extension<SmoothColorsThemeExtension>()!;

    return Semantics(
      label: caption,
      image: true,
      excludeSemantics: true,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
          top: 10.0,
          start: GuidesParagraph._HORIZONTAL_PADDING,
          end: GuidesParagraph._HORIZONTAL_PADDING,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: colors.primaryMedium,
              borderRadius: BorderRadius.circular(20.0)),
          child: Padding(
            padding: const EdgeInsetsDirectional.only(
              top: 14.0,
              bottom: 8.0,
              start: 12.0,
              end: 12.0,
            ),
            child: Column(
              children: [
                _ImageFromAssets(
                  imagePath: imagePath,
                  desiredWidthPercent: desiredWidthPercent,
                  desiredHeightPercent: desiredHeightPercent,
                ),
                const SizedBox(height: 5.0),
                Text(
                  caption,
                  style: const TextStyle(
                    fontSize: 13.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ImageFromAssets extends StatelessWidget {
  const _ImageFromAssets({
    required this.imagePath,
    this.desiredWidthPercent,
    this.desiredHeightPercent,
  })  : assert(desiredWidthPercent == null ||
            desiredWidthPercent >= 0.0 && desiredWidthPercent <= 1.0),
        assert(desiredHeightPercent == null ||
            desiredHeightPercent >= 0.0 && desiredHeightPercent <= 1.0);

  final String imagePath;
  final double? desiredWidthPercent;
  final double? desiredHeightPercent;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        if (imagePath.endsWith('.svg')) {
          return SvgPicture.asset(
            imagePath,
            width: desiredWidthPercent != null
                ? constraints.maxWidth * desiredWidthPercent!
                : null,
            height: desiredHeightPercent != null
                ? constraints.maxHeight * desiredHeightPercent!
                : null,
          );
        } else {
          return Image.asset(
            imagePath,
            width: desiredWidthPercent != null
                ? constraints.maxWidth * desiredWidthPercent!
                : null,
            height: desiredHeightPercent != null
                ? constraints.maxHeight * desiredHeightPercent!
                : null,
          );
        }
      },
    );
  }
}
