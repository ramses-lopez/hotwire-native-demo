import UIKit
import Turbo
import SafariServices

let baseURL = URL(string: "https://your-rails-app.com")!

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    private lazy var navigationController = UINavigationController()
    
    private lazy var session: Session = {
        let configuration = WKWebViewConfiguration()
        configuration.applicationNameForUserAgent = "HotwireApp iOS"
        configuration.preferences.javaScriptEnabled = true
        
        let session = Session(webViewConfiguration: configuration)
        session.delegate = self
        session.pathConfiguration = PathConfiguration(sources: [
            .file(Bundle.main.url(forResource: "path-configuration", withExtension: "json")!),
        ])
        return session
    }()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        visit(url: baseURL)
    }
    
    private func visit(url: URL, action: VisitAction = .advance) {
        let viewController = VisitableViewController(url: url)
        navigationController.pushViewController(viewController, animated: true)
        session.visit(viewController, action: action)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}

// MARK: - Session Delegate

extension SceneDelegate: SessionDelegate {
    func session(_ session: Session, didProposeVisit proposal: VisitProposal) {
        visit(url: proposal.url, action: proposal.options.action)
    }
    
    func session(_ session: Session, didFailRequestForVisitable visitable: Visitable, error: Error) {
        print("Session failed request: \(error)")
        
        if let turboError = error as? TurboError {
            switch turboError {
            case .networkFailure, .timeoutFailure:
                showErrorAlert(message: "Network connection error. Please check your connection.")
            case .contentTypeMismatch:
                showErrorAlert(message: "Content type mismatch.")
            case .pageLoadFailure:
                showErrorAlert(message: "Page failed to load.")
            case .httpFailure(let statusCode):
                showErrorAlert(message: "HTTP Error: \(statusCode)")
            }
        } else {
            showErrorAlert(message: "An error occurred: \(error.localizedDescription)")
        }
    }
    
    func sessionWebViewProcessDidTerminate(_ session: Session) {
        session.reload()
    }
    
    private func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        navigationController.present(alert, animated: true)
    }
}

// MARK: - Visitable View Controller

class VisitableViewController: UIViewController, Visitable {
    weak var visitableDelegate: VisitableDelegate?
    var visitableURL: URL
    
    init(url: URL) {
        self.visitableURL = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        // Set navigation title from URL path
        title = visitableURL.lastPathComponent.isEmpty ? "Home" : visitableURL.lastPathComponent.replacingOccurrences(of: "-", with: " ").capitalized
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        visitableDelegate?.visitableViewWillAppear(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        visitableDelegate?.visitableViewWillDisappear(self)
    }
    
    func visitableDidRender() {
        // Called when the visitable has finished rendering
    }
}