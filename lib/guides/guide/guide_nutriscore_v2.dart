import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_guide/guides/helpers/guides_content.dart';
import 'package:smooth_guide/guides/helpers/guides_footer.dart';
import 'package:smooth_guide/guides/helpers/guides_header.dart';
import 'package:smooth_guide/resources/app_icons.dart';

class GuideNutriscoreV2 extends StatelessWidget {
  const GuideNutriscoreV2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          GuidesHeader(
            title: "Le Nutri-Score change : explications !",
            illustration: _NutriScoreHeaderIllustration(),
          ),
          _NutriScoreSection1(),
          _NutriScoreSection2(),
          _NutriScoreSection3(),
          _NutriScoreSection4(),
          _NutriScoreSection5(),
          SliverToBoxAdapter(
            child: GuidesFooter(),
          )
        ],
      ),
    );
  }
}

class _NutriScoreHeaderIllustration extends StatelessWidget {
  const _NutriScoreHeaderIllustration();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 32,
          child: SvgPicture.asset('assets/cache/nutriscore-a.svg'),
        ),
        const Expanded(
          flex: 28,
          child: Arrow.down(
            color: Colors.white,
          ),
        ),
        Expanded(
          flex: 40,
          child: SvgPicture.asset('assets/cache/nutriscore-a-new-fr.svg'),
        ),
      ],
    );
  }
}

class _NutriScoreSection1 extends StatelessWidget {
  const _NutriScoreSection1();

  @override
  Widget build(BuildContext context) {
    return const GuidesParagraph(
      title: "Qu'est-ce que le Nutri-Score ?",
      content: [
        GuidesText(
            text:
                "Le Nutri-Score est un logo qui a pour objectif de vous informer sur la **qualité nutritionnelle des aliments**."),
        GuidesText(
            text:
                "Le code couleur varie en allant du vert foncé (**A**) pour les produits les **plus sains** au rouge foncé (**E**) pour les **moins sains**."),
        GuidesImage(
          imagePath: 'assets/cache/nutriscore-a.svg',
          caption: 'Le logo Nutri-Score A',
          desiredWidthPercent: 0.30,
        ),
      ],
    );
  }
}

class _NutriScoreSection2 extends StatelessWidget {
  const _NutriScoreSection2();

  @override
  Widget build(BuildContext context) {
    return const GuidesParagraph(
      title: "Pourquoi le Nutri-Score change-t-il ?",
      content: [
        GuidesText(
            text:
                "La formule du Nutri-Score **évolue** pour fournir de meilleures recommandations :"),
        GuidesTitleWithText(
          title: 'Mieux évaluer l\'ensemble des boissons',
          icon: Milk(),
          text:
              'Les notes comparées du **lait**, les **boissons lactées** avec ajout de sucre et **végétales** ont été mieux différenciées dans le nouvel algorithme.',
        ),
        GuidesTitleWithText(
          title: 'Un meilleur classement des boissons',
          icon: Soda.unhappy(),
          text:
              'La **teneur en sucres** est mieux prise en compte et avantage les boissons **faiblement sucrées**.\nLes **édulcorants seront également pénalisés** : les sodas light vont être déclassés pour passer d’une note B à entre C et E. L’eau reste la boisson recommandée.',
        ),
        GuidesTitleWithText(
          title: 'Le sel et sucre pénalisés',
          icon: Salt(),
          text:
              'Les produits **trop sucrés** ou **trop salés** verront leur **note encore dégradée**.',
        ),
        GuidesTitleWithText(
          title: 'Hiérarchisation des huiles et poissons',
          icon: Fish(),
          text:
              'La note de certains **poissons gras** et des **huiles riches en bonnes graisses** va s’améliorer.',
        ),
        GuidesTitleWithText(
          title: 'Limiter la viande rouge',
          icon: Chicken(),
          text:
              'La consommation de **viande rouge est à limiter**. C’est pourquoi la **volaille sera comparativement mieux classée**.',
        ),
      ],
    );
  }
}

class _NutriScoreSection3 extends StatelessWidget {
  const _NutriScoreSection3();

  @override
  Widget build(BuildContext context) {
    return const GuidesParagraph(
      title: "Comment différencier ancien Nutri-Score et nouveau calcul ?",
      content: [
        GuidesText(
            text:
                "Désormais le logo peut arborer une mention \"**Nouveau calcul**\" pour clarifier qu'il s'agit bien du nouveau calcul."),
        GuidesImage(
          imagePath: 'assets/cache/nutriscore-a-new-fr.svg',
          caption: 'Le logo du nouveau Nutri-Score',
          desiredWidthPercent: 0.30,
        ),
      ],
    );
  }
}

class _NutriScoreSection4 extends StatelessWidget {
  const _NutriScoreSection4();

  @override
  Widget build(BuildContext context) {
    return const GuidesParagraph(
      title: "Où trouver le nouveau calcul du NutriScore ?",
      content: [
        GuidesText(
            text:
                "Le Nutri-Score est en application dans plusieurs pays : l'Allemagne, la Belgique, l'Espagne, la France, le Luxembourg, les Pays-Bas et la Suisse."),
        GuidesText(
            text:
                "Les fabriquants ont jusqu'en **2026** au plus tard **pour remplacer** l'ancien calcul par le nouveau."),
        GuidesIllustratedText(
            text:
                'Sans attendre, vous **retrouvez déjà dans l\'application Open Food Facts**, le nouveau calcul, y compris si les fabriquants n’ont pas mis à jour le score.',
            imagePath:
                'assets/app/release_icon_light_transparent_no_border.svg',
            desiredWidthPercent: 0.15)
      ],
    );
  }
}

class _NutriScoreSection5 extends StatelessWidget {
  const _NutriScoreSection5();

  @override
  Widget build(BuildContext context) {
    return const GuidesParagraph(
      title: "Ce qui ne change pas",
      content: [
        GuidesText(
            text:
                "Le Nutri-Score est un score conçu pour **mesurer la qualité nutritionnelle**. Il est **complémentaire au groupe NOVA** sur les **aliments ultra-transformés** (également présent dans l'application)."),
        GuidesText(
            text:
                "Pour les fabriquants, l'affichage du Nutri-Score **reste optionnel**."),
      ],
    );
  }
}
