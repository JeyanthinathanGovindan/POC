//
//  ArticleTableViewCell.swift
//  VajroCodeTask_Jeyanthinathan
//
//  Created by AMBINO4526 on 06/08/22.
//

import Foundation
import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var imageWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    
    func renderCell(article: Article?) {
        view.layer.cornerRadius = 10
        articleImage.layer.cornerRadius = 10
        titleLabel.text = article?.title ?? ""
        descriptionTextView.attributedText = article?.summaryHTML?.htmlToAttributedString
        imageWidthConstraint.constant = DeviceInfo.screenWidth
        imageHeightConstraint.constant = article?.image?.height ?? 0
        if let imageUrl = article?.image?.src {
            articleImage.downloaded(from: imageUrl)
        }
    }
}
