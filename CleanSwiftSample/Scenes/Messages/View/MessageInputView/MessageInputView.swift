//
//  MessageInputView.swift
//  CleanSwiftSample
//
//  Created by Okhan Okbay on 25.10.2020.
//

import UIKit

final class MessageInputView: UIView {
  @IBOutlet private weak var textField: UITextField!
  @IBOutlet private weak var buttonSend: UIButton!
  
  var buttonSendTapped: ((_ text: String?) -> Void)?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    let color = UIColor.darkGray.withAlphaComponent(0.5)
    addTopBorder(color: color, width: 0.3)
  }

  @IBAction func buttonSendTapped(_ sender: Any) {
    if (textField.text?.count ?? 0) > 0 {
      buttonSendTapped?(textField.text)
      textField.text = nil
    }
  }
  
  override func didMoveToWindow() {
    super.didMoveToWindow()
    if let window = self.window {
      self.bottomAnchor.constraint(lessThanOrEqualToSystemSpacingBelow: window.safeAreaLayoutGuide.bottomAnchor, multiplier: 1.0).isActive = true
    }
  }
}
