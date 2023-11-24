import UIKit

class FloatingPlaceholderTextField: UITextField {
    
    var yAxis: CGFloat = 0

    private let floatingLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: "#C1C1C1")
        label.font = UIFont(name: "GothamPro", size: 12)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }

    private func setupViews() {
        floatingLabel.alpha = 0.0
        addSubview(floatingLabel)
        addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        updateFloatingLabel()
        yAxis = self.frame.origin.y + 20
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        updateFloatingLabel()
    }

    @objc private func textFieldEditingChanged() {
        let shouldShowFloatingLabel = !text!.isEmpty
        
        UIView.animate(withDuration: 0.3) {
            self.floatingLabel.alpha = shouldShowFloatingLabel ? 1.0 : 0.0
            if shouldShowFloatingLabel {
                self.frame.origin.y = self.yAxis + 10
            } else {
                self.frame.origin.y = self.yAxis
            }
        }
    }
    private func updateFloatingLabel() {
        let floatingLabelFrame = CGRect(x: 0, y: -20, width: bounds.size.width, height: bounds.size.height)
        floatingLabel.frame = floatingLabelFrame
    }
    
    func setPlaceholder(_ placeholder: String) {
        self.placeholder = placeholder
        floatingLabel.text = placeholder
        floatingLabel.sizeToFit()
    }
}
