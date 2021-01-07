//
//  Extensions.swift
//  Movie App
//
//  Created by Brian Baragar on 06/01/21.
//

import UIKit
//Descargar imagen de un endpoint
extension UIImageView{
    func imageFromServerURL(urlString: String, placeHolderImage: UIImage){
        if self.image == nil {
            self.image = placeHolderImage
        }
        URLSession.shared.dataTask(with: URL(string: urlString)!) { (data, response, error) in
            if error != nil {
                return
            }
            DispatchQueue.main.async {
                guard let data = data else{return}
                let image = UIImage(data: data)
                self.image = image
            }
        }.resume()
    }
}
