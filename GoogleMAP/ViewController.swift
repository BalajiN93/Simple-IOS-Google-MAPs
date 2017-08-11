//
//  ViewController.swift
//  GoogleMAP
//
//  Created by Cygnus - Sierra on 2/13/17.
//  Copyright © 2017 Cygnus - Sierra. All rights reserved.
//

import UIKit
import GoogleMaps


class ViewController: UIViewController{
    
    
    var markers:NSMutableArray = []
    var lat=0.00
    var lang=0.00
    
    
    
    var locationManager: CLLocationManager!
    
//    var locations:NSMutableArray = ["Adventist Health Bakersfield, Bakersfield, CA, USA","Kern Medical, Bakersfield, CA, USA","Samaritan Hospital, Bakersfield, CA, USA","Good Samaritan Hospital-Southwest, Bakersfield, CA, USA"]
    var locations:NSMutableArray = ["Adventist Health Bakersfield CA USA","Good Samaritan Hospital Southwest Bakersfield USA", "Kern Medical Bakersfield USA","Samaritan Hospital Bakersfield USA"]
    
    struct State {
        let name: String
        let long: CLLocationDegrees
        let lat: CLLocationDegrees
    }
    
    var states = [
        State(name: "chennai", long: 80.270718, lat: 13.082680),
        State(name: "mumbai", long: 72.877656, lat: 19.075984),
    ]
    var mapView : GMSMapView? = nil
        //    "Adventist Health Bakersfield, Bakersfield, CA, USA", "Good Samaritan Hospital, Bakersfield, CA, USA"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let camera = GMSCameraPosition.camera(withLatitude: 35.383400, longitude: -119.020602, zoom: 1.0)
        
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView?.isMyLocationEnabled = true
        mapView?.settings.myLocationButton = true
        mapView?.settings.compassButton = true
//        mapView?.mapType = kGMSTypeNormal
        self.view = mapView
        
        for addr in locations
        {
            getLatlang(addr: addr as! String)
        }
       
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
//                            let camera = GMSCameraPosition.camera(withLatitude: 13.082680, longitude: 80.270718, zoom: 6.0)
//                            let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
//                            mapView.isMyLocationEnabled = true
//                            mapView.settings.myLocationButton = true
//                            mapView.settings.compassButton = true
//                            mapView.mapType = kGMSTypeNormal
//                            self.view = mapView
//        
//        
//        
//        for state in states
//        {
//            let state_marker = GMSMarker()
//            state_marker.position = CLLocationCoordinate2D(latitude: state.lat, longitude: state.long)
//            state_marker.title = state.name
//            state_marker.snippet = "Hey, this is \(state.name)"
//            state_marker.map = mapView
//        }
        
        
        
//
//        
//        
//        
//        
//        
//        for addr in locations
//        {
//            
//            
//            let geocoder = CLGeocoder()
//            
//            
//            geocoder.geocodeAddressString(addr as! String, completionHandler: {(placemarks, error) -> Void in
//                if((error) != nil){
//                    print("Error", error)
//                }
//                if let placemark = placemarks?.first {
//                    let coordinates:CLLocationCoordinate2D = placemark.location!.coordinate
//                    coordinates.latitude
//                    coordinates.longitude
//                    
//                    print("lat", coordinates.latitude)
//                    print("long", coordinates.longitude)
//                    
//                    
//                    
//                    self.lat = coordinates.latitude
//                    self.lang = coordinates.longitude
//                    
//                    print("---->addr\(self.lat)")
//                    
//                    
//                    
//                    
//                    
//                    let camera = GMSCameraPosition.camera(withLatitude: 11.023649, longitude: 76.904188, zoom: 10.0)
//                    let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
//                    mapView.isMyLocationEnabled = true
//                    mapView.settings.myLocationButton = true
//                    mapView.settings.compassButton = true
//                    mapView.mapType = kGMSTypeNormal
//                    self.view = mapView
//                    
//                    let marker0 = GMSMarker()
//                    marker0.position = CLLocationCoordinate2D(latitude: 10.880567, longitude: 77.154515)
//                    marker0.title = "Bus stop"
//                    marker0.snippet = "Vadavalli, Coimbatore"
//                    marker0.appearAnimation=kGMSMarkerAnimationPop
//                    marker0.icon = GMSMarker.markerImage(with: UIColor.brown)
//                    marker0.map = mapView
//                    
//                    
//                    let marker = GMSMarker()
//                    marker.position = CLLocationCoordinate2D(latitude: 11.023649, longitude: 76.904188)
//                    marker.title = "Cygnus Softwares"
//                    marker.snippet = "Vadavalli, Coimbatore"
//                    marker.appearAnimation=kGMSMarkerAnimationPop
//                    marker.icon = GMSMarker.markerImage(with: UIColor.green)
//                    marker.map = mapView
//                    
//                    
//                    
//                    let marker1 = GMSMarker()
//                    marker1.position = CLLocationCoordinate2D(latitude: 11.023519, longitude: 76.905404)
//                    marker1.title = "App Inovation Technologies"
//                    marker1.snippet = "Vadavalli, Coimbatore"
//                    marker1.appearAnimation=kGMSMarkerAnimationPop
//                    marker1.map = mapView
//                    
//                    
//                    
//                    let marker2 = GMSMarker()
//                    marker2.position = CLLocationCoordinate2D(latitude: 11.021348, longitude: 76.911539)
//                    marker2.title = "Mindzpark"
//                    marker2.snippet = "Vadavalli, Coimbatore"
//                    marker2.icon = GMSMarker.markerImage(with: UIColor.purple)
//                    marker2.appearAnimation=kGMSMarkerAnimationPop
//                    marker2.map = mapView
//                    
//                    
//                    
//                    let marker3 = GMSMarker()
//                    marker3.position = CLLocationCoordinate2D(latitude: 11.021503, longitude: 76.916509)
//                    marker3.title = "Technoduce Info Solutions Pvt Ltd"
//                    marker3.snippet = "Vadavalli, Coimbatore"
//                    marker3.appearAnimation=kGMSMarkerAnimationPop
//                    marker3.map = mapView
//                    
//                    
//                    var path = GMSMutablePath();
//                    path.add(CLLocationCoordinate2DMake(CDouble((10.880567)), CDouble((77.154515))))
//                    path.add(CLLocationCoordinate2DMake(CDouble((11.023649)), CDouble((76.904188))))
//                    var rectangle = GMSPolyline(path: path)
//                    rectangle.strokeWidth = 2.0
//                    rectangle.strokeColor = UIColor.orange
//                    rectangle.map=mapView
//                    
//                   
//                            
//                            
//                            //            let marker = GMSMarker()
//                            //            marker.position = CLLocationCoordinate2D(latitude: self.lat, longitude: self.lang)
//                            //            marker.title = addr as! String
//                            //            marker.snippet = addr as! String
//                            //            marker.appearAnimation=kGMSMarkerAnimationPop
//                            //            marker.map = mapView
//                            //
//                            //            self.markers.add(marker)
//                            
//                            
//                        }
//                    })
//                }
//                
        
                
                
                
            }
            
    func getLatlang(addr:String)  {
        
        
        let geocoder = CLGeocoder()
        
        
                    geocoder.geocodeAddressString(addr as! String, completionHandler: {(placemarks, error) -> Void in
                        if((error) != nil){
                            print("Error", error)
                        }
                        if let placemark = placemarks?.first {
                            let coordinates:CLLocationCoordinate2D = placemark.location!.coordinate
                            
        
                            
                            self.states.append(State(name: addr, long: coordinates.longitude, lat: coordinates.latitude))
        
                            print("---->addr\(self.lat)")
                        
                            self.count += 1;
                            
                            if(self.count == self.locations.count)
                            {
                                print("****************",self.count,"  =============   ",self.locations.count ,"********")
                                for state in self.states
                                {
                                    print("GOt it")
                                    let state_marker = GMSMarker()
                                    state_marker.position = CLLocationCoordinate2D(latitude: state.lat, longitude: state.long)
                                    state_marker.title = state.name
                                    state_marker.snippet = "Hey, this is \(state.name)"
                                    state_marker.map = self.mapView
                                
                                }                            }
                            
                            
                        
                        }
                    })
    }

    
    
  
    
 var count  = 0
    
    
    
    
}

