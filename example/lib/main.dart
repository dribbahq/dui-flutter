import 'package:cityxerpa_icons/cityxerpa_symbols.dart';
import 'package:dalai/common_utils/alert.dart';
import 'package:dalai/core/badges.dart';
import 'package:dalai/dalai.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lama UI Showcase',
      theme: Dalai.theme.themeData(false),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var availableColors = {
    Dalai.color.primary: "primary",
    Dalai.color.primaryAlternativeLight: "primaryAlternativeLight",
    Dalai.color.primaryAlternativeDark: "primaryAlternativeDark",
    Dalai.color.primaryContrast: "primaryContrast",
    Dalai.color.primaryOutlinedNestingBackground:
        "primaryOutlinedNestingBackground",
    Dalai.color.secondary: "secondary",
    Dalai.color.secondaryDarkMode: "secondaryDarkMode",
    Dalai.color.secondaryContrast: "secondaryContrast",
    Dalai.color.text: "text",
    Dalai.color.smallText: "smallText",
    Dalai.color.textDarkMode: "textDarkMode",
    Dalai.color.smallTextDarkMode: "smallTextDarkMode",
    Dalai.color.disabledText: "disabledText",
    Dalai.color.discount: "discount",
    Dalai.color.warning: "warning",
    Dalai.color.error: "error",
    Dalai.color.loadingLightPrimary: "loadingLightPrimary",
    Dalai.color.loadingLightSecondary: "loadingLightSecondary",
    Dalai.color.loadingDarkPrimary: "loadingDarkPrimary",
    Dalai.color.loadingDarkSecondary: "loadingDarkSecondary",
    Dalai.color.background: "background",
    Dalai.color.backgroundDarkMode: "backgroundDarkMode",
    Dalai.color.scaffold: "scaffold",
    Dalai.color.scaffoldDarkMode: "scaffoldDarkMode",
    Dalai.color.homeCategoryBG: "homeCategoryBG",
    Dalai.color.homeCategoryBGDark: "homeCategoryBGDark",
    Dalai.color.inputFillColorLight: "inputFillColorLight",
    Dalai.color.inputFillColorDark: "inputFillColorDark",
    Dalai.color.inputHomeFillColor: "inputHomeFillColor",
    Dalai.color.inputHomePlaceholderColor: "inputHomePlaceholderColor",
    Dalai.color.inputBorderEnableLight: "inputBorderEnableLight",
    Dalai.color.inputBorderFocusLight: "inputBorderFocusLight",
    Dalai.color.cream: "cream",
    Dalai.color.white: "white",
    Dalai.color.black: "black",
    Dalai.color.grey: "grey",
    Dalai.color.blue: "blue",
    Dalai.color.promo: "promo",
    Dalai.color.auberginie: "auberginie",
  };

  var key1 = GlobalKey();
  var key2 = GlobalKey();
  var key3 = GlobalKey();
  var key4 = GlobalKey();
  var key5 = GlobalKey();
  var key6 = GlobalKey();
  var key7 = GlobalKey();
  var key8 = GlobalKey();
  var key9 = GlobalKey();
  var key10 = GlobalKey();
  var key11 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Dalai.color.cream,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Dalai.spacing.spacer(multiplier: 8),
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dalai.spacing.largeLateralPaddingValue),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/lama-ui-icon.png',
                        width: 120,
                      ),
                      Dalai.spacing.spacer(),
                      Dalai.text.title1(context, 'LAMA Showcase'),
                    ],
                  )),
              Container(
                height: 44,
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dalai.spacing.largeLateralPaddingValue),
                  itemCount: 11,
                  separatorBuilder: (context, index) {
                    return Dalai.spacing.hSpacer();
                  },
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var title = '';
                    GlobalKey key = GlobalKey();
                    if (index == 0) {
                      title = "Text and Labels";
                      key = key1;
                    } else if (index == 1) {
                      title = "Colors";
                      key = key2;
                    } else if (index == 2) {
                      title = "Spacing and Dividers";
                      key = key3;
                    } else if (index == 3) {
                      title = "Icons";
                      key = key4;
                    } else if (index == 4) {
                      title = "Text Fields and Inputs";
                      key = key5;
                    } else if (index == 5) {
                      title = "Buttons";
                      key = key6;
                    } else if (index == 6) {
                      title = "Skeleton";
                      key = key7;
                    } else if (index == 7) {
                      title = "Cards";
                      key = key8;
                    } else if (index == 8) {
                      title = "Tiles";
                      key = key9;
                    } else if (index == 9) {
                      title = "Badges";
                      key = key10;
                    } else if (index == 10) {
                      title = "Misc";
                      key = key11;
                    }

                    return Dalai.badge.tagSolid(context, title,
                        color: BadgeColor.secondary, onTap: () {
                      Scrollable.ensureVisible(key.currentContext!,
                          curve: Curves.easeIn,
                          duration: Duration(milliseconds: 500));
                    });
                  },
                ),
              ),
              Container(
                key: key1,
                padding: EdgeInsets.all(Dalai.spacing.largeLateralPaddingValue),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Dalai.text.title2(context, 'Text and Labels'),
                    Dalai.spacing.spacer(),
                    showCaseBlock(
                        Dalai.text.title1(context, 'El teu heroi a domicili'),
                        title: "Dalai.text.title1"),
                    Dalai.spacing.spacer(small: true),
                    showCaseBlock(
                        Dalai.text.title2(context, 'El teu heroi a domicili'),
                        title: "Dalai.text.title2"),
                    Dalai.spacing.spacer(small: true),
                    showCaseBlock(
                        Dalai.text.title3(context, 'El teu heroi a domicili'),
                        title: "Dalai.text.title3"),
                    Dalai.spacing.spacer(small: true),
                    showCaseBlock(
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Dalai.text
                                .regular(context, 'El teu heroi a domicili'),
                            Dalai.text.regular(
                                context, 'El teu heroi a domicili',
                                bold: true)
                          ],
                        ),
                        title: "Dalai.text.regular"),
                    Dalai.spacing.spacer(small: true),
                    showCaseBlock(
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Dalai.text
                                .small(context, 'El teu heroi a domicili'),
                            Dalai.text.small(context, 'El teu heroi a domicili',
                                bold: true)
                          ],
                        ),
                        title: "Dalai.text.small"),
                    Dalai.spacing.spacer(small: true),
                    showCaseBlock(
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Dalai.text.xs(context, 'El teu heroi a domicili'),
                            Dalai.text.xs(context, 'El teu heroi a domicili',
                                bold: true)
                          ],
                        ),
                        title: "Dalai.text.xs"),
                    Dalai.spacing.divider(context),
                  ],
                ),
              ),
              Container(
                key: key2,
                padding: EdgeInsets.all(Dalai.spacing.largeLateralPaddingValue),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Dalai.text.title2(context, 'Colors'),
                    Dalai.spacing.spacer(),
                    GridView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: availableColors.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: Dalai.spacing.lateralPaddingValue,
                            mainAxisSpacing: Dalai.spacing.lateralPaddingValue,
                            childAspectRatio: 0.7),
                        itemBuilder: (BuildContext context, int index) {
                          var key = availableColors.keys.elementAt(index);
                          return showCaseBlock(
                              Container(
                                height: 44,
                                width: 44,
                                decoration: BoxDecoration(
                                    color: key,
                                    borderRadius: BorderRadius.circular(
                                        Dalai.spacing.smallBorderRadius)),
                              ),
                              title: availableColors.values.elementAt(index),
                              largePadding: false);
                        }),
                    Dalai.spacing.divider(context),
                  ],
                ),
              ),
              Container(
                key: key3,
                padding: EdgeInsets.all(Dalai.spacing.largeLateralPaddingValue),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Dalai.text.title2(context, 'Spacing and Dividers'),
                    Dalai.spacing.spacer(),
                    showCaseBlock(
                        Column(
                          children: [
                            Container(
                              height: 24,
                              width: 24,
                              color: Dalai.color.primary,
                            ),
                            Dalai.spacing.spacer(),
                            Container(
                              height: 24,
                              width: 24,
                              color: Dalai.color.primary,
                            ),
                          ],
                        ),
                        title: "Regular Spacer"),
                    Dalai.spacing.spacer(),
                    showCaseBlock(
                        Column(
                          children: [
                            Container(
                              height: 24,
                              width: 24,
                              color: Dalai.color.primary,
                            ),
                            Dalai.spacing.spacer(small: true),
                            Container(
                              height: 24,
                              width: 24,
                              color: Dalai.color.primary,
                            ),
                          ],
                        ),
                        title: "Small Spacer"),
                    Dalai.spacing.spacer(),
                    showCaseBlock(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 24,
                              width: 24,
                              color: Dalai.color.primary,
                            ),
                            Dalai.spacing.hSpacer(),
                            Container(
                              height: 24,
                              width: 24,
                              color: Dalai.color.primary,
                            ),
                          ],
                        ),
                        title: "Regular HSpacer"),
                    Dalai.spacing.spacer(),
                    showCaseBlock(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 24,
                              width: 24,
                              color: Dalai.color.primary,
                            ),
                            Dalai.spacing.hSpacer(small: true),
                            Container(
                              height: 24,
                              width: 24,
                              color: Dalai.color.primary,
                            ),
                          ],
                        ),
                        title: "Small HSpacer"),
                    Dalai.spacing.spacer(),
                    showCaseBlock(Dalai.spacing.divider(context),
                        title: "Horizontal Divider"),
                    showCaseBlock(Dalai.spacing.verticalDivider(context, 24),
                        title: "Vertical Divider"),
                    showCaseBlock(Dalai.spacing.dottedDivider(context),
                        title: "Dotted Divider"),
                    Dalai.spacing.spacer(),
                    showCaseBlock(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: Dalai.color.primary,
                                    borderRadius: BorderRadius.circular(
                                        Dalai.spacing.smallBorderRadius))),
                            Dalai.spacing.hSpacer(),
                            Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: Dalai.color.primary,
                                    borderRadius: BorderRadius.circular(
                                        Dalai.spacing.borderRadius))),
                            Dalai.spacing.hSpacer(),
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Dalai.color.primary,
                                  borderRadius: BorderRadius.circular(
                                      Dalai.spacing.largeBorderRadius)),
                            ),
                            Dalai.spacing.hSpacer(small: true),
                          ],
                        ),
                        title: "Border Radius (Small, Regular, Large)"),
                    Dalai.spacing.divider(context),
                  ],
                ),
              ),
              Container(
                key: key4,
                padding: EdgeInsets.all(Dalai.spacing.largeLateralPaddingValue),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Dalai.text.title2(context, 'Icons'),
                    Dalai.spacing.spacer(),
                    showCaseBlock(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Dalai.icon.dalaiIcons(context, CXIcon.bag,
                                size: CXIconSize.x_small),
                            Dalai.icon.dalaiIcons(context, CXIcon.bag,
                                size: CXIconSize.small),
                            Dalai.icon.dalaiIcons(context, CXIcon.bag),
                            Dalai.icon.dalaiIcons(context, CXIcon.bag,
                                size: CXIconSize.large),
                            Dalai.icon.dalaiIcons(context, CXIcon.bag,
                                size: CXIconSize.x_large),
                          ],
                        ),
                        title: "Icon Sizes"),
                    Dalai.spacing.spacer(),
                    showCaseBlock(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Dalai.icon.dalaiIcons(context, CXIcon.bike_slash,
                                mainColor: Dalai.color.black,
                                secondaryColor: Dalai.color.primary,
                                size: CXIconSize.large),
                            Dalai.icon.dalaiIcons(context, CXIcon.bike_slash,
                                mainColor: Dalai.color.black,
                                secondaryColor: Dalai.color.black,
                                size: CXIconSize.large),
                            Dalai.icon.dalaiIcons(context, CXIcon.bike_slash,
                                mainColor: Dalai.color.blue,
                                secondaryColor: Dalai.color.auberginie,
                                size: CXIconSize.large),
                          ],
                        ),
                        title: "Icon Colors"),
                    Dalai.spacing.divider(context),
                  ],
                ),
              ),
              Container(
                key: key5,
                padding: EdgeInsets.all(Dalai.spacing.largeLateralPaddingValue),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Dalai.text.title2(context, 'Text Fields and Inputs'),
                    Dalai.spacing.spacer(),
                    showCaseBlock(
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Dalai.input.textField("Email address",
                                TextEditingController(), FocusNode(), context),
                            Dalai.spacing.spacer(),
                            Dalai.input.textField(
                                "Password",
                                TextEditingController(text: "Password"),
                                FocusNode(),
                                context,
                                obscure: true),
                            Dalai.spacing.spacer(),
                            Dalai.input.textField("Email address",
                                TextEditingController(), FocusNode(), context,
                                enabled: false),
                            Dalai.spacing.spacer(),
                            Dalai.input.textField("Email address",
                                TextEditingController(), FocusNode(), context,
                                error: "Error"),
                          ],
                        ),
                        title: "Regular"),
                    Dalai.spacing.spacer(),
                    showCaseBlock(
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Dalai.input.searchField("Email address",
                                TextEditingController(), FocusNode(), context),
                            Dalai.spacing.spacer(),
                            Dalai.input.searchField("Email address",
                                TextEditingController(), FocusNode(), context,
                                enabled: false),
                            Dalai.spacing.spacer(),
                            Dalai.input.searchField("Email address",
                                TextEditingController(), FocusNode(), context,
                                error: "Error"),
                          ],
                        ),
                        title: "Search"),
                    Dalai.spacing.spacer(),
                    showCaseBlock(
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Dalai.input.chatInputField(context, "Email address",
                                TextEditingController(), FocusNode()),
                          ],
                        ),
                        title: "Chat Input"),
                    Dalai.spacing.spacer(),
                    showCaseBlock(
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Dalai.input.phoneTextField(
                                context,
                                "Número de teléfono",
                                TextEditingController(),
                                FocusNode(),
                                "+34",
                                (prefix) {}),
                          ],
                        ),
                        title: "Phone Input"),
                    Dalai.spacing.divider(context),
                  ],
                ),
              ),
              Container(
                key: key6,
                padding: EdgeInsets.all(Dalai.spacing.largeLateralPaddingValue),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Dalai.text.title2(context, 'Buttons'),
                    Dalai.spacing.spacer(),
                    showCaseBlock(Dalai.button.button(context, "Log In", () {}),
                        title: "Regular"),
                    Dalai.spacing.spacer(),
                    showCaseBlock(
                        Dalai.button.shadowButton(context, "Log In", () {}),
                        title: "Shadow"),
                    Dalai.spacing.spacer(),
                    showCaseBlock(
                        Dalai.button.noBgButton(context, "Log In", () {}),
                        title: "No BG Button"),
                    Dalai.spacing.spacer(),
                    showCaseBlock(
                        Dalai.button.outlineButton(context, "Log In", () {}),
                        title: "Outline Button"),
                    Dalai.spacing.spacer(),
                    showCaseBlock(
                        Dalai.button.smallButton(context, "Log In", () {}),
                        title: "Small Button"),
                    Dalai.spacing.spacer(),
                    showCaseBlock(Dalai.button.buttonQtyLeading(context, 2),
                        title: "Button Quantity Leading"),
                    Dalai.spacing.spacer(),
                    showCaseBlock(
                        Dalai.button.buttonPriceTrailing(context, 22.50,
                            freeText: "Free", amountInEurosText: "%@ Euros"),
                        title: "Button Price Trailing",
                        backgroundColor: Dalai.color.primary),
                    Dalai.spacing.spacer(),
                    showCaseBlock(
                        Dalai.button.buttonMinPriceWidget(context,
                            minPrice: 22.5,
                            currentPrice: 10.0,
                            addMoreToRequestText: "Add more to order"),
                        title: "Button Min Price",
                        backgroundColor: Dalai.color.primary),
                    Dalai.spacing.spacer(),
                    showCaseBlock(
                        Dalai.button.backButtonCircle(
                          context,
                        ),
                        title: "Back Button Circle"),
                    Dalai.spacing.spacer(),
                    showCaseBlock(
                        Dalai.button.appBarActionButtonCircle(
                            context, CXIcon.compare_arrows),
                        title: "AppBar Action Button Circle"),
                    Dalai.spacing.spacer(),
                    showCaseBlock(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Dalai.button.checkbox(true, (value) {}, context),
                            Dalai.spacing.hSpacer(),
                            Dalai.button.checkbox(false, (value) {}, context),
                          ],
                        ),
                        title: "Checkbox"),
                    showCaseBlock(
                        Dalai.button.toggle(true, (value) {}, context),
                        title: "Toggle"),
                    showCaseBlock(
                        Dalai.button.slidingControl(
                          0,
                          (value) {},
                          context,
                          children: {
                            0: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Dalai.icon.dalaiIcons(
                                      context,
                                      CXIcon.bike_alt,
                                    ),
                                    Dalai.spacing.hSpacer(small: true),
                                    Dalai.text.regular(context, 'Tab 1',
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .color!)
                                  ],
                                ),
                              ],
                            ),
                            1: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Dalai.icon.dalaiIcons(
                                      context,
                                      CXIcon.bike_alt,
                                    ),
                                    Dalai.spacing.hSpacer(small: true),
                                    Dalai.text.regular(context, 'Tab 2',
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .color!)
                                  ],
                                ),
                              ],
                            ),
                          },
                          isStretch: true,
                        ),
                        title: "Segment Bar",
                        largePadding: false),
                    Dalai.spacing.divider(context),
                  ],
                ),
              ),
              Container(
                key: key7,
                padding: EdgeInsets.all(Dalai.spacing.largeLateralPaddingValue),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Dalai.text.title2(context, 'Skeleton Loading'),
                    Dalai.spacing.spacer(),
                    showCaseBlock(
                        Container(
                          height: 90,
                          child: Dalai.skeleton.emptyRegularTileList(context),
                        ),
                        title: "Empty Regular Tile List"),
                    Dalai.spacing.spacer(),
                    showCaseBlock(
                        Dalai.skeleton.emptyBusinessContainer(160, context),
                        title: "Supermarket Products Block"),
                    Dalai.spacing.spacer(),
                    showCaseBlock(
                        Dalai.skeleton.emptySimpleContainer(60, 60, context),
                        title: "Empty Simple Container"),
                    Dalai.spacing.divider(context),
                  ],
                ),
              ),
              Container(
                key: key8,
                padding: EdgeInsets.all(Dalai.spacing.largeLateralPaddingValue),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Dalai.text.title2(context, 'Cards'),
                    Dalai.spacing.spacer(),
                    showCaseBlock(Dalai.card.cardTitle(context, 'Card Title'),
                        title: "Card Title"),
                    Dalai.spacing.spacer(),
                    showCaseBlock(
                        Dalai.card.cardTitleSmall(context, 'Card Title Small'),
                        title: "Card Title Small"),
                    Dalai.spacing.spacer(),
                    showCaseBlock(
                        Dalai.card.cardDescription(context, 'Card Description'),
                        title: "Card Description"),
                    Dalai.spacing.spacer(),
                    showCaseBlock(Dalai.card.cardPrice(context, 'Card Price'),
                        title: "Card Price"),
                    Dalai.spacing.spacer(),
                    showCaseBlock(
                        Dalai.card.banner(
                            context,
                            "Check it out!",
                            "Click on here to view more info",
                            () {},
                            "https://cdn01.diariandorra.ad/uploads/imagenes/8col/2020/04/12/_82_e9f56a64.jpg",
                            Dalai.color.black),
                        title: "Promotion Card"),
                    Dalai.spacing.spacer(),
                    showCaseBlock(
                        Dalai.card.order(context,
                            title: "Comanda al Ginza41",
                            highlightText: "Ginza41",
                            leadingSubtitle: "1 prod",
                            trailingSubtitle: "22.50€",
                            status: "Entregat",
                            badgeColor: BadgeColor.secondary,
                            accessoryTitle:
                                "Carrer de la Unió, 41 AD500 Andorra la Vella",
                            imageURL:
                                "https://cdn01.diariandorra.ad/uploads/imagenes/8col/2020/04/12/_82_e9f56a64.jpg"),
                        title: "Order Card"),
                    Dalai.spacing.divider(context),
                  ],
                ),
              ),
              Container(
                key: key9,
                padding: EdgeInsets.all(Dalai.spacing.largeLateralPaddingValue),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Dalai.text.title2(context, 'Tiles'),
                    Dalai.spacing.spacer(),
                    showCaseBlock(
                        Column(
                          children: [
                            Dalai.tile.listTile('Title', context, () {}),
                            Dalai.spacing.divider(context),
                            Dalai.tile.listTile('Loading Tile', context, () {},
                                loading: true),
                            Dalai.spacing.divider(context),
                            Dalai.tile.listTile('Loading Tile', context, () {},
                                trailing: const SizedBox.shrink(),
                                leading:
                                    Dalai.icon.dalaiIcons(context, CXIcon.ban))
                          ],
                        ),
                        title: "Tile with Title"),
                    Dalai.spacing.spacer(),
                    showCaseBlock(
                        Column(
                          children: [
                            Dalai.tile
                                .listTileWithSub('Title', context, 'Subtitle'),
                            Dalai.spacing.divider(context),
                            Dalai.tile.listTileWithSub(
                                'Title', context, 'Subtitle',
                                leading:
                                    Dalai.icon.dalaiIcons(context, CXIcon.bag)),
                          ],
                        ),
                        title: "Tile with Subtitle"),
                    showCaseBlock(
                        Column(
                          children: [
                            Dalai.tile.listTileCustomImage(
                                Dalai.icon.dalaiIcons(context, CXIcon.bag),
                                context,
                                'Click me and get free bags!',
                                () {}),
                          ],
                        ),
                        title: "Tile with Custom Image"),
                    Dalai.spacing.spacer(),
                    showCaseBlock(
                        Column(
                          children: [
                            Dalai.tile.listSearchTileCustomImage(CXIcon.bag_alt,
                                context, 'Click me and get free bags!', () {},
                                searchText: "free"),
                          ],
                        ),
                        title: "Tile with highlighted search text"),
                    Dalai.spacing.spacer(),
                    showCaseBlock(
                        Column(
                          children: [
                            Dalai.tile.paymentMethod(
                                context, "Card ending in 4444", "Exp. at 12/25",
                                highlightText: "4444", onTap: (){}, onRemove: (){}),
                          ],
                        ),
                        title: "Payment Method Tile"),
                    Dalai.spacing.divider(context),
                  ],
                ),
              ),
              Container(
                key: key10,
                padding: EdgeInsets.all(Dalai.spacing.largeLateralPaddingValue),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Dalai.text.title2(context, 'Badges'),
                    Dalai.spacing.spacer(),
                    showCaseBlock(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Dalai.badge.badgeSolid(context, 'Business closed'),
                            Dalai.spacing.hSpacer(),
                            Dalai.badge.badgeSolid(context, 'Business closed',
                                icon: CXIcon.shop, color: BadgeColor.secondary),
                          ],
                        ),
                        title: "Badge Solid"),
                    Dalai.spacing.spacer(),
                    showCaseBlock(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Dalai.badge
                                .badgeOutline(context, 'Business closed'),
                            Dalai.spacing.hSpacer(),
                            Dalai.badge.badgeOutline(context, 'Business closed',
                                icon: CXIcon.shop, color: BadgeColor.secondary),
                          ],
                        ),
                        title: "Badge Outline"),
                    Dalai.spacing.spacer(),
                    showCaseBlock(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Dalai.badge.tagSolid(context, 'Click Me!',
                                onTap: () {
                              Alert.showAlert(
                                "You clicked me!",
                                "You perv...",
                                context,
                                okText: 'OK',
                              );
                            }),
                            Dalai.spacing.hSpacer(),
                            Dalai.badge.tagSolid(context, 'Click Me!',
                                icon: CXIcon.vision_alt,
                                color: BadgeColor.secondary, onTap: () {
                              Alert.showAlert(
                                "You clicked me!",
                                "You perv...",
                                context,
                                okText: 'OK',
                              );
                            }),
                          ],
                        ),
                        title: "Tag Solid"),
                    Dalai.spacing.spacer(),
                    showCaseBlock(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Dalai.badge.tagOutline(context, 'Click Me!',
                                onTap: () {
                              Alert.showAlert(
                                "You clicked me!",
                                "You perv...",
                                context,
                                okText: 'OK',
                              );
                            }),
                            Dalai.spacing.hSpacer(),
                            Dalai.badge.tagOutline(context, 'Click Me!',
                                icon: CXIcon.directions_walk,
                                color: BadgeColor.secondary, onTap: () {
                              Alert.showAlert(
                                "You clicked me!",
                                "You perv...",
                                context,
                                okText: 'OK',
                              );
                            }),
                          ],
                        ),
                        title: "Tag Outline"),
                    Dalai.spacing.spacer(),
                    Dalai.spacing.divider(context),
                  ],
                ),
              ),
              Container(
                key: key11,
                padding: EdgeInsets.all(Dalai.spacing.largeLateralPaddingValue),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Dalai.text.title2(context, 'Misc'),
                    Dalai.spacing.spacer(),
                    showCaseBlock(
                        Dalai.misc.checkoutHeader(
                            context, 'La teva comanda a ', 'Ginza41'),
                        title: "Checkout Header"),
                    Dalai.spacing.spacer(),
                    showCaseBlock(
                        Dalai.misc.spanWithBoldTitle(
                            context, 'La teva comanda a ', 'Ginza41'),
                        title: "Span with Bold Title"),
                    Dalai.spacing.spacer(),
                    showCaseBlock(Dalai.misc.getProductPlaceholder(context),
                        title: "Product Placeholder"),
                    Dalai.spacing.divider(context),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  showCaseBlock(Widget content,
      {String? title,
      bool largePadding = true,
      Color backgroundColor = Colors.white}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GridPaper(
          color: Dalai.color.grey.withOpacity(0.15),
          divisions: 2,
          subdivisions: 2,
          interval: 24,
          child: Container(
            padding: EdgeInsets.only(
                left: 12,
                right: 12,
                top: largePadding ? 24 : 12,
                bottom: largePadding ? 24 : 12),
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius:
                    BorderRadius.circular(Dalai.spacing.smallBorderRadius)),
            child: Center(
              child: content,
            ),
          ),
        ),
        title != null
            ? Dalai.spacing.spacer(small: true)
            : const SizedBox.shrink(),
        title != null
            ? Dalai.text.xs(context, title,
                color: Dalai.color.text.withOpacity(0.8), bold: true)
            : const SizedBox.shrink(),
        title != null ? Dalai.spacing.spacer() : const SizedBox.shrink(),
      ],
    );
  }
}
