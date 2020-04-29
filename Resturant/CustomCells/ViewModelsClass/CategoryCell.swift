
//
//  Created by Borra999 on 29/04/2020.
//  Copyright © 2020 Borra999. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    @IBOutlet weak var categoryImg: UIImageView!
    
    @IBOutlet weak var categoryTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        categoryImg.layer.cornerRadius = 8
    }

    func configureCell(category : FoodCategory) {
        
        categoryImg.image = UIImage (named: category.imageName)
        categoryTitle.text = category.title
    }
}
