//
//  MiniMapView.swift
//  CaritasMty
//
//  Created by Alumno on 12/10/23.
//


import SwiftUI
import CoreLocation
import CoreLocationUI
import MapKit

extension UIImage {
    func resize(to size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        self.draw(in: CGRect(origin: .zero, size: size))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}

struct MiniMapView: View {
    @State var coordinatesend: CLLocationCoordinate2D
    @State var region: MKCoordinateRegion
    var body: some View {
            VStack {
                RouteMapView(region: $region, endCoordinate: coordinatesend)
                    .ignoresSafeArea()
            }
        }
    func updateEndCoordinate(newCoordinate: CLLocationCoordinate2D) {
            self.coordinatesend = newCoordinate
            self.region = MKCoordinateRegion(center: newCoordinate, latitudinalMeters: 2000, longitudinalMeters: 2000)
        }
    }

struct RouteMapView: UIViewRepresentable {
    @Binding var region: MKCoordinateRegion
    var endCoordinate: CLLocationCoordinate2D
    @State private var locationManager = CLLocationManager()
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        locationManager.delegate = context.coordinator
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.setRegion(region, animated: true)
        context.coordinator.mapView = uiView  // Update the mapView property on the coordinator
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate, CLLocationManagerDelegate {
        var parent: RouteMapView
        var mapView: MKMapView?  // Add a mapView property to the coordinator
        
        init(_ parent: RouteMapView) {
            self.parent = parent
            
        }
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.last else { return }
            let currentCoordinate = location.coordinate
            print(currentCoordinate)
            manager.stopUpdatingLocation()  // Stop updating location to prevent multiple route requests
            
            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: MKPlacemark(coordinate: currentCoordinate))
            request.destination = MKMapItem(placemark: MKPlacemark(coordinate: parent.endCoordinate))
            let directions = MKDirections(request: request)
            directions.calculate { response, error in
                guard let route = response?.routes.first else { return }
                self.mapView?.addOverlay(route.polyline)
                self.parent.addMarker(annotation: MKPointAnnotation(coordinate: currentCoordinate, title: "Start"), mapView: self.mapView)
                self.parent.addMarker(annotation: MKPointAnnotation(coordinate: self.parent.endCoordinate, title: "End"), mapView: self.mapView)
            }
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
                    guard !(annotation is MKUserLocation) else {
                        return nil
                    }
                    let identifier = "CustomAnnotationView"
                    var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
                    if annotationView == nil {
                        annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                    } else {
                        annotationView?.annotation = annotation
                    }
                    switch annotation.title {
                    case "Start":
                        annotationView?.image = UIImage(named: "logo-caritas")?.resize(to: CGSize(width: 40, height: 30))
                    case "End":
                        annotationView?.image = UIImage(named: "lobster-icon")?.resize(to: CGSize(width: 30, height: 30))
                    default:
                        annotationView?.image = nil
                    }
                    return annotationView
                }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {

            
            if overlay is MKPolyline {
                let renderer = MKPolylineRenderer(polyline: overlay as! MKPolyline)
                renderer.strokeColor = UIColor(red: 0, green: 156/255, blue: 166/255, alpha: 1)
                renderer.lineWidth = 5
                return renderer
            }
            return MKOverlayRenderer()
        }
    }
    
    func addMarker(annotation: MKPointAnnotation, mapView: MKMapView?) {
        mapView?.addAnnotation(annotation)
    }
}


    extension MKDirections.Request {
        convenience init(end: CLLocationCoordinate2D) {
            self.init()
            self.destination = MKMapItem(placemark: MKPlacemark(coordinate: end))
        }
    }

    extension MKPointAnnotation {
        convenience init(coordinate: CLLocationCoordinate2D, title: String) {
            self.init()
            self.coordinate = coordinate
            self.title = title
        }
    }

struct Marcador: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}
    struct MiniMapView_Previews: PreviewProvider {
        static var previews: some View {
            MiniMapView(coordinatesend: CLLocationCoordinate2D(latitude: 25.632559, longitude: -100.371271), region: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 25.632559, longitude: -100.371271), latitudinalMeters: 2000, longitudinalMeters: 2000))
        }
    }


//    var body: some View {
//        VStack {
//            RouteMapView(region: $region, route: MKDirections.Request(start: coordinatesstart, end: coordinatesend))
//                .ignoresSafeArea().onAppear(){
//                    region = MKCoordinateRegion(center: coordinatesstart, latitudinalMeters: 200, longitudinalMeters: 200)
//                }
//        }
//    }
//}
//
//struct RouteMapView: UIViewRepresentable {
//    @Binding var region: MKCoordinateRegion
//    var route: MKDirections.Request
//    @State private var locationManager = CLLocationManager()
//
//
//    func makeUIView(context: Context) -> MKMapView {
//        let mapView = MKMapView()
//        mapView.delegate = context.coordinator
//        locationManager.delegate = context.coordinator
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.startUpdatingLocation()
//        return mapView
//    }
//
//    func updateUIView(_ uiView: MKMapView, context: Context) {
//        uiView.setRegion(region, animated: true)
//        let directions = MKDirections(request: route)
//        directions.calculate { response, error in
//            guard let route = response?.routes.first else { return }
//            uiView.addOverlay(route.polyline)
//            self.addMarkers(mapView: uiView)
//        }
//    }
//
//    func addMarkers(mapView: MKMapView) {
//           let startAnnotation = MKPointAnnotation()
//        startAnnotation.coordinate = route.source?.placemark.coordinate ?? CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
//           startAnnotation.title = "Start"
//
//           let endAnnotation = MKPointAnnotation()
//        endAnnotation.coordinate = route.destination?.placemark.coordinate ?? CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
//           endAnnotation.title = "End"
//
//
//           mapView.addAnnotations([startAnnotation, endAnnotation])  // Add markers to the map
//       }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    class Coordinator: NSObject, MKMapViewDelegate, CLLocationManagerDelegate {
//        var parent: RouteMapView
//        var mapView: MKMapView?
//
//        init(_ parent: RouteMapView) {
//            self.parent = parent
//        }
//
//        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//                    guard let location = locations.last else { return }
//                        let currentCoordinate = location.coordinate
//                        parent.route.source = MKMapItem(placemark: MKPlacemark(coordinate: currentCoordinate))  // Set the route's start coordinate to the current location
//                        parent.addMarker(annotation: MKPointAnnotation(__coordinate: currentCoordinate), mapView: mapView ?? MKMapView())
//                }
//
//        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
//            if overlay is MKPolyline {
//                let renderer = MKPolylineRenderer(polyline: overlay as! MKPolyline)
//                renderer.strokeColor = .blue
//                renderer.lineWidth = 3
//                return renderer
//            }
//            return MKOverlayRenderer()
//        }
//
//
//    }
//
//    func addMarker(annotation: MKPointAnnotation, mapView: MKMapView) {
//            mapView.addAnnotation(annotation)
//        }
//}
//
//extension MKDirections.Request {
//    convenience init(start: CLLocationCoordinate2D, end: CLLocationCoordinate2D) {
//        self.init()
//        self.source = MKMapItem(placemark: MKPlacemark(coordinate: start))
//        self.destination = MKMapItem(placemark: MKPlacemark(coordinate: end))
//    }
//}





