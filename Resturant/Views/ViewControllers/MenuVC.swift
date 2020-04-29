

//
//  Created by Borra999 on 29/04/2020.
//  Copyright © 2020 Borra999. All rights reserved.
//

import UIKit

class MenuVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let data = DataSet()
    var categortToPass: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "MY MENU"
        navigationController?.navigationBar.barTintColor = UIColor.red
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationItem.setHidesBackButton(true, animated: true);
        itemsTable()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let recipesVC = segue.destination as? RecipesSelectionVC {
            recipesVC.selectCategory = categortToPass
        }
    }
}


extension MenuVC 
{
    
    func itemsTable()  {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as? CategoryCell {
            cell.configureCell(category: data.categories[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        categortToPass = data.categories[indexPath.row].title
        performSegue(withIdentifier: "toRecipeSelection", sender: self)
    }
}

