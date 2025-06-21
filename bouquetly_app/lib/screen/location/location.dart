import 'package:bouquetly_app/extension/app_size.dart';
import 'package:bouquetly_app/screen/location/bloc/location_bloc.dart';
import 'package:bouquetly_app/style/app_colors.dart';
import 'package:bouquetly_app/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationBloc()..add(MarkerEvent()),
      child: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state is SuccessState) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.darkBeige,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
                title: Text('Store Location', style: AppTextStyle.headerText),
              ),
              body: SizedBox(
                height: context.getHight(),
                width: context.getWidth(),
                child: GoogleMap(
                  mapType: MapType.normal,
                  markers: state.markers,
                  initialCameraPosition: CameraPosition(
                    target: state.markers.first.position,
                    zoom: 15,
                  ),
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
