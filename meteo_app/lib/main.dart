import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'package:meteo_app/data_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'models.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();

  //WeatherResponse({required this.listInfo1, required this.listInfo2, required this.listInfo3, required this.listInfo4, required this.listInfo5, required this.cityInfo});
    //ListInfo({required this.dt, required this.mainInfo, required this.weatherInfo, required this.windInfo, required this.dt_txt});
      //MainInfo({required this.temp, required this.temp_min, required this.temp_max, required this.humidity});
      //WeatherInfo({required this.description, required this.icon});
      //WindInfo({required this.speed});
    //CityInfo({required this.cityName});
  //WeatherResponse _response = WeatherResponse(
  // cityName: '', tempInfo: TemperatureInfo(temperature: 0.0), weatherInfo: WeatherInfo(icon: '', description: ''));
  WeatherResponse _response = WeatherResponse(
      listInfo1: ListInfo(dt: 0, mainInfo: MainInfo(temp: 0.0, temp_min: 0.0, temp_max: 0.0, humidity: 0), weatherInfo: WeatherInfo(description: '', icon: '01d'), windInfo: WindInfo(speed: 0.0), dt_txt: ''),
      listInfo2: ListInfo(dt: 0, mainInfo: MainInfo(temp: 0.0, temp_min: 0.0, temp_max: 0.0, humidity: 0), weatherInfo: WeatherInfo(description: '', icon: '01d'), windInfo: WindInfo(speed: 0.0), dt_txt: ''),
      listInfo3: ListInfo(dt: 0, mainInfo: MainInfo(temp: 0.0, temp_min: 0.0, temp_max: 0.0, humidity: 0), weatherInfo: WeatherInfo(description: '', icon: '01d'), windInfo: WindInfo(speed: 0.0), dt_txt: ''),
      listInfo4: ListInfo(dt: 0, mainInfo: MainInfo(temp: 0.0, temp_min: 0.0, temp_max: 0.0, humidity: 0), weatherInfo: WeatherInfo(description: '', icon: '01d'), windInfo: WindInfo(speed: 0.0), dt_txt: ''),
      listInfo5: ListInfo(dt: 0, mainInfo: MainInfo(temp: 0.0, temp_min: 0.0, temp_max: 0.0, humidity: 0), weatherInfo: WeatherInfo(description: '', icon: '01d'), windInfo: WindInfo(speed: 0.0), dt_txt: ''),
      cityInfo: CityInfo(cityName: '')
  );

  @override
  Widget build(BuildContext context) {
    //final String dateTimeString = _response.listInfo1.dt_txt;
    //final DateTime dateTime = DateTime.parse(dateTimeString);
    final date1 = DateFormat('EEEE').format(DateTime.now());
    final date2 = DateFormat('EEEE').format(DateTime.now().add(const Duration(days: 1)));
    final date3 = DateFormat('EEEE').format(DateTime.now().add(const Duration(days: 2)));
    final date4 = DateFormat('EEEE').format(DateTime.now().add(const Duration(days: 3)));
    final date5 = DateFormat('EEEE').format(DateTime.now().add(const Duration(days: 4)));
    return MaterialApp(
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    width: 150,
                    height: 30,
                    child: TextField(
                        controller: _cityTextController,
                        decoration: InputDecoration(labelText: 'City'),
                        textAlign: TextAlign.center),
                  ),
                ),
                ElevatedButton(onPressed: _search, child: Text('Search')),
                SizedBox(
                  height: 45,
                ),
                  Column(
                    children: [
                      Text(
                        _response.cityInfo.cityName,
                        style: TextStyle(fontSize: 40),
                      ),
                      Text(
                        date1,
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Image.network(_response.listInfo1.iconUrl),
                      Text(
                        '${_response.listInfo1.mainInfo.temp}°',
                        style: TextStyle(fontSize: 40),
                      ),
                      Text(_response.listInfo1.weatherInfo.description),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            FontAwesomeIcons.wind,
                          ),
                          Padding(
                            padding: EdgeInsets.all(25.0),
                            child : Text('Wind speed\n${_response.listInfo1.windInfo.speed}'),
                          ),
                          const Icon(
                            FontAwesomeIcons.smog,
                          ),
                          Padding(
                            padding: EdgeInsets.all(25.0),
                            child : Text('Humidity\n${_response.listInfo1.mainInfo.humidity}'),
                          ),
                        ],
                      ),
                    ],
                  ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      semanticContainer: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            date2,
                            style: new TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Image.network(_response.listInfo2.iconUrl),
                          SizedBox(
                            width: 100,
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child : Text(
                                    '${_response.listInfo2.mainInfo.temp_min}',
                                    style: new TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  FontAwesomeIcons.temperatureLow,
                                  size: 15,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child : Text(
                                    '${_response.listInfo2.mainInfo.temp_max}',
                                    style: new TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  FontAwesomeIcons.temperatureHigh,
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    Card(
                      semanticContainer: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            date3,
                            style: new TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Image.network(_response.listInfo3.iconUrl),
                          SizedBox(
                            width: 100,
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child : Text(
                                    '${_response.listInfo3.mainInfo.temp_min}',
                                    style: new TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  FontAwesomeIcons.temperatureLow,
                                  size: 15,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child : Text(
                                    '${_response.listInfo3.mainInfo.temp_max}',
                                    style: new TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  FontAwesomeIcons.temperatureHigh,
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    Card(
                      semanticContainer: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            date4,
                            style: new TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Image.network(_response.listInfo4.iconUrl),
                          SizedBox(
                            width: 100,
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child : Text(
                                    '${_response.listInfo4.mainInfo.temp_min}',
                                    style: new TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  FontAwesomeIcons.temperatureLow,
                                  size: 15,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child : Text(
                                    '${_response.listInfo4.mainInfo.temp_max}',
                                    style: new TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  FontAwesomeIcons.temperatureHigh,
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    Card(
                      semanticContainer: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            date5,
                            style: new TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Image.network(_response.listInfo5.iconUrl),
                          SizedBox(
                            width: 100,
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child : Text(
                                    '${_response.listInfo5.mainInfo.temp_min}',
                                    style: new TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  FontAwesomeIcons.temperatureLow,
                                  size: 15,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child : Text(
                                    '${_response.listInfo5.mainInfo.temp_max}',
                                    style: new TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  FontAwesomeIcons.temperatureHigh,
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),

          ),
        ));
  }

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(() => _response = response);
  }
}