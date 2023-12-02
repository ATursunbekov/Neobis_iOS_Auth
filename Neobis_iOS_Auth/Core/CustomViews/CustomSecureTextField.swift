import UIKit
import SnapKit

enum ButtonState {
    case show
    case hide
    case clear
}

class CustomSecureTextField: UIView {
    lazy var buttonState = ButtonState.show
    lazy var stateWhileEditing = ButtonState.show
    
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
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var fieldButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "show"), for: .normal)
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
            make.height.equalTo(15)
            make.width.equalTo(21)
        }
        
        textField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalTo(fieldButton.snp.leading).offset(-10)
        }
    }
    
    private func setupTargets() {
        fieldButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        textField.addTarget(self, action: #selector(startEditingText), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(finishEditingText), for: .editingDidEnd)
    }
    
    // MARK: - Button Actions
    
    @objc private func buttonPressed(endEditing: Bool = false) {
        if buttonState == .clear {
            textField.text = ""
            return
        }
        if !endEditing {
            buttonState = buttonState == .show ? .hide : .show
            textField.isSecureTextEntry.toggle()
        }
        fieldButton.setImage(UIImage(named: buttonState == .show ? "show" : "hide"), for: .normal)
        fieldButton.snp.updateConstraints { make in
            make.height.equalTo(buttonState == .show ? 15 : 20)
        }
        stateWhileEditing = buttonState
    }
    
    @objc private func startEditingText() {
        buttonState = .clear
        fieldButton.setImage(UIImage(systemName: "x.circle.fill"), for: .normal)
        fieldButton.tintColor = UIColor(hex: "#767676")
        fieldButton.snp.updateConstraints { make in
            make.height.equalTo(21)
        }
        fieldView.layer.borderColor = UIColor.black.cgColor
    }
    
    @objc private func finishEditingText() {
        fieldView.layer.borderColor = UIColor(hex: "#F8F8F8").cgColor
        buttonState = stateWhileEditing
        buttonPressed(endEditing: true)
    }
}
