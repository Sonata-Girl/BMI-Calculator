//
//  ResultVCViewController.swift
//  BMI-Calculator
//
//  Created by Sonata Girl on 02.03.2023.
//

import UIKit

class ResultVCViewController: UIViewController {
    
    var result = ""
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "result_background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
        
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.spacing = 8
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.text = "YOUR RESULT"
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 35)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.text = "19.5"
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 80)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private lazy var eatLabel: UILabel = {
        let label = UILabel()
        label.text = "EAT SOME MORE SNACKS!"
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
       label.textColor = .white
        return label
    }()
    
    private lazy var calcBUtton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("RECALCULATE", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)

        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBlue
        
        setupUI()
        
        valueLabel.text = result
    }

    private func setupUI() {
        
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        view.addSubview(mainStackView)
        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        mainStackView.addArrangedSubview(resultLabel)
        mainStackView.addArrangedSubview(valueLabel)
        mainStackView.addArrangedSubview(eatLabel)
        
        view.addSubview(calcBUtton)
        NSLayoutConstraint.activate([
            calcBUtton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            calcBUtton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            calcBUtton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            calcBUtton.heightAnchor.constraint(equalToConstant: 51)
        ])
    }

    
    @objc
    private func buttonTapped(button: UIButton) {
        dismiss(animated: true)
    }
}
