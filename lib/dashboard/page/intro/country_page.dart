import 'package:btccloudmining/ad_modual/small_native.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/textstyles.dart';
import 'package:btccloudmining/utils/app_navigation/app_navigation.dart';
import 'package:btccloudmining/utils/app_navigation/navigation.dart';
import 'package:btccloudmining/widget/blinking_dot.dart';
import 'package:btccloudmining/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({super.key});

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  int? selectCountry;
  TextEditingController searchController = TextEditingController();
  List<dynamic> filteredList = [];

  @override
  void initState() {
    filteredList = countryList;
    searchController.addListener(_onSearchChanged);
    super.initState();
  }

  void _onSearchChanged() {
    String query = searchController.text.toLowerCase();
    selectCountry = -1;
    setState(() {
      filteredList = countryList
          .where((country) => (country['common'] ?? '').toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.newBg,
      appBar: buildCustomAppBar(
        context,
        leadingIcon: false,
        title: 'Select Country',
        actions: [
          IconButton(
            onPressed: () {
              Navigation.pushNamed(Routes.languagePage, arg: {'page': 'country'});
            },
            icon: Icon(FontAwesomeIcons.arrowRightLong, color: AppColor.white),
          ),
        ],
      ),
      body: Column(
        children: [
          15.heightBox,
          CommonTextField(
            controller: searchController,
            hintText: 'Search Country',
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 10, right: 5),
              child: Icon(Icons.search, size: 22, color: Color(0xFF6C6F87)),
            ),
            prefixIconConstraints: BoxConstraints(minHeight: 15),
          ),
          20.heightBox,
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: filteredList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.1,
              ),
              itemBuilder: (context, index) {
                final team = filteredList[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      FocusManager.instance.primaryFocus?.unfocus();
                      selectCountry = index;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColor.card),
                      color: selectCountry == index ? AppColor.thirdCard : AppColor.newCard,

                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 25,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              image: DecorationImage(
                                image: NetworkImage('${team['png']}'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 7),
                          Text(
                            '${team['common']}',
                            textAlign: TextAlign.center,
                            style: textRoboto(
                              context,
                              color: selectCountry == index ? AppColor.white : AppColor.text,
                              fontWeight: selectCountry == index ? FontWeight.w600 : FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ).px(15),
      bottomNavigationBar: SafeArea(child: SmallNative()),

    );
  }

  final countryList = [
    {
      "png": "https://flagcdn.com/w320/us.png",
      "common": "United States",
    },
    {
      "png": "https://flagcdn.com/w320/ch.png",
      "common": "Switzerland",
    },
    {
      "png": "https://flagcdn.com/w320/ca.png",
      "common": "Canada",
    },
    {
      "png": "https://flagcdn.com/w320/gb.png",
      "common": "United Kingdom",
    },
    {
      "png": "https://flagcdn.com/w320/ng.png",
      "common": "Nigeria",
    },
    {
      "png": "https://flagcdn.com/w320/ph.png",
      "common": "Philippines",
    },
    {
      "png": "https://flagcdn.com/w320/id.png",
      "common": "Indonesia",
    },
    {
      "png": "https://flagcdn.com/w320/de.png",
      "common": "Germany",
    },
    {
      "png": "https://flagcdn.com/w320/ae.png",
      "common": "United Arab Emirates",
    },
    {
      "png": "https://flagcdn.com/w320/sa.png",
      "common": "Saudi Arabia",
    },
    {
      "png": "https://flagcdn.com/w320/ua.png",
      "common": "Ukraine",
    },
    {
      "png": "https://flagcdn.com/w320/vn.png",
      "common": "Vietnam",
    },
    {
      "png": "https://flagcdn.com/w320/th.png",
      "common": "Thailand",
    },
    {
      "png": "https://flagcdn.com/w320/ma.png",
      "common": "Morocco",
    },
    {
      "png": "https://flagcdn.com/w320/uz.png",
      "common": "Uzbekistan",
    },
    {
      "png": "https://flagcdn.com/w320/my.png",
      "common": "Malaysia",
    },
    {
      "png": "https://flagcdn.com/w320/is.png",
      "common": "Iceland",
    },
    {
      "png": "https://flagcdn.com/w320/tr.png",
      "common": "Turkey",
    },
    {
      "png": "https://flagcdn.com/w320/eg.png",
      "common": "Egypt",
    },
    {
      "png": "https://flagcdn.com/w320/ar.png",
      "common": "Argentina",
    },
    {
      "png": "https://flagcdn.com/w320/lb.png",
      "common": "Lebanon",
    },
    {
      "png": "https://flagcdn.com/w320/no.png",
      "common": "Norway",
    },
    {
      "png": "https://flagcdn.com/w320/mx.png",
      "common": "Mexico",
    },
    {
      "png": "https://flagcdn.com/w320/dk.png",
      "common": "Denmark",
    },
    {
      "png": "https://flagcdn.com/w320/ee.png",
      "common": "Estonia",
    },
    {
      "png": "https://flagcdn.com/w320/fi.png",
      "common": "Finland",
    },
    {
      "png": "https://flagcdn.com/w320/fr.png",
      "common": "France",
    },
    {
      "png": "https://flagcdn.com/w320/gr.png",
      "common": "Greece",
    },
    {
      "png": "https://flagcdn.com/w320/hu.png",
      "common": "Hungary",
    },
    {
      "png": "https://flagcdn.com/w320/ie.png",
      "common": "Ireland",
    },
    {
      "png": "https://flagcdn.com/w320/it.png",
      "common": "Italy",
    },
    {
      "png": "https://flagcdn.com/w320/lv.png",
      "common": "Latvia",
    },
    {
      "png": "https://flagcdn.com/w320/lt.png",
      "common": "Lithuania",
    },
    {
      "png": "https://flagcdn.com/w320/lu.png",
      "common": "Luxembourg",
    },
    {
      "png": "https://flagcdn.com/w320/mt.png",
      "common": "Malta",
    },
    {
      "png": "https://flagcdn.com/w320/nl.png",
      "common": "Netherlands",
    },
    {
      "png": "https://flagcdn.com/w320/pl.png",
      "common": "Poland",
    },
    {
      "png": "https://flagcdn.com/w320/pt.png",
      "common": "Portugal",
    },
    {
      "png": "https://flagcdn.com/w320/ro.png",
      "common": "Romania",
    },
    {
      "png": "https://flagcdn.com/w320/sk.png",
      "common": "Slovakia",
    },
    {
      "png": "https://flagcdn.com/w320/si.png",
      "common": "Slovenia",
    },
    {
      "png": "https://flagcdn.com/w320/es.png",
      "common": "Spain",
    },
    {
      "png": "https://flagcdn.com/w320/se.png",
      "common": "Sweden",
    },
    {
      "png": "https://flagcdn.com/w320/jp.png",
      "common": "Japan",
    },
  ];

}
