//
//  ReviewRepository.swift
//  CustomKeyboard
//
//  Created by Kai Kim on 2022/07/12.
//

import Foundation

final class ReviewRepository {
  
  let network: NetworkServiceable
  
  init(network: NetworkService = NetworkService()){
    self.network = network
  }
  
  func fetchReviews(endPoint: EndPoint, completion: @escaping (Result<Review, Error>) -> Void) {
    let URLRequest = URLRequest.makeURLRequest(request: Requset(requestType: .get, endPoint: endPoint))
    network.request(on: URLRequest) { result in
      switch result {
      case .success(let data):
        guard let reviewResponse = Decoder<ReviewResponse>().decode(data: data) else {return}
        reviewResponse.data.forEach({
          print($0.toDomain)
        })
      case .failure(let error):
        print(error)
      }
    }
  }
  
  
  
  
}
