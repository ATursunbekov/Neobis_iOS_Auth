import UIKit
import SnapKit

class CustomLogOutAlert: UIViewController {
    
    lazy var alertView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .white
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Выйти?"
        label.textAlignment = .center
        label.font = UIFont(name: "MPLUS1p-Medium", size: 20)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Точно выйти?"
        label.textAlignment = .center
        label.font = UIFont(name: "MPLUS1p-Medium", size: 16)
        label.textColor = UIColor(hex: "#767676")
        return label
    }()
    
    lazy var leaveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Да, точно", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 12
        button.titleLabel?.font = UIFont(name: "MPLUS1p-Medium", size: 16)
        button.titleLabel?.textColor = .white
        return button
    }()
    
    lazy var stayButton: UIButton = {
        let button = UIButton()
        button.setTitle("Нет, остаться", for: .normal)
        button.titleLabel?.font = UIFont(name: "MPLUS1p-Medium", size: 16)
        button.titleLabel?.textColor = .black
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        setupConstraints()
        setupTargets()
    }
    
    func setupTargets() {
        stayButton.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        leaveButton.addTarget(self, action: #selector(leavePressed), for: .touchUpInside)
    }
    
    func setupConstraints () {
        view.addSubview(alertView)
        alertView.addSubview(titleLabel)
        alertView.addSubview(descriptionLabel)
        alertView.addSubview(leaveButton)
        alertView.addSubview(stayButton)
        
        alertView.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.height.equalTo(240)
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
        
        leaveButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(25)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
        
        stayButton.snp.makeConstraints { make in
            make.top.equalTo(leaveButton.snp.bottom).offset(25)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc func dismissAlert() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func leavePressed() {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
}
