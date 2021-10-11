/*
{
   "list":[
      {
         "dt":1633953600,
         "main":{
            "temp":288.71,
            "temp_min":288.71,
            "temp_max":289.48,
            "humidity":64,
         },
         "weather":[
            {
               "description":"broken clouds",
               "icon":"04d"
            }
         ],
         "wind":{
            "speed":3.61,
            "deg":6,
            "gust":4.66
         },
         "dt_txt":"2021-10-11 12:00:00"
      }
      {...}
      {...}
      {...}
      ...
   ]
   "city":{
      "name":"Paris",
   }
}
 */

class WindInfo {
  final double speed;

  WindInfo({required this.speed});

  factory WindInfo.fromJson(Map<String, dynamic> json) {
    final speed = json['speed'];
    return WindInfo(speed: speed);
  }
}

class WeatherInfo {
  final String description;
  final String icon;

  WeatherInfo({required this.description, required this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];
    return WeatherInfo(description: description, icon: icon);
  }
}

class MainInfo{
  final double temp;
  final double temp_min;
  final double temp_max;
  final int humidity;

  MainInfo({required this.temp, required this.temp_min, required this.temp_max, required this.humidity});

  factory MainInfo.fromJson(Map<String, dynamic> json) {
    final temp = json['temp'];
    final temp_min = json['temp_min'];
    final temp_max = json['temp_max'];
    final humidity = json['humidity'];
    return MainInfo(temp: temp, temp_min: temp_min, temp_max: temp_max, humidity: humidity);
  }
}

class ListInfo {
  final int dt;
  final MainInfo mainInfo;
  final WeatherInfo weatherInfo;
  final WindInfo windInfo;
  final String dt_txt;

  String get iconUrl {
    return 'https://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png';
  }

  ListInfo({required this.dt, required this.mainInfo, required this.weatherInfo, required this.windInfo, required this.dt_txt});

  factory ListInfo.fromJson(Map<String, dynamic> json) {
    final dt = json['dt'];

    final mainInfoJson = json['main'];
    final mainInfo = MainInfo.fromJson(mainInfoJson);

    final weatherInfoJson = json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);

    final windInfoJson = json['wind'];
    final windInfo = WindInfo.fromJson(windInfoJson);

    final dt_txt = json['dt_txt'];

    return ListInfo(
        dt: dt, mainInfo: mainInfo, weatherInfo: weatherInfo, windInfo: windInfo, dt_txt: dt_txt);
  }
}

class CityInfo {
  final String cityName;

  CityInfo({required this.cityName});

  factory CityInfo.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    return CityInfo(cityName: name);
  }
}

class WeatherResponse {
  final ListInfo listInfo1;
  final ListInfo listInfo2;
  final ListInfo listInfo3;
  final ListInfo listInfo4;
  final ListInfo listInfo5;
  final CityInfo cityInfo;

  WeatherResponse({required this.listInfo1, required this.listInfo2, required this.listInfo3, required this.listInfo4, required this.listInfo5, required this.cityInfo});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityInfoJson = json['city'];
    final cityInfo = CityInfo.fromJson(cityInfoJson);

    //on récupère les données météo de 5 jours consécutifs
    final listInfoJson1 = json['list'][0];
    final listInfo1 = ListInfo.fromJson(listInfoJson1);
    final listInfoJson2 = json['list'][8];
    final listInfo2 = ListInfo.fromJson(listInfoJson2);
    final listInfoJson3 = json['list'][16];
    final listInfo3 = ListInfo.fromJson(listInfoJson3);
    final listInfoJson4 = json['list'][24];
    final listInfo4 = ListInfo.fromJson(listInfoJson4);
    final listInfoJson5 = json['list'][32];
    final listInfo5 = ListInfo.fromJson(listInfoJson5);

    return WeatherResponse(
        listInfo1: listInfo1, listInfo2: listInfo2, listInfo3: listInfo3, listInfo4: listInfo4, listInfo5: listInfo5, cityInfo: cityInfo);
  }
}

