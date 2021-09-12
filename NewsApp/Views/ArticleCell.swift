//
//  ArticleCell.swift
//  NewsApp
//
//  Created by Misha on 07.09.2021.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    
    @IBOutlet weak var articleTitleLabel: UILabel!
    @IBOutlet weak var articleDescriptionLabel: UILabel!
    @IBOutlet weak var articleAuthorLabel: UILabel!
    @IBOutlet weak var articleSourceLable: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    
    
    var articleVM: ArticleViewModel? {
        didSet {
            if articleVM != nil {
                articleTitleLabel.text = articleVM?.title
                articleDescriptionLabel.text = articleVM?.description
                articleAuthorLabel.text = articleVM?.author
                articleSourceLable.text = articleVM?.source
                ImageLoader.shared.getImage(from: articleVM?.urlToImage ?? "") { (data) in
                    guard let data = data else { return }
                    DispatchQueue.main.async {
                        self.articleImageView.image = UIImage(data: data)
                    }
                }
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
