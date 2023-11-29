import UIKit

class CustomToastView: UIView {
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: "#EC0000")
        label.numberOfLines = 0
        return label
    }()

    init(message: String) {
        super.init(frame: CGRect.zero)
        setupUI(message: message)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI(message: String) {
        backgroundColor = .white
        self.layer.cornerRadius = 12
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(hex: "#EC0000").cgColor
        
        messageLabel.text = message
        addSubview(messageLabel)
        
        messageLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
}

extension UIView {
    func showToast(message: String, duration: TimeInterval = 2.0) {
        let toastView = CustomToastView(message: message)

        addSubview(toastView)
        toastView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(58)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(55)
        }

        UIView.animate(withDuration: 0.5, delay: duration, options: .curveEaseOut) {
            toastView.alpha = 0.0
        } completion: { _ in
            toastView.removeFromSuperview()
        }
    }
}
