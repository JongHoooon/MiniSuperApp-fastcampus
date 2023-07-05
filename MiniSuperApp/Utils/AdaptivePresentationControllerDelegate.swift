//
//  AdaptivePresentationControllerDelegate.swift
//  MiniSuperApp
//
//  Created by JongHoon on 2023/07/01.
//

import UIKit

protocol AdaptivePresentationControllerDelegate: AnyObject {
  func presentationControllerDidDismiss()
}

final class AdaptivePresentationControllerDelegateProxy: NSObject,
                                                         UIAdaptivePresentationControllerDelegate {
  
  weak var delegate: AdaptivePresentationControllerDelegate?
  
  func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
    delegate?.presentationControllerDidDismiss()
  }
}
