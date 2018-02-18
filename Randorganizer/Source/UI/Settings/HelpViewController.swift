//
//  HelpViewController.swift
//  Randorganizer
//
//  Created by Christopher Luu on 2/11/18.
//

import UIKit
import WebKit

final class HelpViewController: UIViewController {
	// MARK: - Properties -
	private let webView = WKWebView()

	// MARK: - Initializations -
	init() {
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("This init method shouldn't ever be used")
	}

	// MARK: - Lifecycle -
	override func viewDidLoad() {
		super.viewDidLoad()

		instantiateView()
	}
}

// MARK: - `ViewCustomizer` -
extension HelpViewController: ViewCustomizer {
	func styleView() {
		view.backgroundColor = .black
	}

	func addSubviews() {
		addWebView()
	}

	private func addWebView() {
		guard let path = Bundle.main.path(forResource: "Help", ofType: "html")
			else { return }

		webView.isOpaque = false
		view.addSubview(webView)

		let url = URL(fileURLWithPath: path)
		webView.loadFileURL(url, allowingReadAccessTo: url)

		webView.snp.makeConstraints { (make) in
			make.edges.equalToSuperview()
		}
	}
}
