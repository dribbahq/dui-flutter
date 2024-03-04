import 'package:dui/common_utils/alert.dart';
import 'package:dui/core/badges.dart';
import 'package:dui/core/picker.dart';
import 'package:dui/dui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dribba UI Showcase',
      theme: DUI.theme.themeData(false),
      darkTheme: DUI.theme.themeData(true),
      home: const MyHomePage(),
      locale: const Locale('es', 'ES'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ca', 'CA'),
      ],
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
    DUI.color.primary: "primary",
    DUI.color.primaryAlternativeLight: "primaryAlternativeLight",
    DUI.color.primaryAlternativeDark: "primaryAlternativeDark",
    DUI.color.primaryContrast: "primaryContrast",
    DUI.color.primaryOutlinedNestingBackground: "primaryOutlinedNestingBackground",
    DUI.color.secondary: "secondary",
    DUI.color.secondaryDarkMode: "secondaryDarkMode",
    DUI.color.secondaryContrast: "secondaryContrast",
    DUI.color.text: "text",
    DUI.color.smallText: "smallText",
    DUI.color.textDarkMode: "textDarkMode",
    DUI.color.smallTextDarkMode: "smallTextDarkMode",
    DUI.color.disabledText: "disabledText",
    DUI.color.discount: "discount",
    DUI.color.warning: "warning",
    DUI.color.error: "error",
    DUI.color.loadingLightPrimary: "loadingLightPrimary",
    DUI.color.loadingLightSecondary: "loadingLightSecondary",
    DUI.color.loadingDarkPrimary: "loadingDarkPrimary",
    DUI.color.loadingDarkSecondary: "loadingDarkSecondary",
    DUI.color.background: "background",
    DUI.color.backgroundDarkMode: "backgroundDarkMode",
    DUI.color.scaffold: "scaffold",
    DUI.color.scaffoldDarkMode: "scaffoldDarkMode",
    DUI.color.homeCategoryBG: "homeCategoryBG",
    DUI.color.homeCategoryBGDark: "homeCategoryBGDark",
    DUI.color.inputFillColorLight: "inputFillColorLight",
    DUI.color.inputFillColorDark: "inputFillColorDark",
    DUI.color.inputHomeFillColor: "inputHomeFillColor",
    DUI.color.inputHomePlaceholderColor: "inputHomePlaceholderColor",
    DUI.color.inputBorderEnableLight: "inputBorderEnableLight",
    DUI.color.inputBorderFocusLight: "inputBorderFocusLight",
    DUI.color.cream: "cream",
    DUI.color.white: "white",
    DUI.color.black: "black",
    DUI.color.grey: "grey",
    DUI.color.blue: "blue",
    DUI.color.promo: "promo",
    DUI.color.auberginie: "auberginie",
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
  var key12 = GlobalKey();
  var key13 = GlobalKey();

  bool loading = false;
  double starRating = 3.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DUI.spacing.spacer(multiplier: 8),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: DUI.spacing.lateralPaddingValue),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DUI.spacing.spacer(small: true),
                      DUI.text.title1(context, 'UI Showcase'),
                    ],
                  )),
              SizedBox(
                height: 44,
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: DUI.spacing.lateralPaddingValue),
                  itemCount: 13,
                  separatorBuilder: (context, index) {
                    return DUI.spacing.hSpacer();
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
                    } else if (index == 11) {
                      title = "Animations";
                      key = key12;
                    } else if (index == 12) {
                      title = "Pickers";
                      key = key13;
                    }

                    return DUI.badge.tagSolid(context, title, color: BadgeColor.secondary, onTap: () {
                      Scrollable.ensureVisible(key.currentContext!,
                          curve: Curves.easeIn, duration: Duration(milliseconds: 500));
                    });
                  },
                ),
              ),
              Container(
                key: key1,
                padding: EdgeInsets.all(DUI.spacing.lateralPaddingValue),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DUI.text.title2(context, 'Text and Labels'),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(DUI.text.title1(context, 'Lorem ipsum dolor sit amet'), title: "DUI.text.title1"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(DUI.text.title2(context, 'Lorem ipsum dolor sit amet'), title: "DUI.text.title2"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(DUI.text.title3(context, 'Lorem ipsum dolor sit amet'), title: "DUI.text.title3"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DUI.text.regular(context, 'Lorem ipsum dolor sit amet'),
                            DUI.text.regular(context, 'Lorem ipsum dolor sit amet', bold: true)
                          ],
                        ),
                        title: "DUI.text.regular"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DUI.text.small(context, 'Lorem ipsum dolor sit amet'),
                            DUI.text.small(context, 'Lorem ipsum dolor sit amet', bold: true)
                          ],
                        ),
                        title: "DUI.text.small"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DUI.text.xs(context, 'Lorem ipsum dolor sit amet'),
                            DUI.text.xs(context, 'Lorem ipsum dolor sit amet', bold: true)
                          ],
                        ),
                        title: "DUI.text.xs"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        Column(
                          children: [
                            DUI.text.itemHeader(
                              context,
                              'Lorem ipsum dolor sit amet',
                              onAccessoryButtonText: 'Veure tot',
                              onTap: () {
                                Alert.showAlert('title', 'text', context, okText: 'okText');
                              },
                            ),
                            DUI.spacing.spacer(small: true),
                            DUI.text.itemHeader(context, 'Lorem ipsum dolor sit amet',
                                onAccessoryButtonText: 'Veure tot', onTap: () {}, loading: true),
                          ],
                        ),
                        title: "Item Header with Button"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        Column(
                          children: [
                            DUI.text.smallItemHeader(
                              context,
                              'Opcions a la app',
                            ),
                          ],
                        ),
                        title: "Small Item Header"),
                    DUI.spacing.divider(context),
                  ],
                ),
              ),
              Container(
                key: key2,
                padding: EdgeInsets.all(DUI.spacing.largeLateralPaddingValue),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DUI.text.title2(context, 'Colors'),
                    DUI.spacing.spacer(small: true),
                    GridView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: availableColors.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: DUI.spacing.lateralPaddingValue,
                            mainAxisSpacing: DUI.spacing.lateralPaddingValue,
                            childAspectRatio: 0.65),
                        itemBuilder: (BuildContext context, int index) {
                          var key = availableColors.keys.elementAt(index);
                          return showCaseBlock(
                              Container(
                                height: 44,
                                width: 44,
                                decoration: BoxDecoration(
                                    color: key, borderRadius: BorderRadius.circular(DUI.spacing.smallBorderRadius)),
                              ),
                              title: availableColors.values.elementAt(index),
                              largePadding: false);
                        }),
                    DUI.spacing.divider(context),
                  ],
                ),
              ),
              Container(
                key: key3,
                padding: EdgeInsets.all(DUI.spacing.largeLateralPaddingValue),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DUI.text.title2(context, 'Spacing and Dividers'),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        Column(
                          children: [
                            Container(
                              height: 24,
                              width: 24,
                              color: DUI.color.primary,
                            ),
                            DUI.spacing.spacer(),
                            Container(
                              height: 24,
                              width: 24,
                              color: DUI.color.primary,
                            ),
                          ],
                        ),
                        title: "Regular Spacer"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        Column(
                          children: [
                            Container(
                              height: 24,
                              width: 24,
                              color: DUI.color.primary,
                            ),
                            DUI.spacing.spacer(small: true),
                            Container(
                              height: 24,
                              width: 24,
                              color: DUI.color.primary,
                            ),
                          ],
                        ),
                        title: "Small Spacer"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 24,
                              width: 24,
                              color: DUI.color.primary,
                            ),
                            DUI.spacing.hSpacer(),
                            Container(
                              height: 24,
                              width: 24,
                              color: DUI.color.primary,
                            ),
                          ],
                        ),
                        title: "Regular HSpacer"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 24,
                              width: 24,
                              color: DUI.color.primary,
                            ),
                            DUI.spacing.hSpacer(small: true),
                            Container(
                              height: 24,
                              width: 24,
                              color: DUI.color.primary,
                            ),
                          ],
                        ),
                        title: "Small HSpacer"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(DUI.spacing.divider(context), title: "Horizontal Divider"),
                    showCaseBlock(DUI.spacing.verticalDivider(context, 24), title: "Vertical Divider"),
                    showCaseBlock(DUI.spacing.dottedDivider(context), title: "Dotted Divider"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: DUI.color.primary,
                                    borderRadius: BorderRadius.circular(DUI.spacing.smallBorderRadius))),
                            DUI.spacing.hSpacer(),
                            Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: DUI.color.primary,
                                    borderRadius: BorderRadius.circular(DUI.spacing.borderRadius))),
                            DUI.spacing.hSpacer(),
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: DUI.color.primary,
                                  borderRadius: BorderRadius.circular(DUI.spacing.largeBorderRadius)),
                            ),
                            DUI.spacing.hSpacer(small: true),
                          ],
                        ),
                        title: "Border Radius (Small, Regular, Large)"),
                    DUI.spacing.divider(context),
                  ],
                ),
              ),
              Container(
                key: key5,
                padding: EdgeInsets.all(DUI.spacing.largeLateralPaddingValue),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DUI.text.title2(context, 'Text Fields and Inputs'),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            DUI.input.textField("Email address", TextEditingController(), FocusNode(), context,
                                suffixIcon: Icon(Icons.add), prefixIcon: Icon(Icons.add), helpMessage: "Help message"),
                            DUI.spacing.spacer(small: true),
                            DUI.input.textField(
                                "Password", TextEditingController(text: "Password"), FocusNode(), context,
                                obscure: true),
                            DUI.spacing.spacer(small: true),
                            DUI.input.textField("Email address", TextEditingController(), FocusNode(), context,
                                enabled: false, helpMessage: "Help message"),
                            DUI.spacing.spacer(small: true),
                            DUI.input.textField(
                                "Email address", TextEditingController(text: 'alex@dribba.com'), FocusNode(), context,
                                enabled: false, helpMessage: "Help message"),
                            DUI.spacing.spacer(small: true),
                            DUI.input.textField("Email address", TextEditingController(), FocusNode(), context,
                                error: "Error", helpMessage: "Help message"),
                          ],
                        ),
                        title: "Regular"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        DUI.input.smallTextField(TextEditingController(), FocusNode(), context, hint: 'Email address'),
                        title: "Small"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            DUI.input.searchField("Email address", TextEditingController(), FocusNode(), context),
                            DUI.spacing.spacer(small: true),
                            DUI.input.searchField(
                                "Email address", TextEditingController(text: 'info@dribba.com'), FocusNode(), context,
                                loading: true),
                            DUI.spacing.spacer(small: true),
                            DUI.input.searchField("Email address", TextEditingController(), FocusNode(), context,
                                loading: true, enabled: false),
                          ],
                        ),
                        title: "Search"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            DUI.input.chatInputField(context, "Email address", TextEditingController(), FocusNode()),
                          ],
                        ),
                        title: "Chat Input"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            DUI.input.phoneTextField(context, "Número de teléfono", TextEditingController(),
                                FocusNode(), "+34", (prefix) {}),
                          ],
                        ),
                        title: "Phone Input"),
                    DUI.spacing.divider(context),
                  ],
                ),
              ),
              Container(
                key: key6,
                padding: EdgeInsets.all(DUI.spacing.largeLateralPaddingValue),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DUI.text.title2(context, 'Buttons'),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        DUI.button.starRating(context, starRating, iconSize: 40, spacing: 4, onChange: (double rating) {
                          setState(() {
                            starRating = rating;
                          });
                        }),
                        title: "Star rating"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        Column(
                          children: [
                            DUI.button.button(context, "Log In", () {
                              setState(() {
                                loading = !loading;
                                Future.delayed(Duration(seconds: 2), () {
                                  setState(() {
                                    loading = !loading;
                                  });
                                });
                              });
                            }, loading: loading),
                            DUI.spacing.spacer(),
                            DUI.button.button(context, "Log In", null, loading: loading),
                          ],
                        ),
                        title: "Regular"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        Column(
                          children: [
                            DUI.button.shadowButton(context, "Log In", () {
                              setState(() {
                                loading = !loading;
                                Future.delayed(Duration(seconds: 2), () {
                                  setState(() {
                                    loading = !loading;
                                  });
                                });
                              });
                            }, loading: loading),
                            DUI.spacing.spacer(),
                            DUI.button.shadowButton(context, "Log In", null, loading: loading),
                          ],
                        ),
                        title: "Shadow"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        Column(
                          children: [
                            DUI.button.noBgButton(context, "Log In", () {
                              setState(() {
                                loading = !loading;
                                Future.delayed(Duration(seconds: 2), () {
                                  setState(() {
                                    loading = !loading;
                                  });
                                });
                              });
                            }, loading: loading),
                            DUI.spacing.spacer(),
                            DUI.button.noBgButton(context, "Log In", null, loading: loading),
                          ],
                        ),
                        title: "No BG Button"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        Column(
                          children: [
                            DUI.button.outlineButton(context, "Log In", () {
                              setState(() {
                                loading = !loading;
                                Future.delayed(Duration(seconds: 2), () {
                                  setState(() {
                                    loading = !loading;
                                  });
                                });
                              });
                            }, loading: loading),
                            DUI.spacing.spacer(),
                            DUI.button.outlineButton(context, "Log In", null, loading: loading),
                          ],
                        ),
                        title: "Outline Button"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        Column(
                          children: [
                            DUI.button.smallButton(context, "Log In with Dribba", () {
                              setState(() {
                                loading = !loading;
                                Future.delayed(Duration(seconds: 2), () {
                                  setState(() {
                                    loading = !loading;
                                  });
                                });
                              });
                            }, loading: loading),
                            DUI.spacing.spacer(),
                            DUI.button.smallButton(context, "Log In with Dribba", null, loading: loading),
                          ],
                        ),
                        title: "Small Button"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(DUI.button.buttonQtyLeading(context, 2), title: "Button Quantity Leading"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        DUI.button.buttonPriceTrailing(context, 22.50, freeText: "Free", amountInEurosText: "%@ Euros"),
                        title: "Button Price Trailing",
                        backgroundColor: DUI.color.primary),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        DUI.button.buttonMinPriceWidget(context,
                            minPrice: 22.5, currentPrice: 10.0, addMoreToRequestText: "Add more to order"),
                        title: "Button Min Price",
                        backgroundColor: DUI.color.primary),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            DUI.button.iconButton(
                              context,
                              Icons.camera_alt,
                            ),
                            DUI.spacing.hSpacer(),
                            DUI.button.iconButton(context, Icons.shopping_bag, filled: true),
                          ],
                        ),
                        title: "Icon Button (No-Filled & Filled)"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        DUI.button.backButtonCircle(
                          context,
                        ),
                        title: "Back Button Circle"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        Column(
                          children: [
                            DUI.button.appBarActionButtonCircle(context, Icons.compare_arrows),
                            DUI.spacing.hSpacer(),
                            DUI.button.appBarActionButtonCircle(context, Icons.compare_arrows, loading: true),
                          ],
                        ),
                        title: "AppBar Action Button Circle"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DUI.button.checkbox(true, (value) {}, context),
                            DUI.spacing.hSpacer(),
                            DUI.button.checkbox(false, (value) {}, context),
                          ],
                        ),
                        title: "Checkbox"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(DUI.button.toggle(true, (value) {}, context), title: "Toggle"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        DUI.button.slidingControl(
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
                                    Icon(Icons.directions_bike_rounded),
                                    DUI.spacing.hSpacer(small: true),
                                    DUI.text.regular(context, 'Tab 1',
                                        color: Theme.of(context).textTheme.bodyMedium!.color!, bold: true)
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
                                    Icon(Icons.directions_bike_rounded),
                                    DUI.spacing.hSpacer(small: true),
                                    DUI.text.regular(context, 'Tab 2',
                                        color: Theme.of(context).textTheme.bodyMedium!.color!, bold: true)
                                  ],
                                ),
                              ],
                            ),
                          },
                          isStretch: true,
                        ),
                        title: "Segment Bar",
                        largePadding: false),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        DUI.button.slidingControl(0, (value) {}, context,
                            children: {
                              0: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(Icons.directions_bike_rounded),
                                ],
                              ),
                              1: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.directions_bike_rounded),
                                ],
                              ),
                            },
                            isStretch: false,
                            height: 44),
                        title: "Segment Bar (Small)",
                        largePadding: false),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(DUI.button.dataSelector(context, "Pau Casals, 6", "Where do we deliver it?", () {}),
                        title: "Data Selector"),
                    DUI.spacing.divider(context),
                  ],
                ),
              ),
              Container(
                key: key7,
                padding: EdgeInsets.all(DUI.spacing.largeLateralPaddingValue),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DUI.text.title2(context, 'Skeleton Loading'),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        SizedBox(
                          height: 90,
                          child: DUI.skeleton.emptyRegularTileList(context),
                        ),
                        title: "Empty Regular Tile List"),
                    DUI.spacing.divider(context),
                  ],
                ),
              ),
              Container(
                key: key9,
                padding: EdgeInsets.all(DUI.spacing.largeLateralPaddingValue),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DUI.text.title2(context, 'Tiles'),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        Column(
                          children: [
                            DUI.tile.listTile('Title', context, () {}),
                            DUI.spacing.divider(context),
                            DUI.tile.listTile('Loading Tile', context, () {}, loading: true),
                            DUI.spacing.divider(context),
                            DUI.tile.listTile(
                              'Loading Tile',
                              context,
                              () {},
                              trailing: const SizedBox.shrink(),
                              loading: true,
                              leading: Icon(Icons.directions_bike_rounded),
                            )
                          ],
                        ),
                        title: "Tile with Title"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        Column(
                          children: [
                            DUI.tile.listTileWithSub('Title', context, 'Subtitle', onTap: () {}),
                            DUI.spacing.divider(context),
                            DUI.tile.listTileWithSub(
                              'Title',
                              context,
                              'Subtitle',
                              leading: Icon(Icons.directions_bike_rounded),
                            ),
                          ],
                        ),
                        title: "Tile with Subtitle"),
                    showCaseBlock(
                        Column(
                          children: [
                            DUI.tile.listTileCustomImage(
                                Icon(Icons.directions_bike_rounded), context, 'Click me and get free bags!', () {}),
                          ],
                        ),
                        title: "Tile with Custom Image"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        Column(
                          children: [
                            DUI.tile.squareTile(
                              context,
                              title: "Tips",
                              value: "25",
                              icon: Icons.ac_unit_sharp,
                            ),
                            DUI.spacing.spacer(),
                            DUI.tile.squareTile(context, title: "Total KM", value: "25,57 €", icon: Icons.ac_unit_sharp,
                                onInfoTap: () {
                              Alert.showAlert('Hello', 'Hello', context, okText: 'Ok');
                            }),
                            DUI.spacing.spacer(),
                            DUI.tile.squareTile(context, title: "Total KM", icon: Icons.ac_unit_sharp, onInfoTap: () {
                              Alert.showAlert('Hello', 'Hello', context, okText: 'Ok');
                            }),
                            DUI.spacing.spacer(),
                            Row(
                              children: [
                                Expanded(
                                  child: DUI.tile.squareTile(context,
                                      title: "2h", subtitle: "As soon as possible", selected: true),
                                ),
                                DUI.spacing.hSpacer(),
                                Expanded(
                                  child:
                                      DUI.tile.squareTile(context, title: "Schedule", subtitle: "Select date and hour"),
                                ),
                              ],
                            )
                          ],
                        ),
                        title: "Value + Date Tile"),
                    DUI.spacing.divider(context),
                  ],
                ),
              ),
              Container(
                key: key10,
                padding: EdgeInsets.all(DUI.spacing.largeLateralPaddingValue),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DUI.text.title2(context, 'Badges'),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            DUI.badge.badgeSolid(context, 'Business closed'),
                            DUI.spacing.hSpacer(),
                            DUI.badge
                                .badgeSolid(context, 'Business closed', icon: Icons.shop, color: BadgeColor.secondary),
                          ],
                        ),
                        title: "Badge Solid"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            DUI.badge.badgeOutline(context, 'Business closed'),
                            DUI.spacing.hSpacer(),
                            DUI.badge.badgeOutline(context, 'Business closed',
                                icon: Icons.shop, color: BadgeColor.secondary),
                          ],
                        ),
                        title: "Badge Outline"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                DUI.badge.tagSolid(context, 'Click Me!', onTap: () {
                                  Alert.showAlertYesNo(
                                    "You clicked me!",
                                    "You perv...",
                                    () {},
                                    context,
                                    onYesText: 'Yes',
                                    onNoText: 'No',
                                  );
                                }),
                                DUI.spacing.hSpacer(),
                                DUI.badge.tagSolid(context, 'Click Me!',
                                    icon: Icons.ac_unit_sharp, color: BadgeColor.secondary, onTap: () {}),
                              ],
                            ),
                            DUI.spacing.spacer(small: true),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                DUI.badge.tagSolid(context, 'Click Me!', onDelete: () {}, onTap: () {
                                  Alert.showAlert(
                                    "You clicked me!",
                                    "You perv...",
                                    context,
                                    okText: 'OK',
                                  );
                                }),
                                DUI.spacing.hSpacer(),
                                DUI.badge.tagSolid(context, 'Click Me!',
                                    icon: Icons.ac_unit_sharp, color: BadgeColor.secondary, onDelete: () {}, onTap: () {
                                  Alert.showAlert(
                                    "You clicked me!",
                                    "You perv...",
                                    context,
                                    okText: 'OK',
                                  );
                                }),
                              ],
                            ),
                          ],
                        ),
                        title: "Tag Solid"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                DUI.badge.tagOutline(context, 'Click Me!', onTap: () {
                                  Alert.showAlert(
                                    "You clicked me!",
                                    "You perv...",
                                    context,
                                    okText: 'OK',
                                  );
                                }),
                                DUI.spacing.hSpacer(),
                                DUI.badge.tagOutline(context, 'Click Me!',
                                    icon: Icons.ac_unit_sharp, color: BadgeColor.secondary, onTap: () {
                                  Alert.showAlert(
                                    "You clicked me!",
                                    "You perv...",
                                    context,
                                    okText: 'OK',
                                  );
                                }),
                              ],
                            ),
                            DUI.spacing.spacer(small: true),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                DUI.badge.tagOutline(context, 'Click Me!', onDelete: () {}, onTap: () {
                                  Alert.showAlert(
                                    "You clicked me!",
                                    "You perv...",
                                    context,
                                    okText: 'OK',
                                  );
                                }),
                                DUI.spacing.hSpacer(),
                                DUI.badge.tagOutline(context, 'Click Me!',
                                    icon: Icons.ac_unit_sharp, color: BadgeColor.secondary, onDelete: () {}, onTap: () {
                                  Alert.showAlert(
                                    "You clicked me!",
                                    "You perv...",
                                    context,
                                    okText: 'OK',
                                  );
                                }),
                              ],
                            ),
                          ],
                        ),
                        title: "Tag Outline"),
                    DUI.spacing.spacer(small: true),
                    DUI.spacing.divider(context),
                  ],
                ),
              ),
              Container(
                key: key11,
                padding: EdgeInsets.all(DUI.spacing.largeLateralPaddingValue),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DUI.text.title2(context, 'Misc'),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(DUI.misc.spanWithBoldTitle(context, 'La teva comanda a ', 'Ginza41'),
                        title: "Span with Bold Title"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        DUI.button.smallButton(context, 'Obrir Bottom Picker', () {
                          DUI.misc.bottomSheetPicker(
                              context,
                              'Demo Picker',
                              'Demo Picker ',
                              DUI.picker.calendar(
                                context,
                                (initDate, lastDate) {},
                                calendarMode: CalendarMode.single,
                                selectedDates: [
                                  DateTime.now().add(Duration(days: 2)),
                                ],
                                disableWeekends: true,
                              ), onButtonPressed: () {
                            Navigator.pop(context);
                          }, onDismissPressed: () {
                            Navigator.pop(context);
                          }, buttonText: 'Acceptar', dismissText: 'Cancel.lar');
                        }),
                        title: "Bottom Picker"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                            height: 100,
                            color: Colors.white,
                            child: Stack(
                              children: [
                                Center(child: DUI.text.title1(context, 'Glass Container', color: Colors.black)),
                                DUI.misc.glassContainer(densityMultiplier: 1, glassTintColor: Colors.blue),
                              ],
                            ),
                          ),
                        ),
                        title: "Glass container"),
                    DUI.spacing.divider(context),
                  ],
                ),
              ),
              Container(
                key: key13,
                padding: EdgeInsets.all(DUI.spacing.largeLateralPaddingValue),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DUI.text.title2(context, 'Pickers'),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        Column(
                          children: [
                            DUI.picker.calendar(
                              context,
                              (initDate, lastDate) {},
                              calendarMode: CalendarMode.single,
                              selectedDates: [
                                DateTime.now().add(Duration(days: 2)),
                              ],
                              disableWeekends: true,
                            ),
                          ],
                        ),
                        title: "Single Calendar Picker (Disabled Weekends)"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        Column(
                          children: [
                            DUI.picker.calendar(
                              context,
                              (initDate, lastDate) {},
                              showToday: false,
                              calendarMode: CalendarMode.range,
                              selectedDates: [
                                DateTime.now().add(Duration(days: 2)),
                                DateTime.now().add(Duration(days: 5))
                              ],
                            ),
                          ],
                        ),
                        title: "Range Calendar Picker"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        Column(
                          children: [
                            DUI.picker.calendar(
                              context,
                              (initDate, lastDate) {},
                              calendarMode: CalendarMode.single,
                              disableWeekends: true,
                              disabledDates: [
                                DateTime.now().add(Duration(days: 2)),
                                DateTime.now().add(Duration(days: 5))
                              ],
                              disabledDays: [DateTime.monday, DateTime.thursday],
                              selectedDates: [],
                            ),
                          ],
                        ),
                        title: "Calendar Picker (Disabled Options)"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        Column(children: [
                          DUI.picker.textScrollPicker(context, ['Test', 'Test', 'Test', 'Test'], (value) {}),
                        ]),
                        title: "Text Scroll Picker"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        Column(children: [
                          DUI.picker.dateTimeScrollPicker(
                              context,
                              [
                                DateTime.now(),
                                DateTime.now().add(Duration(days: 1)),
                                DateTime.now().add(Duration(days: 2))
                              ],
                              [
                                TimeOfDay(hour: 12, minute: 0),
                                TimeOfDay(hour: 12, minute: 1),
                                TimeOfDay(hour: 12, minute: 2),
                                TimeOfDay(hour: 12, minute: 3),
                                TimeOfDay(hour: 12, minute: 4),
                              ],
                              onDateSelected: (selected) {},
                              onTimeSelected: (selected) {}),
                        ]),
                        title: "DateTime Scroll Picker"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        Column(children: [
                          DUI.picker.dateScrollPicker(
                              context,
                              [
                                DateTime.now(),
                                DateTime.now().add(Duration(days: 1)),
                                DateTime.now().add(Duration(days: 2))
                              ],
                              onDateSelected: (selected) {}),
                          DUI.spacing.spacer(small: true),
                        ]),
                        title: "Date Picker"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        Column(children: [
                          DUI.picker.timeScrollPicker(
                              context,
                              [
                                TimeOfDay(hour: 11, minute: 15),
                                TimeOfDay(hour: 11, minute: 30),
                                TimeOfDay(hour: 11, minute: 45),
                                TimeOfDay(hour: 12, minute: 00),
                                TimeOfDay(hour: 12, minute: 15),
                              ],
                              onTimeSelected: (selected) {})
                        ]),
                        title: "Time Picker"),
                    DUI.spacing.spacer(small: true),
                    showCaseBlock(
                        Column(children: [
                          DUI.picker.timeRangeScrollPicker(
                              context,
                              [
                                TimeOfDay(hour: 11, minute: 15),
                                TimeOfDay(hour: 11, minute: 30),
                                TimeOfDay(hour: 11, minute: 45),
                                TimeOfDay(hour: 12, minute: 00),
                                TimeOfDay(hour: 12, minute: 15),
                              ],
                              timeRange: Duration(minutes: 80),
                              onTimeSelected: (selected) {})
                        ]),
                        title: "Time Picker"),
                    DUI.spacing.divider(context),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  showCaseBlock(Widget content, {String? title, bool largePadding = true, Color backgroundColor = Colors.white}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GridPaper(
          color: DUI.color.grey.withOpacity(0.1),
          divisions: 2,
          subdivisions: 2,
          interval: 24,
          child: Container(
            padding: EdgeInsets.only(left: 12, right: 12, top: largePadding ? 24 : 12, bottom: largePadding ? 24 : 12),
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(DUI.spacing.smallBorderRadius)),
            child: Center(
              child: content,
            ),
          ),
        ),
        title != null ? DUI.spacing.spacer(small: true) : const SizedBox.shrink(),
        title != null
            ? DUI.text.xs(context, title, color: Theme.of(context).textTheme.bodyMedium!.color, bold: true, maxLines: 1)
            : const SizedBox.shrink(),
        title != null ? DUI.spacing.spacer() : const SizedBox.shrink(),
      ],
    );
  }
}
