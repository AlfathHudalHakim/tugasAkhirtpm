import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Other extends StatefulWidget {
  @override
  _OtherState createState() => _OtherState();
}

class _OtherState extends State<Other> {
  double rupiahValue = 0;
  double usdValue = 0;
  double euroValue = 0;
  double yenValue = 0;

  void convertCurrency() {
    // Lakukan konversi mata uang sesuai rumus yang diperlukan
    // Misalnya, 1 USD = 14,000 IDR, 1 Euro = 16,000 IDR, 1 Yen = 130 IDR
    usdValue = rupiahValue / 14000;
    euroValue = rupiahValue / 16000;
    yenValue = rupiahValue / 130;
  }
  // Inisialisasi zona waktu WIB, WITA, dan WIT
  TimeZone timeZoneWIB = TimeZone('WIB', Duration(hours: 0));
  TimeZone timeZoneWITA = TimeZone('WITA', Duration(hours: 1));
  TimeZone timeZoneWIT = TimeZone('WIT', Duration(hours: 2));
  TimeZone timeZoneLondon = TimeZone('London', Duration(hours: -6));
  var waktu = ['WIB','WITA','WIT','London'];
  String dropdownval = 'WIB';

  @override
  Widget build(BuildContext context) {
    // Buat objek DateTime dengan waktu saat ini
    DateTime now = DateTime.now();

    // Buat objek formatter untuk format tanggal dan waktu
    DateFormat dateFormat = DateFormat('EEEE, dd MMMM yyyy');
    DateFormat timeFormat = DateFormat('HH:mm:ss');

    return  Scaffold(
      appBar: AppBar(
        title: Text('Menu Kalender & Konversi Mata Uang'),
      ),
      body: SafeArea(
        child: Center(
            child: Column(

              children: [
                SizedBox(height: 20,),
                Container(
                  color: Colors.red,
                  height: 40,
                  width: 90,
                  child: DropdownButton(
                    dropdownColor: Colors.red,
                    iconEnabledColor: Colors.black,
                    value: dropdownval,
                    borderRadius: BorderRadius.circular(20),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: waktu.map((String waktu) {
                      return DropdownMenuItem(
                        value: waktu,
                        child: Text(
                          waktu,
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownval = newValue!;
                      });
                    },
                  ),
                ),
                SizedBox(height: 20,),
                // Tampilkan waktu saat ini di zona waktu WIB (UTC+7)
                Text('Waktu',
                  style:
                  TextStyle(fontSize: 20),),
                Text((dropdownval == 'WIB')?dateFormat.format(timeZoneWIB.convert(now)): (dropdownval == 'WITA')?dateFormat.format(timeZoneWITA.convert(now)): (dropdownval == 'WIT')?dateFormat.format(timeZoneWIT.convert(now)): dateFormat.format(timeZoneLondon.convert(now)),
                  style:
                  TextStyle(fontSize: 30),),
                Text((dropdownval == 'WIB')?timeFormat.format(timeZoneWIB.convert(now)): (dropdownval == 'WITA')?timeFormat.format(timeZoneWITA.convert(now)): (dropdownval == 'WIT')?timeFormat.format(timeZoneWIT.convert(now)) : timeFormat.format(timeZoneLondon.convert(now)),
                  style:
                  TextStyle(fontSize: 30),),
                SizedBox(height: 50),
                Text("Konversi Rupiah",
                  style:
                  TextStyle(fontSize: 40),),

                TextField(
                  onChanged: (value) {
                    setState(() {
                      rupiahValue = double.tryParse(value) ?? 0;
                      convertCurrency();
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Masukkan jumlah rupiah',
                  ),
                ),
                SizedBox(height: 16.0),
                Text("Konversi",
                  style:
                  TextStyle(fontSize: 24),),
                Text('USD: \$${usdValue.toStringAsFixed(2)}'),
                Text('Euro: €${euroValue.toStringAsFixed(2)}'),
                Text('Yen: ¥${yenValue.toStringAsFixed(2)}'),
              ],
            )
        ),
      ),
    );

  }
}

class TimeZone {
  final String name;
  final Duration offset;

  TimeZone(this.name, this.offset);

  DateTime convert(DateTime dateTime) {
    return dateTime.add(offset);
  }
}