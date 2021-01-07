//
//  HomeViewModel.swift
//  Movie App
//
//  Created by Brian Baragar on 21/12/20.
//

import Foundation
import RxSwift
class HomeViewModel {
    private weak var view: HomeView?
    private var router: HomeRouter?
    private var managerConection = ManagerConector()
    
    func bind(view: HomeView, router: HomeRouter){
        self.view = view
        self.router = router
        self.router?.setSourceView(view)
    }
    
    func getListMoviesData() -> Observable<[Movie]>{
        return managerConection.getPopularsMovies()
    }
}
