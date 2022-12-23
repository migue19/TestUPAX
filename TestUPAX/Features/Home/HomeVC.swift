//
//  HomeVC.swift
//  TestUPAX
//
//  Created by Miguel Mexicano Herrera on 23/12/22.
//  
//

import Foundation
import UIKit
import MapKit

class HomeVC: BaseController {
    var presenter: HomePresenterProtocol?
    var locationManager = CLLocationManager()
    var authStatus = CLAuthorizationStatus.notDetermined
    
    lazy var mapKit: MKMapView = {
        var mapKit = MKMapView()
        mapKit.translatesAutoresizingMaskIntoConstraints = false
        return mapKit
    }()
    
    lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "Bienvenido \(getName())"
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var yourLocationLabel: UILabel = {
        var label = UILabel()
        label.text = "Your Location"
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var locationLabel: UILabel = {
        var label = UILabel()
        label.text = "Florida, USA"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .gray
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        getCurrentLocation()
    }
    
    func getCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        if authStatus == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.startUpdatingLocation()
    }
    
    func setupView() {
        self.view.backgroundColor = .white
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews() {
        self.view.addSubviews(titleLabel, yourLocationLabel, locationLabel, mapKit)
    }
    
    func setupConstraints() {
        titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
        
        yourLocationLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 16).isActive = true
        yourLocationLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        yourLocationLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
        
        locationLabel.topAnchor.constraint(equalTo: self.yourLocationLabel.bottomAnchor, constant: 16).isActive = true
        locationLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        locationLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
        
        mapKit.topAnchor.constraint(equalTo: self.locationLabel.bottomAnchor, constant: 16).isActive = true
        mapKit.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        mapKit.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
        mapKit.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
}
/// Protocolo para recibir datos del presenter.
extension HomeVC: HomeViewProtocol {
}

extension HomeVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        updateMap(latitude: locValue.latitude, longitude: locValue.longitude)
        let location = CLLocation(latitude: locValue.latitude, longitude: locValue.longitude)
        getPlaceMark(location: location)
    }
    
    func getWeather(latitude: String, longitude: String) {
        
    }
    
    func getPlaceMark(location: CLLocation) {
        CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
            if error != nil {
                return
            }else if let country = placemarks?.first?.country,
                     let city = placemarks?.first?.locality {
                self.generateLocationText(city: city, country: country)
            }
            else {
            }
        })
    }
    
    func generateLocationText(city: String, country: String) {
        let location = "\(city), \(country)"
        locationLabel.text = location
    }
    
    func updateMap(latitude: Double, longitude: Double) {
        let initialLocation = CLLocation(latitude: latitude, longitude: longitude)
        mapKit.centerToLocation(initialLocation)
    }
}

extension MKMapView {
    func centerToLocation(
        _ location: CLLocation,
        regionRadius: CLLocationDistance = 1000
    ) {
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}
