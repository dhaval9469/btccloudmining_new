import 'package:btccloudmining/ad_modual/native/native_banner.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/utils/app_navigation/app_navigation.dart';
import 'package:btccloudmining/utils/app_navigation/navigation.dart';
import 'package:btccloudmining/widget/blinking_dot.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    setState(() {
      filteredList = countryList.where((c) => (c['common'] ?? '').toLowerCase().contains(query)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
      },
      child: Scaffold(
        backgroundColor: AppColor.newBg,
        appBar: buildCustomAppBar(
          context,
          leadingIcon: false,
          title: 'Select Country',
          actions: [
            GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
                Navigation.pushNamed(Routes.cLanPage);
              },
              child: const Icon(Icons.east_rounded, size: 24, color: Colors.white),
            ),
            10.widthBox,
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.heightBox,
            TextFormField(
              controller: searchController,
              cursorColor: AppColor.accentColor,
              style: GoogleFonts.urbanist(color: AppColor.primaryTextColor, fontSize: 15, fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: AppColor.newCard,

                prefixIcon: const Icon(Icons.search_rounded, color: AppColor.secondaryTextColor, size: 20),

                hintText: "Search country...",
                hintStyle: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500, color: AppColor.secondaryTextColor),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColor.divider),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: AppColor.divider, width: 1.3),
                ),

                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: AppColor.divider),
                ),

                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: AppColor.divider, width: 1.3),
                ),
              ),
            ).px(15),
            8.heightBox,

            Expanded(
              child: filteredList.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.public_off_rounded, size: 42, color: Colors.white.withValues(alpha: 0.25)),
                          const SizedBox(height: 12),
                          Text(
                            "No country found",
                            style: GoogleFonts.poppins(
                              color: AppColor.secondaryTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                      itemCount: filteredList.length,
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 24),
                      separatorBuilder: (_, _) => const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final country = filteredList[index];
                        final bool isSelected = selectCountry == index;

                        return GestureDetector(
                          onTap: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            setState(() {
                              selectCountry = index;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: isSelected ? AppColor.primaryButton : AppColor.newCard,
                              border: Border.all(color: isSelected ? AppColor.primaryButton : AppColor.divider),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: isSelected ? Colors.white : AppColor.surfaceLightColor,
                                    border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
                                  ),
                                  child: ClipOval(
                                    child: Image.network(
                                      country['png'],
                                      height: 33,
                                      width: 33,
                                      fit: BoxFit.cover,
                                      errorBuilder: (_, _, _) {
                                        return const Icon(Icons.public_rounded, color: AppColor.secondaryTextColor, size: 20);
                                      },
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 13),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        country['common'],
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          color: isSelected ? AppColor.text : AppColor.subText,
                                          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        isSelected ? "Selected country" : "Tap to select",
                                        style: GoogleFonts.poppins(
                                          fontSize: 11.5,
                                          fontWeight: FontWeight.w400,
                                          color: isSelected ? AppColor.text : AppColor.subText,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 200),
                                  child: isSelected
                                      ? const Icon(
                                          Icons.check_circle_rounded,
                                          key: ValueKey("selected"),
                                          color: Colors.white,
                                          size: 23,
                                        )
                                      : Icon(
                                          Icons.circle_outlined,
                                          key: const ValueKey("unselected"),
                                          color: Colors.white.withValues(alpha: 0.20),
                                          size: 22,
                                        ),
                                ),
                              ],
                            ).pSymmetric(v: 7, h: 12),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
        bottomNavigationBar: SafeArea(child: NativeBanner()),
      ),
    );
  }

  final countryList = [
    {"png": "https://flagcdn.com/w320/us.png", "common": "United States"},
    {"png": "https://flagcdn.com/w320/gb.png", "common": "United Kingdom"},
    {"png": "https://flagcdn.com/w320/ca.png", "common": "Canada"},
    {"png": "https://flagcdn.com/w320/ch.png", "common": "Switzerland"},
    {"png": "https://flagcdn.com/w320/my.png", "common": "Malaysia"},
    {"png": "https://flagcdn.com/w320/id.png", "common": "Indonesia"},
    {"png": "https://flagcdn.com/w320/ng.png", "common": "Nigeria"},
    {"png": "https://flagcdn.com/w320/ua.png", "common": "Ukraine"},
    {"png": "https://flagcdn.com/w320/vn.png", "common": "Vietnam"},
    {"png": "https://flagcdn.com/w320/th.png", "common": "Thailand"},
    {"png": "https://flagcdn.com/w320/sg.png", "common": "Singapore"},
    {"png": "https://flagcdn.com/w320/sa.png", "common": "Saudi Arabia"},
    {"png": "https://flagcdn.com/w320/ae.png", "common": "United Arab Emirates"},
    {"png": "https://flagcdn.com/w320/de.png", "common": "Germany"},
    {"png": "https://flagcdn.com/w320/fr.png", "common": "France"},
    {"png": "https://flagcdn.com/w320/it.png", "common": "Italy"},
    {"png": "https://flagcdn.com/w320/es.png", "common": "Spain"},
    {"png": "https://flagcdn.com/w320/be.png", "common": "Belgium"},
    {"png": "https://flagcdn.com/w320/pl.png", "common": "Poland"},
    {"png": "https://flagcdn.com/w320/fi.png", "common": "Finland"},
    {"png": "https://flagcdn.com/w320/br.png", "common": "Brazil"},
    {"png": "https://flagcdn.com/w320/pe.png", "common": "Peru"},
    {"png": "https://flagcdn.com/w320/in.png", "common": "India"},
    {"png": "https://flagcdn.com/w320/pk.png", "common": "Pakistan"},
    {"png": "https://flagcdn.com/w320/np.png", "common": "Nepal"},
    {"png": "https://flagcdn.com/w320/bd.png", "common": "Bangladesh"},
    {"png": "https://flagcdn.com/w320/ph.png", "common": "Philippines"},
    {"png": "https://flagcdn.com/w320/bh.png", "common": "Bahrain"},
    {"png": "https://flagcdn.com/w320/lk.png", "common": "Sri Lanka"},
    {"png": "https://flagcdn.com/w320/mx.png", "common": "Mexico"},
    {"png": "https://flagcdn.com/w320/qa.png", "common": "Qatar"},
    {"png": "https://flagcdn.com/w320/au.png", "common": "Australia"},
    {"png": "https://flagcdn.com/w320/jp.png", "common": "Japan"},
    {"png": "https://flagcdn.com/w320/ge.png", "common": "Georgia"},
    {"png": "https://flagcdn.com/w320/pt.png", "common": "Portugal"},
    {"png": "https://flagcdn.com/w320/nl.png", "common": "Netherlands"},
    {"png": "https://flagcdn.com/w320/lt.png", "common": "Lithuania"},
    {"png": "https://flagcdn.com/w320/dk.png", "common": "Denmark"},
    {"png": "https://flagcdn.com/w320/sk.png", "common": "Slovakia"},
    {"png": "https://flagcdn.com/w320/rs.png", "common": "Serbia"},
    {"png": "https://flagcdn.com/w320/is.png", "common": "Iceland"},
    {"png": "https://flagcdn.com/w320/gr.png", "common": "Greece"},
    {"png": "https://flagcdn.com/w320/hk.png", "common": "Hong Kong"},
    {
      "png":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_the_Taliban.svg/320px-Flag_of_the_Taliban.svg.png",
      "common": "Afghanistan",
    },
    {"png": "https://flagcdn.com/w320/kw.png", "common": "Kuwait"},
    {"png": "https://flagcdn.com/w320/tw.png", "common": "Taiwan"},
    {"png": "https://flagcdn.com/w320/no.png", "common": "Norway"},
    {"png": "https://flagcdn.com/w320/by.png", "common": "Belarus"},
    {"png": "https://flagcdn.com/w320/ee.png", "common": "Estonia"},
    {"png": "https://flagcdn.com/w320/xk.png", "common": "Kosovo"},
    {"png": "https://flagcdn.com/w320/sm.png", "common": "San Marino"},
    {"png": "https://flagcdn.com/w320/hr.png", "common": "Croatia"},
    {"png": "https://flagcdn.com/w320/mc.png", "common": "Monaco"},
    {"png": "https://flagcdn.com/w320/ad.png", "common": "Andorra"},
    {"png": "https://flagcdn.com/w320/mk.png", "common": "North Macedonia"},
    {"png": "https://flagcdn.com/w320/cz.png", "common": "Czechia"},
    {"png": "https://flagcdn.com/w320/al.png", "common": "Albania"},
    {"png": "https://flagcdn.com/w320/md.png", "common": "Moldova"},
    {"png": "https://flagcdn.com/w320/bg.png", "common": "Bulgaria"},
    {"png": "https://flagcdn.com/w320/me.png", "common": "Montenegro"},
    {"png": "https://flagcdn.com/w320/at.png", "common": "Austria"},
    {"png": "https://flagcdn.com/w320/ro.png", "common": "Romania"},
    {"png": "https://flagcdn.com/w320/hu.png", "common": "Hungary"},
    {"png": "https://flagcdn.com/w320/si.png", "common": "Slovenia"},
    {"png": "https://flagcdn.com/w320/li.png", "common": "Liechtenstein"},
    {"png": "https://flagcdn.com/w320/ie.png", "common": "Ireland"},
    {"png": "https://flagcdn.com/w320/ru.png", "common": "Russia"},
    {"png": "https://flagcdn.com/w320/se.png", "common": "Sweden"},
    {"png": "https://flagcdn.com/w320/lv.png", "common": "Latvia"},
    {"png": "https://flagcdn.com/w320/kg.png", "common": "Kyrgyzstan"},
    {"png": "https://flagcdn.com/w320/cn.png", "common": "China"},
    {"png": "https://flagcdn.com/w320/tr.png", "common": "Turkey"},
    {"png": "https://flagcdn.com/w320/tj.png", "common": "Tajikistan"},
    {"png": "https://flagcdn.com/w320/om.png", "common": "Oman"},
    {"png": "https://flagcdn.com/w320/iq.png", "common": "Iraq"},
    {"png": "https://flagcdn.com/w320/lb.png", "common": "Lebanon"},
    {"png": "https://flagcdn.com/w320/ir.png", "common": "Iran"},
    {"png": "https://flagcdn.com/w320/la.png", "common": "Laos"},
    {"png": "https://flagcdn.com/w320/ye.png", "common": "Yemen"},
    {"png": "https://flagcdn.com/w320/mm.png", "common": "Myanmar"},
    {"png": "https://flagcdn.com/w320/il.png", "common": "Israel"},
    {"png": "https://flagcdn.com/w320/tm.png", "common": "Turkmenistan"},
    {"png": "https://flagcdn.com/w320/kz.png", "common": "Kazakhstan"},
    {"png": "https://flagcdn.com/w320/ps.png", "common": "Palestine"},
    {"png": "https://flagcdn.com/w320/mo.png", "common": "Macau"},
    {"png": "https://flagcdn.com/w320/mn.png", "common": "Mongolia"},
    {"png": "https://flagcdn.com/w320/sy.png", "common": "Syria"},
    {"png": "https://flagcdn.com/w320/az.png", "common": "Azerbaijan"},
    {"png": "https://flagcdn.com/w320/kr.png", "common": "South Korea"},
    {"png": "https://flagcdn.com/w320/mv.png", "common": "Maldives"},
    {"png": "https://flagcdn.com/w320/am.png", "common": "Armenia"},
    {"png": "https://flagcdn.com/w320/tl.png", "common": "Timor-Leste"},
    {"png": "https://flagcdn.com/w320/jo.png", "common": "Jordan"},
    {"png": "https://flagcdn.com/w320/kh.png", "common": "Cambodia"},
    {"png": "https://flagcdn.com/w320/bt.png", "common": "Bhutan"},
    {"png": "https://flagcdn.com/w320/kp.png", "common": "North Korea"},
    {"png": "https://flagcdn.com/w320/uz.png", "common": "Uzbekistan"},
    {"png": "https://flagcdn.com/w320/tg.png", "common": "Togo"},
    {"png": "https://flagcdn.com/w320/yt.png", "common": "Mayotte"},
    {"png": "https://flagcdn.com/w320/vu.png", "common": "Vanuatu"},
    {"png": "https://flagcdn.com/w320/ne.png", "common": "Niger"},
    {"png": "https://flagcdn.com/w320/tv.png", "common": "Tuvalu"},
    {"png": "https://flagcdn.com/w320/km.png", "common": "Comoros"},
    {"png": "https://flagcdn.com/w320/so.png", "common": "Somalia"},
    {"png": "https://flagcdn.com/w320/bl.png", "common": "Saint Barthélemy"},
    {"png": "https://flagcdn.com/w320/ky.png", "common": "Cayman Islands"},
    {"png": "https://flagcdn.com/w320/ls.png", "common": "Lesotho"},
    {"png": "https://flagcdn.com/w320/ve.png", "common": "Venezuela"},
    {"png": "https://flagcdn.com/w320/ke.png", "common": "Kenya"},
    {"png": "https://flagcdn.com/w320/fj.png", "common": "Fiji"},
    {"png": "https://flagcdn.com/w320/tt.png", "common": "Trinidad and Tobago"},
    {"png": "https://flagcdn.com/w320/hn.png", "common": "Honduras"},
    {"png": "https://flagcdn.com/w320/je.png", "common": "Jersey"},
    {"png": "https://flagcdn.com/w320/dj.png", "common": "Djibouti"},
    {"png": "https://flagcdn.com/w320/re.png", "common": "Réunion"},
    {"png": "https://flagcdn.com/w320/sz.png", "common": "Eswatini"},
    {"png": "https://flagcdn.com/w320/bm.png", "common": "Bermuda"},
    {"png": "https://flagcdn.com/w320/nz.png", "common": "New Zealand"},
    {"png": "https://flagcdn.com/w320/cx.png", "common": "Christmas Island"},
    {"png": "https://flagcdn.com/w320/gm.png", "common": "Gambia"},
    {"png": "https://flagcdn.com/w320/pf.png", "common": "French Polynesia"},
    {"png": "https://flagcdn.com/w320/cd.png", "common": "DR Congo"},
    {"png": "https://flagcdn.com/w320/cr.png", "common": "Costa Rica"},
    {"png": "https://flagcdn.com/w320/mw.png", "common": "Malawi"},
    {"png": "https://flagcdn.com/w320/cg.png", "common": "Republic of the Congo"},
    {"png": "https://flagcdn.com/w320/nu.png", "common": "Niue"},
    {"png": "https://flagcdn.com/w320/sn.png", "common": "Senegal"},
    {"png": "https://flagcdn.com/w320/ao.png", "common": "Angola"},
    {"png": "https://flagcdn.com/w320/ec.png", "common": "Ecuador"},
    {"png": "https://flagcdn.com/w320/aw.png", "common": "Aruba"},
    {"png": "https://flagcdn.com/w320/st.png", "common": "São Tomé and Príncipe"},
    {"png": "https://flagcdn.com/w320/gd.png", "common": "Grenada"},
    {"png": "https://flagcdn.com/w320/ms.png", "common": "Montserrat"},
    {"png": "https://flagcdn.com/w320/eh.png", "common": "Western Sahara"},
    {"png": "https://flagcdn.com/w320/gn.png", "common": "Guinea"},
    {"png": "https://flagcdn.com/w320/vg.png", "common": "British Virgin Islands"},
    {"png": "https://flagcdn.com/w320/pa.png", "common": "Panama"},
    {"png": "https://flagcdn.com/w320/gy.png", "common": "Guyana"},
    {"png": "https://flagcdn.com/w320/lu.png", "common": "Luxembourg"},
    {"png": "https://flagcdn.com/w320/na.png", "common": "Namibia"},
    {"png": "https://flagcdn.com/w320/nc.png", "common": "New Caledonia"},
    {"png": "https://flagcdn.com/w320/pm.png", "common": "Saint Pierre and Miquelon"},
    {"png": "https://flagcdn.com/w320/ly.png", "common": "Libya"},
    {"png": "https://flagcdn.com/w320/ml.png", "common": "Mali"},
    {"png": "https://flagcdn.com/w320/ar.png", "common": "Argentina"},
    {"png": "https://flagcdn.com/w320/gf.png", "common": "French Guiana"},
    {"png": "https://flagcdn.com/w320/ug.png", "common": "Uganda"},
    {"png": "https://flagcdn.com/w320/zm.png", "common": "Zambia"},
    {"png": "https://flagcdn.com/w320/fm.png", "common": "Micronesia"},
    {"png": "https://flagcdn.com/w320/bi.png", "common": "Burundi"},
    {"png": "https://flagcdn.com/w320/za.png", "common": "South Africa"},
    {"png": "https://flagcdn.com/w320/pr.png", "common": "Puerto Rico"},
    {"png": "https://flagcdn.com/w320/cc.png", "common": "Cocos (Keeling) Islands"},
    {"png": "https://flagcdn.com/w320/as.png", "common": "American Samoa"},
    {"png": "https://flagcdn.com/w320/gi.png", "common": "Gibraltar"},
    {"png": "https://flagcdn.com/w320/sj.png", "common": "Svalbard and Jan Mayen"},
    {"png": "https://flagcdn.com/w320/im.png", "common": "Isle of Man"},
    {"png": "https://flagcdn.com/w320/mu.png", "common": "Mauritius"},
    {"png": "https://flagcdn.com/w320/mf.png", "common": "Saint Martin"},
    {"png": "https://flagcdn.com/w320/sl.png", "common": "Sierra Leone"},
    {"png": "https://flagcdn.com/w320/kn.png", "common": "Saint Kitts and Nevis"},
    {"png": "https://flagcdn.com/w320/hm.png", "common": "Heard Island and McDonald Islands"},
    {"png": "https://flagcdn.com/w320/cm.png", "common": "Cameroon"},
    {"png": "https://flagcdn.com/w320/sv.png", "common": "El Salvador"},
    {"png": "https://flagcdn.com/w320/cu.png", "common": "Cuba"},
    {"png": "https://flagcdn.com/w320/sb.png", "common": "Solomon Islands"},
    {"png": "https://flagcdn.com/w320/jm.png", "common": "Jamaica"},
    {"png": "https://flagcdn.com/w320/tz.png", "common": "Tanzania"},
    {"png": "https://flagcdn.com/w320/bo.png", "common": "Bolivia"},
    {"png": "https://flagcdn.com/w320/cy.png", "common": "Cyprus"},
    {"png": "https://flagcdn.com/w320/tn.png", "common": "Tunisia"},
    {"png": "https://flagcdn.com/w320/tf.png", "common": "French Southern and Antarctic Lands"},
    {"png": "https://flagcdn.com/w320/cl.png", "common": "Chile"},
    {"png": "https://flagcdn.com/w320/gh.png", "common": "Ghana"},
    {"png": "https://flagcdn.com/w320/sx.png", "common": "Sint Maarten"},
    {"png": "https://flagcdn.com/w320/cw.png", "common": "Curaçao"},
    {"png": "https://flagcdn.com/w320/ss.png", "common": "South Sudan"},
    {"png": "https://flagcdn.com/w320/ht.png", "common": "Haiti"},
    {"png": "https://flagcdn.com/w320/gw.png", "common": "Guinea-Bissau"},
    {"png": "https://flagcdn.com/w320/ga.png", "common": "Gabon"},
    {"png": "https://flagcdn.com/w320/zw.png", "common": "Zimbabwe"},
    {"png": "https://flagcdn.com/w320/sc.png", "common": "Seychelles"},
    {"png": "https://flagcdn.com/w320/gt.png", "common": "Guatemala"},
    {"png": "https://flagcdn.com/w320/gp.png", "common": "Guadeloupe"},
    {"png": "https://flagcdn.com/w320/py.png", "common": "Paraguay"},
    {"png": "https://flagcdn.com/w320/er.png", "common": "Eritrea"},
    {"png": "https://flagcdn.com/w320/sd.png", "common": "Sudan"},
    {"png": "https://flagcdn.com/w320/gq.png", "common": "Equatorial Guinea"},
    {"png": "https://flagcdn.com/w320/co.png", "common": "Colombia"},
    {"png": "https://flagcdn.com/w320/bn.png", "common": "Brunei"},
    {"png": "https://flagcdn.com/w320/tc.png", "common": "Turks and Caicos Islands"},
    {"png": "https://flagcdn.com/w320/bs.png", "common": "Bahamas"},
    {"png": "https://flagcdn.com/w320/lr.png", "common": "Liberia"},
    {"png": "https://flagcdn.com/w320/ai.png", "common": "Anguilla"},
    {"png": "https://flagcdn.com/w320/cf.png", "common": "Central African Republic"},
    {"png": "https://flagcdn.com/w320/dz.png", "common": "Algeria"},
    {"png": "https://flagcdn.com/w320/lc.png", "common": "Saint Lucia"},
    {"png": "https://flagcdn.com/w320/ma.png", "common": "Morocco"},
    {"png": "https://flagcdn.com/w320/mp.png", "common": "Northern Mariana Islands"},
    {"png": "https://flagcdn.com/w320/um.png", "common": "United States Minor Outlying Islands"},
    {"png": "https://flagcdn.com/w320/bw.png", "common": "Botswana"},
    {"png": "https://flagcdn.com/w320/bq.png", "common": "Caribbean Netherlands"},
    {"png": "https://flagcdn.com/w320/cv.png", "common": "Cape Verde"},
    {"png": "https://flagcdn.com/w320/gu.png", "common": "Guam"},
    {"png": "https://flagcdn.com/w320/to.png", "common": "Tonga"},
    {"png": "https://flagcdn.com/w320/fk.png", "common": "Falkland Islands"},
    {"png": "https://flagcdn.com/w320/nr.png", "common": "Nauru"},
    {"png": "https://flagcdn.com/w320/ck.png", "common": "Cook Islands"},
    {"png": "https://flagcdn.com/w320/mr.png", "common": "Mauritania"},
    {"png": "https://flagcdn.com/w320/td.png", "common": "Chad"},
    {"png": "https://flagcdn.com/w320/bj.png", "common": "Benin"},
    {"png": "https://flagcdn.com/w320/mt.png", "common": "Malta"},
    {"png": "https://flagcdn.com/w320/vc.png", "common": "Saint Vincent and the Grenadines"},
    {"png": "https://flagcdn.com/w320/mh.png", "common": "Marshall Islands"},
    {"png": "https://flagcdn.com/w320/ci.png", "common": "Ivory Coast"},
    {"png": "https://flagcdn.com/w320/mq.png", "common": "Martinique"},
    {"png": "https://flagcdn.com/w320/bv.png", "common": "Bouvet Island"},
    {"png": "https://flagcdn.com/w320/ni.png", "common": "Nicaragua"},
    {"png": "https://flagcdn.com/w320/pg.png", "common": "Papua New Guinea"},
    {"png": "https://flagcdn.com/w320/eg.png", "common": "Egypt"},
    {"png": "https://flagcdn.com/w320/uy.png", "common": "Uruguay"},
    {"png": "https://flagcdn.com/w320/bf.png", "common": "Burkina Faso"},
    {"png": "https://flagcdn.com/w320/et.png", "common": "Ethiopia"},
    {"png": "https://flagcdn.com/w320/ki.png", "common": "Kiribati"},
    {"png": "https://flagcdn.com/w320/do.png", "common": "Dominican Republic"},
    {"png": "https://flagcdn.com/w320/sr.png", "common": "Suriname"},
    {"png": "https://flagcdn.com/w320/bb.png", "common": "Barbados"},
    {"png": "https://flagcdn.com/w320/gl.png", "common": "Greenland"},
    {"png": "https://flagcdn.com/w320/pw.png", "common": "Palau"},
    {"png": "https://flagcdn.com/w320/nf.png", "common": "Norfolk Island"},
    {"png": "https://flagcdn.com/w320/gs.png", "common": "South Georgia"},
    {"png": "https://flagcdn.com/w320/vi.png", "common": "United States Virgin Islands"},
    {"png": "https://flagcdn.com/w320/dm.png", "common": "Dominica"},
    {"png": "https://flagcdn.com/w320/rw.png", "common": "Rwanda"},
    {"png": "https://flagcdn.com/w320/mg.png", "common": "Madagascar"},
    {"png": "https://flagcdn.com/w320/ws.png", "common": "Samoa"},
    {"png": "https://flagcdn.com/w320/fo.png", "common": "Faroe Islands"},
    {"png": "https://flagcdn.com/w320/pn.png", "common": "Pitcairn Islands"},
    {"png": "https://flagcdn.com/w320/ag.png", "common": "Antigua and Barbuda"},
    {"png": "https://flagcdn.com/w320/ax.png", "common": "Åland Islands"},
    {"png": "https://flagcdn.com/w320/mz.png", "common": "Mozambique"},
    {"png": "https://flagcdn.com/w320/aq.png", "common": "Antarctica"},
    {"png": "https://flagcdn.com/w320/wf.png", "common": "Wallis and Futuna"},
    {"png": "https://flagcdn.com/w320/bz.png", "common": "Belize"},
    {"png": "https://flagcdn.com/w320/gg.png", "common": "Guernsey"},
    {"png": "https://flagcdn.com/w320/tk.png", "common": "Tokelau"},
  ];
}
