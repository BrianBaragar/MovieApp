//
//  ManagerConector.swift
//  Movie App
//
//  Created by Brian Baragar on 05/01/21.
//

import Foundation
import RxSwift

class ManagerConector {
    
    func getPopularsMovies() -> Observable<[Movie]>{
        return Observable.create { observer in
            let session = URLSession.shared
            var request = URLRequest(url: URL(string: Constants.URL.host+Constants.EndPoints.urlListPopularMovies+Constants.apiKey)!)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            session.dataTask(with: request) { (data, response, error) in
                guard let data = data, error == nil, let response = response as? HTTPURLResponse else {return}
                if response.statusCode == 200{
                    do {
                        let decoder = JSONDecoder()
                        let movies = try decoder.decode(Movies.self, from: data)
                        observer.onNext(movies.listOfMovies)
                    } catch let error{
                        observer.onError(error)
                        print(error.localizedDescription)
                    }
                }
                else if response.statusCode == 401 {
                    print("Error 401")
                }
                observer.onCompleted()
            }.resume()
            
            return Disposables.create{
                session.finishTasksAndInvalidate()
            }
        }
    
    }
    
    func getDetailMovie(){
        
    }
    
}
