import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LatLng? storeLocation = LatLng(24.807279319217603, 46.616273400227904);
  Set<Marker> markers = {};

  LocationBloc() : super(LocationInitial()) {
    on<MarkerEvent>(markerMethod);
  }

  FutureOr<void> markerMethod(
    MarkerEvent event,
    Emitter<LocationState> emit,
  ) async {
    markers = {Marker(markerId: MarkerId('store'), position: storeLocation!)};

    emit(SuccessState(markers: markers));
  }
}
