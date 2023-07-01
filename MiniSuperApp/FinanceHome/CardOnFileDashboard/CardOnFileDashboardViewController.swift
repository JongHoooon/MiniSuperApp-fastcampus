//
//  CardOnFileDashboardViewController.swift
//  MiniSuperApp
//
//  Created by JongHoon on 2023/06/29.
//

import ModernRIBs
import UIKit

protocol CardOnFileDashboardPresentableListener: AnyObject {
  // TODO: Declare properties and methods that the view controller can invoke to perform
  // business logic, such as signIn(). This protocol is implemented by the corresponding
  // interactor class.
}

final class CardOnFileDashboardViewController: UIViewController, CardOnFileDashboardPresentable, CardOnFileDashboardViewControllable {
  
  weak var listener: CardOnFileDashboardPresentableListener?
  
  private let headerStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.alignment = .fill
    stackView.distribution = .equalSpacing
    stackView.axis = .horizontal
    return stackView
  }()
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 22, weight: .bold)
    label.textColor = .label
    label.text = "카드 및 계좌"
    return label
  }()
  
  private lazy var seeAllButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("전체보기", for: .normal)
    button.setTitleColor(.systemBlue, for: .normal)
    button.addTarget(self, action: #selector(seeAllButtonTapped), for: .touchUpInside)
    return button
  }()
  
  private let cardOnFileStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.alignment = .fill
    stackView.distribution = .equalSpacing
    stackView.axis = .vertical
    stackView.spacing = 12.0
    return stackView
  }()
  
  private lazy var addMethodButton: AddPaymentMethodButton = {
    let button = AddPaymentMethodButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.roundCorners()
    button.backgroundColor = .systemGray4
    button.addTarget(seeAllButton, action: #selector(addButtonDidTap), for: .touchUpInside)
    return button
  }()
  
  init() {
    super.init(nibName: nil, bundle: nil)
    
    setViews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func update(with viewModels: [PaymentMethodViewModel]) {
    cardOnFileStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    
    // [PaymentMethodViewModel] -> [PaymentMethodView]
    let views = viewModels.map(PaymentMethodView.init)
    
    views.forEach {
      $0.roundCorners()
      cardOnFileStackView.addArrangedSubview($0)
    }
    
    cardOnFileStackView.addArrangedSubview(addMethodButton)
    
    let heightConstraints = views.map { $0.heightAnchor.constraint(equalToConstant: 60.0) }
    NSLayoutConstraint.activate(heightConstraints)
  }
  
  private func setViews() {
    
    [
      headerStackView,
      cardOnFileStackView
    ].forEach { view.addSubview($0) }
    
    [
      titleLabel,
      seeAllButton
    ].forEach { headerStackView.addArrangedSubview($0) }
    
    NSLayoutConstraint.activate([
      headerStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
      headerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      headerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      
      cardOnFileStackView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 10.0),
      cardOnFileStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0),
      cardOnFileStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.0),
      cardOnFileStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      
      addMethodButton.heightAnchor.constraint(equalToConstant: 60.0),
    ])
  }
  
  @objc
  private func seeAllButtonTapped() {
    
  }
  
  @objc
  private func addButtonDidTap() {
    
  }
} 
