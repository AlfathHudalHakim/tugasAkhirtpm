import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tugasakhir/Detailhero.dart';
import 'coba.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

String search = '';

class _HomePageState extends State<HomePage> {
  var dotaheroesApi = "https://api.opendota.com/api/heroStats";
  late List<dynamic> dotaheroes = [];

  @override
  void initState() {
    super.initState();
    fetchDotaheroData();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 10,
            right: 100,
            child: Image.asset('assets/images/Dota-2.png', width: 200, fit: BoxFit.fitWidth),
          ),

          Positioned(
            top: 80,
            left: 20,
            child: Stack(
              children: [
                Text(
                  "DOTA 2",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..style = PaintingStyle.fill
                      ..strokeWidth = 2
                      ..color = Colors.black,
                    fontFamily: '',
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 80,
            left: 280,
            child: Stack(
              children: [
                Text(
                  "Heroes",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..style = PaintingStyle.fill
                      ..strokeWidth = 2
                      ..color = Colors.red,
                    fontFamily: '',
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 110,
            child: Container(
              width: width,
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  suffixIcon: InkWell(
                    onTap: () {
                      fetchDotaheroData();
                    },
                    child: Icon(Icons.search),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    search = value.toLowerCase();
                  });
                  print(value);
                },
              ),
            ),
          ),
          Positioned(
            top: 180,
            bottom: 0,
            width: width,
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.4,
                    ),
                    itemCount: dotaheroes.length,
                    itemBuilder: (context, index) {
                      var type = dotaheroes[index]['primary_attr'];
                      return InkWell(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                          child: Container(
                            decoration: BoxDecoration(
                              color: type == "str" ? Colors.red
                                  : type == "int" ? Colors.blue
                                  : type == "agi" ? Colors.green
                                  : Colors.pink,
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: 5,
                                  right: 3,
                                  child: Hero(
                                    tag: index,
                                    child: CachedNetworkImage(imageUrl:'https://api.opendota.com'+dotaheroes[index]['img'],
                                      height: 100,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 20,
                                  left: 10,
                                  child: Text(
                                    dotaheroes[index]['localized_name'],
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
                                  ),
                                ),
                                Positioned(
                                  top: 45,
                                  left: 20,
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 6, bottom: 6),
                                      child: Text(
                                        type.toString(),
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                      color: Colors.black26,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 80,
                                  left: 20,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      dotaheroes[index]['id'].toString(),
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                      color: Colors.black26,
                                    ),
                                    width: 50,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => HeroesDetail(heroesDetail :dotaheroes[index])));
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void fetchDotaheroData() {
    var url = Uri.parse(dotaheroesApi);
    http.get(url).then((value) {
      if (value.statusCode == 200) {
        var decodedJsonData = jsonDecode(value.body);
        dotaheroes = decodedJsonData;

        if (search.isNotEmpty) {
          List<dynamic> filteredDota = dotaheroes
              .where((element) => element['localized_name'].toString().toLowerCase().contains(search))
              .toList();
          dotaheroes = filteredDota;
        }

        print('success');
        setState(() {});
      }
    });
  }
}