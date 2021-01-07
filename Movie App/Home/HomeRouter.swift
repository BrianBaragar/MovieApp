//
//  HomeRouter.swift
//  Movie App
//
//  Created by Brian Baragar on 21/12/20.
//

//Creara el objeto home, pero funcionara como mediador para las demás vistas
import Foundation
import UIKit
class HomeRouter {
    
    var viewController: UIViewController{
        return createViewController()
    }
    private var sourceView: UIViewController?
    
    private func createViewController() -> UIViewController{
        let view = HomeView(nibName: "HomeView", bundle: Bundle.main)
        return view
    }
    
    func setSourceView(_ sourceView: UIViewController?){
        guard let view = sourceView else {
            fatalError("Error desconocido")
        }
        self.sourceView = view
    }
}
