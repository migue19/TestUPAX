//
//  HomeInteractor.swift
//  TestUPAX
//
//  Created by Miguel Mexicano Herrera on 23/12/22.
//  
//
import ConnectionLayer

class HomeInteractor {
    var presenter: HomeInteractorOutputProtocol?
    var connectionLayer = ConnectionLayer(isDebug: true)
}
extension HomeInteractor: HomeInteractorInputProtocol {
    func requestWeather(latitude: Double, longitude: Double) {
        var url: String = Endpoints.url
        url = url.replacingOccurrences(of: "{lat}", with: "\(latitude)")
        url = url.replacingOccurrences(of: "{lon}", with: "\(longitude)")
        connectionLayer.connectionRequest(url: url, method: .get) { [weak self] (data, error) in
            guard let self = self else {
                debugPrint("no hay referencia")
                return
            }
            if let error = error {
                self.receiveError(message: error)
                return
            }
            guard let data = data else {
                let error = "data no encontrada"
                self.receiveError(message: error)
                return
            }
            if let entity = Utils.decode(WeatherResponse.self, from: data, serviceName: "video_service") {
                self.receiveVideos(data: entity)
            } else {
                let error = "Error in decode"
                self.receiveError(message: error)
            }
        }
    }
    
    func receiveVideos(data: WeatherResponse) {
        DispatchQueue.main.async { [weak self] in
            self?.presenter?.sendData(data: data)
        }
    }
    
    func receiveError(message: String) {
        DispatchQueue.main.async { [weak self] in
            self?.presenter?.sendErrorMessage(message: message)
        }
    }
}
