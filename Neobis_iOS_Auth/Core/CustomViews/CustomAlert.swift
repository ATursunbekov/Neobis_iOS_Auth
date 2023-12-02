import UIKit
import SnapKit

class CustomAlertViewController: UIViewController {
    
    lazy var alertView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .white
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Мы выслали еще одно письмо на указанную тобой почту example@gmail.com"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont(name: "MPLUS1p-Medium", size: 20)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = """
        Не забудь проверить
        ящик “Спам”!11!!!!
        """
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont(name: "MPLUS1p-Medium", size: 16)
        label.textColor = UIColor(hex: "#767676")
        return label
    }()
    
    lazy var clearButton: UIButton = {
        let button = UIButton()
        button.setTitle("Понятно!!1!", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 12
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        setupConstraints()
        clearButton.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
    }
    
    func setupConstraints () {
        view.addSubview(alertView)
        alertView.addSubview(titleLabel)
        alertView.addSubview(descriptionLabel)
        alertView.addSubview(clearButton)
        
        alertView.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.height.equalTo(262)
            make.width.equalTo(343)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(25)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        clearButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(25)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
    }
    
    @objc func dismissAlert() {
        dismiss(animated: true, completion: nil)
    }
}
