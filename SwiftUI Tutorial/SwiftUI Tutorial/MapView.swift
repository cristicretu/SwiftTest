//
//  MapView.swift
//  SwiftUI Tutorial
//
//  Created by Cristi Cretu on 19.06.2021.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region = MKCoordinateRegion(

        center: CLLocationCoordinate2D(latitude: 36.036_021, longitude: -121.053_868),

        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.5)

    )
    
    var body: some View {
        Map(coordinateRegion: $region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
