import ModernRIBs

public protocol AppHomeDependency: Dependency {
}

final class AppHomeComponent: Component<AppHomeDependency>, TransportHomeDependency {
}

// MARK: - Builder

public protocol AppHomeBuildable: Buildable {
  func build(withListener listener: AppHomeListener) -> ViewableRouting
}

/// AppHome Riblet을 만들다
public final class AppHomeBuilder: Builder<AppHomeDependency>, AppHomeBuildable {
  
  public override init(dependency: AppHomeDependency) {
    super.init(dependency: dependency)
  }
  
  /// Riblet에 필요한 객체들을 생성한다.
  ///  - component: 로직을 수행하는데 필요한 객체들을 담고있는 바구니
  ///  - interactor: business logic이 들어가는 Riblet의 두뇌
  ///  - router: Riblet간 이동을 담당
  ///    - ribs는 트리 구조이다 Riblet은 여러개의 자식, 하나의 부모를 갖을수 있다.
  ///    - 자식 Riblets을 땟다 붙였다 한다.
  public func build(withListener listener: AppHomeListener) -> ViewableRouting {
    let component = AppHomeComponent(dependency: dependency)
    let viewController = AppHomeViewController()
    let interactor = AppHomeInteractor(presenter: viewController)
    interactor.listener = listener
    
    let transportHomeBuilder = TransportHomeBuilder(dependency: component)
    
    /// return된 router는 부모 riblet이 사용
    /// 
    return AppHomeRouter(
      interactor: interactor,
      viewController: viewController,
      transportHomeBuildable: transportHomeBuilder
    )
  }
}
