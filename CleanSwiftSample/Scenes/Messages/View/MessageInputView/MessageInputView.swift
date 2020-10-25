//
//  MessageInputView.swift
//  CleanSwiftSample
//
//  Created by Okhan Okbay on 25.10.2020.
//

import UIKit

final class MessageInputView: UIView {
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var buttonSend: UIButton!
  
  var buttonSendTapped: ((_ text: String?) -> Void)?

  @IBAction func buttonSendTapped(_ sender: Any) {
    if (textField.text?.count ?? 0) > 0 {
      buttonSendTapped?(textField.text)
      textField.text = nil
    }
  }
}
