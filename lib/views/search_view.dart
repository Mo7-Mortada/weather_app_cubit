import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app1/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search a City')),
      body: Column(
        children: [
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: TextField(
                onSubmitted: (value) async {
                  // var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
                  var getWeatherCubit = context.read<GetWeatherCubit>();
                  getWeatherCubit.getWeather(cityName: value);
                  Navigator.of(context).pop();
                  searchController.clear();
                },
                controller: searchController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 32,
                  ),
                  labelText: 'Search',
                  suffixIcon: Icon(Icons.search),
                  hintText: 'Enter city name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
