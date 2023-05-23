import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';


class HeroesDetail extends StatefulWidget {

  final heroesDetail;

  const HeroesDetail({Key? key, required this.heroesDetail}) : super(key: key);

  @override
  State<HeroesDetail> createState() => _HeroesDetailState();
}

class _HeroesDetailState extends State<HeroesDetail> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Heroes Details'),
      ),
      body: Center(
        child:
        Column(
          children: [
            SizedBox(height: 20,),
            CachedNetworkImage(imageUrl:'https://api.opendota.com'+widget.heroesDetail['img'],),
            SizedBox(height: 20,),
            Text(
                'Heroes Name ',style: TextStyle(
                color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold
            )
            ),
            Text(
                widget.heroesDetail['localized_name'],style: TextStyle(
                color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold
            )
            ),
            SizedBox(height: 20,),
            Text(
                'Primary Attribute ',style: TextStyle(
                color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold
            )
            ),
            Text(
                widget.heroesDetail['primary_attr'],style: TextStyle(
                color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold
            )
            ),
            SizedBox(height: 20,),
            Text(
                'Attack Type ',style: TextStyle(
                color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold
            )
            ),
            Text(
                widget.heroesDetail['attack_type'],style: TextStyle(
                color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold
            )
            ),
            SizedBox(height: 20,),
            Text(
                'Roles ',style: TextStyle(
                color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold
            )
            ),
            Text(
                widget.heroesDetail['roles'].join(', '),style: TextStyle(
                color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold
            )
            ),
            SizedBox(height: 20,),
            Text(
                'Base Health ',style: TextStyle(
                color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold
            )
            ),
            Text(
                widget.heroesDetail['base_health'].toString(),style: TextStyle(
                color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold
            )
            ),
            SizedBox(height: 20,),
            Text(
                'Base Mana ',style: TextStyle(
                color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold
            )
            ),
            Text(
                widget.heroesDetail['base_mana'].toString(),style: TextStyle(
                color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold
            )
            )
          ],
        ),
      )
    );
  }
}
