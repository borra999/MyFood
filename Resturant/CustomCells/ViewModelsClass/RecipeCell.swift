
//  Created by Borra999 on 29/04/2020.
//  Copyright © 2020 Borra999. All rights reserved.
//


import UIKit

class RecipeCell: UICollectionViewCell {
    
    @IBOutlet weak var recipeImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        recipeImg.layer.cornerRadius = 10
    }
    
    func configureCell(recipe: Recipe){
        recipeImg.image = UIImage(named: recipe.imageName)
    }
}
