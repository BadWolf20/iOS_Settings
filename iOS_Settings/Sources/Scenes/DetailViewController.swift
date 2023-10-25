//
//  WiFiViewController.swift
//  iOS_Settings
//
//  Created by Roman on 24.10.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    let screenName: String


    // MARK: - Components



    // MARK: - Initializers
    init(screenName: String) {
        self.screenName = screenName
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }


    // MARK: - Setup
    private func setupUI() {

        setupHierarchy()
        setupConstraints()
        setupComponents()
        setupText()
    }

    private func setupHierarchy() {

    }

    private func setupComponents() {
        view.backgroundColor = .systemGreen
        self.navigationController?.navigationBar.prefersLargeTitles = true

        self.title = screenName
    }

    private func setupText() {

    }

    private func setupConstraints() {

    }

    // MARK: - Update



    // MARK: - Actions



    // MARK: - Functions

}
