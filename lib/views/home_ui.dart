// ignore_for_file: prefer_const_constructors, camel_case_types, unused_import, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabindex = 0;

  @override
  void initState() {
    _tabController =
        TabController(length: 10, vsync: this, initialIndex: _currentTabindex);
    super.initState();
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 10,
      child: Scaffold(
        backgroundColor: Colors.orange[50],
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Colors.orange,
          title: Text(
            'จังหวัดสุราษฎร์ธานี',
            style: GoogleFonts.kanit(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                exit(0);
              },
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.black,
              ),
            ),
          ],
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            labelColor: Colors.deepOrange,
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.deepOrange,
            indicatorWeight: 5.0,
            tabAlignment: TabAlignment.start,
            tabs: [
              tabBar('จังหวัดสุราษฎร์ธานี'),
              tabBar('อำเภอเมืองสุราษฎร์ธานี'),
              tabBar('อำเภอกาญจนดิษฐ์'),
              tabBar('อำเภอคีรีรัฐนิคม'),
              tabBar('อำเภอดอนสัก'),
              tabBar('อำเภอเวียงสระ'),
              tabBar('อำเภอท่าชนะ'),
              tabBar('อำเภอพนม'),
              tabBar('อำเภอเกาะสมุย'),
              tabBar('อำเภอเกาะพะงัน'),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            shrinkWrap: false,
            padding: EdgeInsets.zero,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    _tabController.index = 0;
                  });
                  Navigator.pop(context);
                },
                child: UserAccountsDrawerHeader(
                  accountName: Text(
                    'จังหวัดสุราษฎร์ธานี',
                    style: GoogleFonts.kanit(
                      color: Colors.black,
                    ),
                  ),
                  accountEmail: Text(
                    'จังหวัดที่มีเกาะมากที่สุดอันดับ3ของประเทศไทย',
                    style: GoogleFonts.kanit(
                      color: Colors.black,
                      shadows: [
                        Shadow(
                          color: Colors.white, // สีของ "Stroke"
                          blurRadius: 10, // ความเรียบของ "Stroke"
                          offset: Offset(
                              0, 0), // ตำแหน่งของ "Stroke" ในแนวแกน X และ Y
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/sni5.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                    //color: Colors.pink,
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/images/sni.jpg',
                    ),
                  ),
                  // otherAccountsPictures: [
                  //   CircleAvatar(
                  //     backgroundImage: NetworkImage(
                  //         'https://cdn.pixabay.com/photo/2015/05/27/12/10/cake-786473_640.jpg'),
                  //   ),
                  //   CircleAvatar(
                  //     backgroundImage: NetworkImage(
                  //         'https://cdn.pixabay.com/photo/2017/09/19/08/52/pancake-2764589_1280.jpg'),
                  //   ),
                  // ],
                ),
              ),
              districtDrawer('เมืองสุราษฎร์ธานี', 'snicity.jpg', 1),
              Divider(),
              districtDrawer('กาญจนดิษฐ์', 'kd01.jpg', 2),
              Divider(),
              districtDrawer('คีรีรัฐนิคม', 'krn03.jpg', 3),
              Divider(),
              districtDrawer('ดอนสัก', 'ds01.jpg', 4),
              Divider(),
              districtDrawer('เวียงสระ', 'ws01.jpg', 5),
              Divider(),
              districtDrawer('ท่าชนะ', 'tc01.jpg', 6),
              Divider(),
              districtDrawer('พนม', 'pn01.jpg', 7),
              Divider(),
              districtDrawer('เกาะสมุย', 'sm01.jpg', 8),
              Divider(),
              districtDrawer('เกาะพะงัน', 'png01.jpg', 9),
              Divider(),
              ListTile(
                onTap: () {
                  setState(() {
                    _tabController.index = 6;
                  });
                  Navigator.pop(context);
                  exit(0);
                },
                leading: Icon(
                  Icons.exit_to_app,
                  color: Colors.black,
                ),
                title: Text(
                  'ออกจากแอพ',
                  style: GoogleFonts.kanit(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                    ),
                    Text(
                      'จังหวัดสุราษฎร์ธานี',
                      style: GoogleFonts.kanit(
                        fontSize: MediaQuery.of(context).size.height * 0.035,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    SizedBox(
                      height: 200.0,
                      width: 300.0,
                      child: AnotherCarousel(
                        autoplayDuration: Duration(seconds: 5),
                        images: [
                          ExactAssetImage(
                            'assets/images/snip1.jpg',
                          ),
                          ExactAssetImage(
                            'assets/images/snip2.jpg',
                          ),
                          ExactAssetImage(
                            'assets/images/snip3.jpg',
                          ),
                        ],
                        showIndicator: false,
                        borderRadius: true,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      child: ListTile(
                        tileColor: Colors.orange,
                        leading: InkWell(
                          onTap: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('ข้อมูลจังหวัด'),
                                content: const Text(
                                    'สุราษฎร์ธานี เป็นจังหวัดในภาคใต้ตอนบน \nมีพื้นที่ขนาดใหญ่ที่สุดในภาคใต้มีหลักฐานทั้งประวัติศาสตร์และโบราณคดีเก่าแก่และยังมีแหล่งท่องเที่ยวและอุทยานแห่งชาติหลายแห่ง'),
                                backgroundColor: Colors.orange,
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text(
                                      'OK',
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Icon(
                            Icons.info,
                          ),
                        ),
                        title: SizedBox(
                          height: 50,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Center(
                              child: Text(
                                'สุราษฎร์ธานี เป็นจังหวัดในภาคใต้ตอนบน มีพื้นที่ขนาดใหญ่ที่สุดในภาคใต้มีหลักฐานทั้งประวัติศาสตร์และโบราณคดีเก่าแก่และยังมีแหล่งท่องเที่ยวและอุทยานแห่งชาติหลายแห่ง',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      child: ListTile(
                        onTap: () {
                          _makePhoneCall('0-7727-2926');
                        },
                        tileColor: Colors.orange,
                        leading: Icon(
                          Icons.phone,
                        ),
                        title: Text(
                          '0 7727 2926',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      child: ListTile(
                        onTap: () {
                          _launchInBrowser(
                            Uri.parse('https://www.suratthani.go.th/home/'),
                          );
                        },
                        tileColor: Colors.orange,
                        leading: Icon(
                          Icons.web,
                        ),
                        title: Text(
                          'suratthani.go.th',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      child: ListTile(
                        onTap: () {
                          _launchInBrowser(
                            Uri.parse(
                                'https://maps.app.goo.gl/ZJSg1Zd4nr83bWXF7'),
                          );
                        },
                        tileColor: Colors.orange,
                        leading: Icon(
                          Icons.map,
                        ),
                        title: Text(
                          'ดูใน Google Map',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            showDistrictWidget(
                'เมืองสุราษฎร์ธานี',
                'assets/images/snicity.jpg',
                'assets/images/snipol.jpg',
                'assets/images/snicity2.jpg',
                '077 272 095 ',
                '077 952 900',
                'https://www.muangsurat.go.th/front',
                'muangsurat.go.th',
                'https://maps.app.goo.gl/6QcFSv1QYcgF7PrKA'),
            showDistrictWidget(
                'กาญจนดิษฐ์',
                'assets/images/kd01.jpg',
                'assets/images/kd02.jpg',
                'assets/images/kd03.jpg',
                '077 961 588',
                '077 379 132',
                'https://www.kanchanaditcity.go.th/frontpage',
                'kanchanaditcity.go.th',
                'https://maps.app.goo.gl/aNQKjS2M7Pa1RYiG6'),
            showDistrictWidget(
                'คีรีรัฐนิคม',
                'assets/images/krn01.jpg',
                'assets/images/krn02.jpg',
                'assets/images/krn03.jpg',
                '077 391 061',
                '077 391 117',
                'https://www.oic.go.th/INFOCENTER37/3716/',
                'oic.go.th',
                'https://maps.app.goo.gl/kWjJ2iNWwPNx4m7A6'),
            showDistrictWidget(
                'ดอนสัก',
                'assets/images/ds01.jpg',
                'assets/images/ds02.jpg',
                'assets/images/ds03.jpg',
                '077 371 443',
                '077 371 401',
                'https://donsakdistrict.go.th/front',
                'donsakdistrict.go.th',
                'https://maps.app.goo.gl/8Q4d87RxcF11Kgac8'),
            showDistrictWidget(
                'เวียงสระ',
                'assets/images/ws01.jpg',
                'assets/images/ws02.jpg',
                'assets/images/ws03.jpg',
                '077 363 179',
                '077 361283',
                'http://weingsra.6te.net/index2.htm',
                'weingsra.6te.net',
                'https://maps.app.goo.gl/3ocLoSewRB7c9onV9'),
            showDistrictWidget(
                'ท่าชนะ',
                'assets/images/tc01.jpg',
                'assets/images/tc02.jpg',
                'assets/images/tc03.jpg',
                '077 381 388',
                '077 381 167',
                'http://www.thachanacity.go.th/index.php',
                'thachanacity.go.th',
                'https://maps.app.goo.gl/rYZH6C9W8G6aSCti6'),
            showDistrictWidget(
                'พนม',
                'assets/images/pn01.jpg',
                'assets/images/pn02.jpg',
                'assets/images/pn03.jpg',
                '077 399 013',
                '077 399 084',
                'http://www.phanom.go.th/index.php',
                'phanom.go.th',
                'https://maps.app.goo.gl/tgt1HpnB4o4X5aoQ6'),
            showDistrictWidget(
                'เกาะสมุย',
                'assets/images/sm01.jpg',
                'assets/images/sm02.jpg',
                'assets/images/sm03.jpg',
                '077 421 097',
                '077 913 200',
                'https://www.kohsamuicity.go.th/content/general',
                'kohsamuicity.go.th',
                'https://maps.app.goo.gl/CD2ofQtVdooMXSWE9'),
            showDistrictWidget(
                'เกาะพงัน',
                'assets/images/png01.jpg',
                'assets/images/png02.jpg',
                'assets/images/png03.jpg',
                '077 377 114',
                '077 377 034',
                'https://www.kohphangancity.go.th/front',
                'kohphangancity.go.th',
                'https://maps.app.goo.gl/F6pFoCjmjQtxnPdq9'),
          ],
        ),
      ),
    );
  }

  //showDistrictWidget เป็นเลย์เอาต์ของหน้า shop
  Widget showDistrictWidget(
      String districtName,
      String districtImg1,
      String districtImg2,
      String districtImg3,
      String policePhone,
      String hospitalPhone,
      String districtWeb,
      String titledistrictWeb,
      String districtGps) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          Text(
            'อำเภอ' + districtName,
            style: GoogleFonts.kanit(
              fontSize: MediaQuery.of(context).size.height * 0.035,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          SizedBox(
            height: 200.0,
            width: 300.0,
            child: AnotherCarousel(
              autoplayDuration: Duration(seconds: 5),
              images: [
                ExactAssetImage(districtImg1),
                ExactAssetImage(districtImg2),
                ExactAssetImage(districtImg3),
              ],
              showIndicator: false,
              borderRadius: true,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: ListTile(
              onTap: () {
                _makePhoneCall(policePhone);
              },
              tileColor: Colors.orange,
              leading: Icon(
                Icons.local_police,
              ),
              title: Text(
                policePhone,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: ListTile(
              onTap: () {
                _makePhoneCall(hospitalPhone);
              },
              tileColor: Colors.orange,
              leading: Icon(
                Icons.local_hospital,
              ),
              title: Text(
                hospitalPhone,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: ListTile(
              onTap: () {
                _launchInBrowser(
                  Uri.parse(districtWeb),
                );
              },
              tileColor: Colors.orange,
              leading: Icon(
                Icons.web,
              ),
              title: Text(
                titledistrictWeb,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: ListTile(
              onTap: () {
                _launchInBrowser(
                  Uri.parse(districtGps),
                  //Uri.parse('https://www.google.com/maps/@${districtGps},17z'),
                );
              },
              tileColor: Colors.orange,
              leading: Icon(
                Icons.map,
              ),
              title: Text(
                'ดูใน Google Map',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget districtDrawer(String district, String avatarImg, int tabIndex) {
    return ListTile(
      onTap: () {
        setState(() {
          _tabController.index = tabIndex;
        });
        Navigator.pop(context);
      },
      leading: CircleAvatar(
        backgroundImage: AssetImage(
          'assets/images/${avatarImg}',
        ),
      ),
      title: Text(
        'อำเภอ' + district,
      ),
    );
  }

  Widget tabBar(String tabName) {
    return Tab(
      icon: Icon(
        Icons.map,
      ),
      text: (tabName),
    );
  }
}
