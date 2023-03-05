//
//  ViewController.swift
//  BMI-Calculator
//
//  Created by Sonata Girl on 01.03.2023.
//

import UIKit

final class MainViewController: UIViewController {

    var calculatorBrain = CalculatorBrain()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "calculate_background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "CALCULATE YOUR BMI"
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var heightStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.spacing = 0
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var heightLabel: UILabel = {
        let label = UILabel()
        label.text = "Height"
        label.font = .systemFont(ofSize: 17)
        label.textColor = .darkGray
        label.contentMode = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var heightValueLabel: UILabel = {
        let label = UILabel()
        label.text = "1.5m"
        label.font = .systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.contentMode = .right
        return label
    }()
    
    private lazy var heightSlider: UISlider = {
        let slider = UISlider()
        slider.maximumValue = 3
        slider.minimumValue = 0
        slider.value = 1.5
        slider.minimumTrackTintColor = #colorLiteral(red: 0.6361649632, green: 0.6312126517, blue: 0.868719995, alpha: 0.6433412666)
        slider.thumbTintColor = #colorLiteral(red: 0.6361649632, green: 0.6312126517, blue: 0.868719995, alpha: 0.6433412666)
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(heightSliderAction), for: .valueChanged)
        return slider
    }()
    
    private lazy var weightStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.spacing = 0
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var weightLabel: UILabel = {
        let label = UILabel()
        label.text = "Weight"
        label.font = .systemFont(ofSize: 17)
        label.textColor = .darkGray
        label.contentMode = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var weightValueLabel: UILabel = {
        let label = UILabel()
        label.text = "100kg"
        label.font = .systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.contentMode = .right
        return label
    }()
    
    private lazy var weightSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 200
        slider.value = 100
        slider.minimumTrackTintColor = #colorLiteral(red: 0.6361649632, green: 0.6312126517, blue: 0.868719995, alpha: 0.6433412666)
        slider.thumbTintColor = #colorLiteral(red: 0.6361649632, green: 0.6312126517, blue: 0.868719995, alpha: 0.6433412666)
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(weightSliderAction), for: .valueChanged)
        return slider
    }()
    
    private lazy var calcBUtton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.386043489, green: 0.3761426806, blue: 0.6165835857, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("CALCULATE", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)

        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupUI()
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
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ])
        
        mainStackView.addArrangedSubview(mainLabel)
        mainStackView.addArrangedSubview(heightStackView)
       
        NSLayoutConstraint.activate([
            heightStackView.heightAnchor.constraint(equalToConstant: 21)
        ])
        
        heightStackView.addArrangedSubview(heightLabel)
        heightStackView.addArrangedSubview(heightValueLabel)
        
        mainStackView.addArrangedSubview(heightSlider)
        NSLayoutConstraint.activate([
            heightSlider.heightAnchor.constraint(equalToConstant: 60)
        ])
      
        mainStackView.addArrangedSubview(weightStackView)
        NSLayoutConstraint.activate([
            weightStackView.heightAnchor.constraint(equalToConstant: 21)
        ])
        
        weightStackView.addArrangedSubview(weightLabel)
        weightStackView.addArrangedSubview(weightValueLabel)
        
        mainStackView.addArrangedSubview(weightSlider)
        NSLayoutConstraint.activate([
            weightSlider.heightAnchor.constraint(equalToConstant: 60)
        ])
      
        mainStackView.addArrangedSubview(calcBUtton)
        NSLayoutConstraint.activate([
            calcBUtton.heightAnchor.constraint(equalToConstant: 51)
        ])
       
    }

    @objc
    private func buttonTapped(button: UIButton) {
        
        calculatorBrain.calculateBMI(height: heightSlider.value, weight: weightSlider.value)

        let vc = ResultVCViewController()
        vc.bmi = calculatorBrain.getBMI()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @objc
    private func heightSliderAction(sender: UISlider) {
        heightValueLabel.text = "\(String(format: "%.2f", sender.value))m"
    }
    
    @objc
    private func weightSliderAction(sender: UISlider) {
        weightValueLabel.text = "\(Int(sender.value))Kg"
    }
}

