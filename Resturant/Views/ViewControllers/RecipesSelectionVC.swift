

//
//  Created by Borra999 on 29/04/2020.
//  Copyright © 2020 Borra999. All rights reserved.
//

import UIKit

class RecipesSelectionVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var selectCategory: String!
    var recipes: [Recipe]!
    let data = DataSet()
    var recipeToPass: Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let title = selectCategory {
            self.title = title
        }
        
        activeCollection()
        recipes = data.getRecipes(forCategoryTitle: selectCategory)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailsVC = segue.destination as? RecipeDetailVC {
            detailsVC.selectedRecipe = recipeToPass
        }
    }
    
    @IBAction func backBtnCLicked(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)

    }
}



extension RecipesSelectionVC {
    
    func activeCollection() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return recipes.count
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           
           if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recipeCell", for: indexPath) as? RecipeCell {
               let recipe = recipes[indexPath.item]
               cell.configureCell(recipe: recipe)
               return cell
           }
           return UICollectionViewCell()
       }
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           let width = view.bounds.width
           let cellDimension = (width / 2) - 15
           return CGSize(width: cellDimension, height: cellDimension)
       }
       func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           recipeToPass = recipes[indexPath.item]
           performSegue(withIdentifier: "toRecipeSelction", sender: self)
       }
}
