import 'package:flutter/material.dart';
import 'package:news/utils/settings.dart';

import '../utils/globals.dart';

class MySettingsPage extends StatefulWidget {
  const MySettingsPage({Key? key}) : super(key: key);

  @override
  State<MySettingsPage> createState() => _MySettingsPageState();
}

class _MySettingsPageState extends State<MySettingsPage> {
  String? _countryCode;
  String? _language;

  List<String> countryCodes = [
    "ar",
    "au",
    "at",
    "be",
    "br",
    "bg",
    "ca",
    "cn",
    "co",
    "cu",
    "cz",
    "eg",
    "fr",
    "de",
    "gr",
    "hk",
    "hu",
    "in",
    "id",
    "ie",
    "il",
    "it",
    "jp",
    "lv",
    "lb",
    "lt",
    "my",
    "mx",
    "ma",
    "nl",
    "nz",
    "ng",
    "kp",
    "no",
    "pk",
    "ph",
    "pl",
    "pt",
    "ro",
    "ru",
    "sa",
    "rs",
    "sg",
    "sk",
    "si",
    "za",
    "kr",
    "es",
    "se",
    "ch",
    "tw",
    "th",
    "tr",
    "ua",
    "ae",
    "gb",
    "us",
    "ve"
  ];

  final List<String> languages = [
    "ar",
    "bs",
    "bg",
    "zh",
    "hr",
    "cs",
    "nl",
    "en",
    "fr",
    "de",
    "el",
    "he",
    "hi",
    "hu",
    "in",
    "it",
    "jp",
    "ko",
    "lv",
    "lt",
    "ms",
    "no",
    "pl",
    "pt",
    "ro",
    "ru",
    "sr",
    "sk",
    "sl",
    "es",
    "sv",
    "th",
    "tr",
    "uk",
  ];

  @override
  void initState() {
    super.initState();
    _fillPreferences();
    countryCodes.sort((a, b) {
      return a.compareTo(b);
    });
    languages.sort((a, b) {
      return a.compareTo(b);
    });
  }

  void _fillPreferences() async {
    final tempCc = await Settings.getCountryCode();
    final tempL = await Settings.getLanguage();
    setState(() {
      _countryCode = tempCc;
      _language = tempL;
    });
  }

  void _setCountryCode(String? code) async {
    if (code != null) {
      await Settings.setCountryCode(code);
      setState(() {
        _countryCode = code;
      });
      SettingsGlobals.countryCode = code;
    }
  }

  void _setLanguage(String? lang) async {
    if (lang != null) {
      await Settings.setLanguage(lang);
      setState(() {
        _language = lang;
      });
      SettingsGlobals.language = lang;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height / 3,
              pinned: true,
              centerTitle: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  "Settings",
                  style: TextStyle(
                    fontFamily: "BlackOpsOne",
                    fontSize: 30,
                    color: MediaQuery.of(context).platformBrightness ==
                            Brightness.light
                        ? const Color(0xff061a41)
                        : const Color(0xffe7e6e9),
                  ),
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Text(
                        "Country code",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: MediaQuery.of(context).platformBrightness ==
                                  Brightness.light
                              ? const Color(0x0C000000)
                              : const Color(0x0fffffff),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButton(
                          value: _countryCode ?? "in",
                          items: countryCodes.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items.toUpperCase()),
                            );
                          }).toList(),
                          onChanged: (code) {
                            _setCountryCode(code.toString());
                          },
                          underline: const SizedBox(),
                          style: Theme.of(context).textTheme.bodyText1,
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 32,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Text(
                        "Language",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: MediaQuery.of(context).platformBrightness ==
                                  Brightness.light
                              ? const Color(0x0C000000)
                              : const Color(0x0fffffff),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButton(
                          value: _language ?? "en",
                          items: languages.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items.toUpperCase()),
                            );
                          }).toList(),
                          onChanged: (lang) {
                            _setLanguage(lang.toString());
                          },
                          underline: const SizedBox(),
                          style: Theme.of(context).textTheme.bodyText1,
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 32,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
