//
//  LandMarkModel.swift
//  Landmaks
//
//  Created by Md Shofiulla on 27/5/24.
//

import Foundation
struct LandmarkModel: Decodable, Identifiable {
    let id: Int
    let name: String?
    let subtitle, imageName: String?
}

enum LandmarkAssets {
  case path(String)
  
  var urlString: String {
      switch self {
      case .path(let path):
          return "Landmarks/\(path)"
      }
  }
}
