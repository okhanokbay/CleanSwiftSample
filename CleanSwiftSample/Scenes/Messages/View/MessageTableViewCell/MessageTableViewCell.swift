//
//  MessageTableViewCell.swift
//  CleanSwiftSample
//
//  Created by Okhan Okbay on 24.10.2020.
//

import UIKit
import Kingfisher

final class MessageTableViewCell: UITableViewCell {
  enum MessageType {
    case sent, received(photoURL: URL)
  }
  
  @IBOutlet weak var imageViewProfilePhoto: UIImageView!
  @IBOutlet weak var labelSenderName: UILabel!
  @IBOutlet weak var labelMessageContent: UILabel!
  
  @IBOutlet weak var imageContainerView: UIView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    contentView.backgroundColor = .clear
    backgroundColor = .clear
  }
  
  func configureCell(messageType: MessageType,
                     senderName: String,
                     messageContent: String) {
    
    switch messageType {
    case .sent:
      imageContainerView.isHidden = true
      
    case .received(let photoURL):
      imageContainerView.isHidden = false
      imageViewProfilePhoto.kf.setImage(with: photoURL)
    }
    
    labelSenderName.text = senderName
    labelMessageContent.text = messageContent
  }
}
