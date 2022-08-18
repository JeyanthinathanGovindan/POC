//
//  HomeViewModel.swift
//  VajroCodeTask_Jeyanthinathan
//
//  Created by AMBINO4526 on 06/08/22.
//

import Foundation

class HomeViewModel {
    
    var articles: [Article]?
    var didCompleteDownload: (() -> ())?
    
    init() {
        getUpdatedData()
    }
    
    func getUpdatedData() {
        getValuesFromService(completionHandler: { response in
            self.articles = response?.articles
            DispatchQueue.main.async {
                self.didCompleteDownload?()
            }
        })
    }
    
    func getValuesFromService(completionHandler: @escaping (DataResponse?) -> Void) {
        guard let serviceUrl = URL(string: "https://run.mocky.io/v3/cdc1c53e-2825-4162-826d-b8294e477934") else { return }
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "GET"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let dataResponse = try? decoder.decode(DataResponse.self, from: data)
                    completionHandler(dataResponse)
                }
            }
        }.resume()
    }
}
