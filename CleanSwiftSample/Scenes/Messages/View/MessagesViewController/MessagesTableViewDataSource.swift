//
//  MessagesTableViewDataSource.swift
//  CleanSwiftSample
//
//  Created by Okhan Okbay on 24.10.2020.
//

import UIKit

final class MessagesTableViewDataSource: NSObject, UITableViewDataSource {
  var cellViewModels: [CellViewModel] = []
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    cellViewModels.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let identifier = String(describing: MessageTableViewCell.self)
    let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! MessageTableViewCell
    
    let cellViewModel = cellViewModels[indexPath.row]
    
    cell.configureCell(messageType: cellViewModel.isOwnMessage ? .sent : .received(photoURL: cellViewModel.photoURL!),
                       senderName: cellViewModel.senderName,
                       messageContent: cellViewModel.messageContent)
    return cell
  }
}
