//
//  SuperPayRepository.swift
//  MiniSuperApp
//
//  Created by JongHoon on 2023/07/07.
//

import Foundation

protocol SuperPayRepository {
  var balance: ReadOnlyCurrentValuePublisher<Double> { get }
}

final class SuperPayRepositoryImp: SuperPayRepository {
  var balance: ReadOnlyCurrentValuePublisher<Double> { balanceSubject }
  
  private let balanceSubject = CurrentValuePublisher<Double>(0)
}
