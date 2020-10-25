//
//  MessageTableViewCell.swift
//  CleanSwiftSample
//
//  Created by Okhan Okbay on 24.10.2020.
//

import UIKit
import Kingfisher

final class MessageTableViewCell: UITableViewCell {
  @IBOutlet weak var imageViewProfilePhoto: UIImageView!
  @IBOutlet weak var labelSenderName: UILabel!
  @IBOutlet weak var labelMessageContent: EdgeInsetLabel!
  @IBOutlet weak var labelDateTime: UILabel!
  
  @IBOutlet weak var imageContainerView: UIView!
  
  
  var viewGroup: [UIView] {
    [contentView, imageViewProfilePhoto, labelSenderName, labelMessageContent, labelDateTime]
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()

    contentView.backgroundColor = .clear
    backgroundColor = .clear
    
    imageViewProfilePhoto.layer.cornerRadius = imageViewProfilePhoto.bounds.width / 2
    labelMessageContent.layer.cornerRadius = 8
    
    let inset: CGFloat = 4
    labelMessageContent.edgeInsets = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
  }
  
  func configureCell(with viewModel: CellViewModel) {
    
    if viewModel.isOwnMessage {
      viewGroup.forEach { $0.transform = CGAffineTransform(scaleX: -1,y: 1) }
      labelMessageContent.backgroundColor = .systemGreen
    } else {
      labelMessageContent.backgroundColor = .systemTeal
    }
    
    imageViewProfilePhoto.kf.setImage(with: viewModel.photoURL)
    labelSenderName.text = viewModel.senderName
    labelMessageContent.text = viewModel.messageContent
    labelDateTime.text = viewModel.sentTime
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
    viewGroup.forEach { $0.transform = .identity }
  }
}
