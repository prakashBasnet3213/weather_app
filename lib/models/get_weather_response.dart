// To parse this JSON data, do
//
//     final getWeatherResponse = getWeatherResponseFromJson(jsonString);

import 'dart:convert';

GetWeatherResponse getWeatherResponseFromJson(String str) => GetWeatherResponse.fromJson(json.decode(str));

String getWeatherResponseToJson(GetWeatherResponse data) => json.encode(data.toJson());

class GetWeatherResponse {
    GetWeatherResponse({
        this.cod,
        this.message,
        this.cnt,
        this.list,
        this.city,
    });

    final String? cod;
    final int? message;
    final int? cnt;
    final List<ListElement>? list;
    final City? city;

    factory GetWeatherResponse.fromJson(Map<String, dynamic> json) => GetWeatherResponse(
        cod: json["cod"],
        message: json["message"],
        cnt: json["cnt"],
        list: json["list"] == null ? [] : List<ListElement>.from(json["list"]!.map((x) => ListElement.fromJson(x))),
        city: json["city"] == null ? null : City.fromJson(json["city"]),
    );

    Map<String, dynamic> toJson() => {
        "cod": cod,
        "message": message,
        "cnt": cnt,
        "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
        "city": city?.toJson(),
    };
}

class City {
    City({
        this.id,
        this.name,
        this.coord,
        this.country,
        this.population,
        this.timezone,
        this.sunrise,
        this.sunset,
    });

    final int? id;
    final String? name;
    final Coord? coord;
    final String? country;
    final int? population;
    final int? timezone;
    final int? sunrise;
    final int? sunset;

    factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
        coord: json["coord"] == null ? null : Coord.fromJson(json["coord"]),
        country: json["country"],
        population: json["population"],
        timezone: json["timezone"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "coord": coord?.toJson(),
        "country": country,
        "population": population,
        "timezone": timezone,
        "sunrise": sunrise,
        "sunset": sunset,
    };
}

class Coord {
    Coord({
        this.lat,
        this.lon,
    });

    final double? lat;
    final double? lon;

    factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
    };
}

class ListElement {
    ListElement({
        this.dt,
        this.main,
        this.weather,
        this.clouds,
        this.wind,
        this.visibility,
        this.pop,
        this.sys,
        this.dtTxt,
    });

    final int? dt;
    final MainClass? main;
    final List<Weather>? weather;
    final Clouds? clouds;
    final Wind? wind;
    final int? visibility;
    final double? pop;
    final Sys? sys;
    final DateTime? dtTxt;

    factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        dt: json["dt"],
        main: json["main"] == null ? null : MainClass.fromJson(json["main"]),
        weather: json["weather"] == null ? [] : List<Weather>.from(json["weather"]!.map((x) => Weather.fromJson(x))),
        clouds: json["clouds"] == null ? null : Clouds.fromJson(json["clouds"]),
        wind: json["wind"] == null ? null : Wind.fromJson(json["wind"]),
        visibility: json["visibility"],
        pop: json["pop"]?.toDouble(),
        sys: json["sys"] == null ? null : Sys.fromJson(json["sys"]),
        dtTxt: json["dt_txt"] == null ? null : DateTime.parse(json["dt_txt"]),
    );

    Map<String, dynamic> toJson() => {
        "dt": dt,
        "main": main?.toJson(),
        "weather": weather == null ? [] : List<dynamic>.from(weather!.map((x) => x.toJson())),
        "clouds": clouds?.toJson(),
        "wind": wind?.toJson(),
        "visibility": visibility,
        "pop": pop,
        "sys": sys?.toJson(),
        "dt_txt": dtTxt?.toIso8601String(),
    };
}

class Clouds {
    Clouds({
        this.all,
    });

    final int? all;

    factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"],
    );

    Map<String, dynamic> toJson() => {
        "all": all,
    };
}

class MainClass {
    MainClass({
        this.temp,
        this.feelsLike,
        this.tempMin,
        this.tempMax,
        this.pressure,
        this.seaLevel,
        this.grndLevel,
        this.humidity,
        this.tempKf,
    });

    final double? temp;
    final double? feelsLike;
    final double? tempMin;
    final double? tempMax;
    final int? pressure;
    final int? seaLevel;
    final int? grndLevel;
    final int? humidity;
    final double? tempKf;

    factory MainClass.fromJson(Map<String, dynamic> json) => MainClass(
        temp: json["temp"]?.toDouble(),
        feelsLike: json["feels_like"]?.toDouble(),
        tempMin: json["temp_min"]?.toDouble(),
        tempMax: json["temp_max"]?.toDouble(),
        pressure: json["pressure"],
        seaLevel: json["sea_level"],
        grndLevel: json["grnd_level"],
        humidity: json["humidity"],
        tempKf: json["temp_kf"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "sea_level": seaLevel,
        "grnd_level": grndLevel,
        "humidity": humidity,
        "temp_kf": tempKf,
    };
}

class Sys {
    Sys({
        this.pod,
    });

    final Pod? pod;

    factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        pod: podValues.map[json["pod"]],
    );

    Map<String, dynamic> toJson() => {
        "pod": podValues.reverse[pod],
    };
}

enum Pod { N, D }

final podValues = EnumValues({
    "d": Pod.D,
    "n": Pod.N
});

class Weather {
    Weather({
        this.id,
        this.main,
        this.description,
        this.icon,
    });

    final int? id;
    final MainEnum? main;
    final Description? description;
    final String? icon;

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: mainEnumValues.map[json["main"]],
        description: descriptionValues.map[json["description"]],
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "main": mainEnumValues.reverse[main],
        "description": descriptionValues.reverse[description],
        "icon": icon,
    };
}

enum Description { SCATTERED_CLOUDS, FEW_CLOUDS, CLEAR_SKY, BROKEN_CLOUDS, OVERCAST_CLOUDS }

final descriptionValues = EnumValues({
    "broken clouds": Description.BROKEN_CLOUDS,
    "clear sky": Description.CLEAR_SKY,
    "few clouds": Description.FEW_CLOUDS,
    "overcast clouds": Description.OVERCAST_CLOUDS,
    "scattered clouds": Description.SCATTERED_CLOUDS
});

enum MainEnum { CLOUDS, CLEAR }

final mainEnumValues = EnumValues({
    "Clear": MainEnum.CLEAR,
    "Clouds": MainEnum.CLOUDS
});

class Wind {
    Wind({
        this.speed,
        this.deg,
        this.gust,
    });

    final double? speed;
    final int? deg;
    final double? gust;

    factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"]?.toDouble(),
        deg: json["deg"],
        gust: json["gust"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
        "gust": gust,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
