import UIKit
import SnapKit

class CustomLoginTextField: UIView {
    
    lazy var fieldView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = UIColor(hex: "#F8F8F8")
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(hex: "#F8F8F8").cgColor
        return view
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var fieldButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "x.circle.fill"), for: .normal)
        button.tintColor = UIColor(hex: "#767676")
        return button
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupTargets()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        setupTargets()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        addSubview(fieldView)
        fieldView.addSubview(textField)
        fieldView.addSubview(fieldButton)
        
        fieldView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        fieldButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(21)
            make.width.equalTo(21)
        }
        
        textField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        fieldButton.isHidden = true
    }
    
    private func setupTargets() {
        fieldButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        textField.addTarget(self, action: #selector(startEditingText), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(finishEditingText), for: .editingDidEnd)
    }
    
    // MARK: - Button Actions
    
    @objc private func buttonPressed() {
        textField.text = ""
    }
    
    @objc private func startEditingText() {
        fieldButton.isHidden = false
        fieldView.layer.borderColor = UIColor.black.cgColor
    }
    
    @objc private func finishEditingText() {
        fieldView.layer.borderColor = UIColor(hex: "#F8F8F8").cgColor
        fieldButton.isHidden = true
    }
}
