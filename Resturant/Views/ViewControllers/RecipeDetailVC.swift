

//
//  Created by Borra999 on 29/04/2020.
//  Copyright © 2020 Borra999. All rights reserved.

import UIKit

class RecipeDetailVC: UIViewController {

    @IBOutlet weak var recipeImg: UIImageView!
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeInstructions: UILabel!
    
    var selectedRecipe: Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = selectedRecipe.title
        
        recipeImg.image = UIImage(named: selectedRecipe.imageName)
        recipeTitle.text = selectedRecipe.title
        recipeInstructions.text = selectedRecipe.instructions    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)

    }
    
}
