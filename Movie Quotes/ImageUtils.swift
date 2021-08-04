//
//  ImageUtils.swift
//  Movie Quotes
//
//  Created by Loki Strain on 8/3/21.
//

import Foundation
import UIKit
import Kingfisher

class ImageUtils{
    
    static func load(imageView: UIImageView, from url: String) {
        if let imgUrl = URL(string: url) {
            imageView.kf.setImage(with: imgUrl)
            
            
//          DispatchQueue.global().async { // Download in the background
//            do {
//              let data = try Data(contentsOf: imgUrl)
//              DispatchQueue.main.async { // Then update on main thread
//                imageView.image = UIImage(data: data)
//              }
//            } catch {
//              print("Error downloading image: \(error)")
//            }
//          }
       }
      }
}