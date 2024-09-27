import 'package:flutter/material.dart';

void main() {
  runApp(SimpleWeatherApp());
}

class SimpleWeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherHomePage(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class WeatherHomePage extends StatefulWidget {
  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  String selectedCity = 'Miami'; // Default city
  String weatherCondition = 'Sunny';
  double temperature = 30.0;

  // Mock weather data
  final Map<String, Map<String, dynamic>> weatherData = {
    'Miami': {'condition': 'Sunny', 'temperature': 30.0},
    'New York': {'condition': 'Cloudy', 'temperature': 20.0},
    'London': {'condition': 'Rainy', 'temperature': 15.0},
    'Tokyo': {'condition': 'Windy', 'temperature': 25.0},
  };

  void updateWeather(String city) {
    setState(() {
      selectedCity = city;
      weatherCondition = weatherData[city]!['condition'];
      temperature = weatherData[city]!['temperature'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: selectedCity,
              onChanged: (value) {
                updateWeather(value!);
              },
              items: weatherData.keys.map<DropdownMenuItem<String>>((String city) {
                return DropdownMenuItem<String>(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text(
              'Weather in $selectedCity',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            Text(
              'Condition: $weatherCondition',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Temperature: $temperature°C',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
