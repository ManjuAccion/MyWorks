//
//  ALCategoriesVC.swift
//  AccionLX
//
//  Created by Manjunath on 18/11/19.
//  Copyright © 2019 Manjunath. All rights reserved.
//

import UIKit

class ALCategoriesVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    @IBOutlet weak var categoryOverlay: UIView!
    @IBOutlet weak var categoriesTableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryOverlay.dropShadow()
    let categoryNib = UINib(nibName: "CategoryTableViewCell", bundle: nil)
        categoriesTableview.register(categoryNib, forCellReuseIdentifier: "CategoryTableViewCell")
        
    let categoryImageNib = UINib(nibName: "CategoryImageTableViewCell", bundle: nil)
        categoriesTableview.register(categoryImageNib, forCellReuseIdentifier: "CategoryImageTableViewCell")
        categoriesTableview.separatorStyle = .none
        categoriesTableview.showsVerticalScrollIndicator = false
        
        // Do any additional setup after loading the view.
    }
    
    //MARK:- Tableview DataSource and Delegate Methods - 
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 1
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as? CategoryTableViewCell
            //cell?.dropShadow()
            cell?.categoryOverlay.dropShadow()
            cell?.selectionStyle = .none
                      return cell!
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryImageTableViewCell", for: indexPath) as? CategoryImageTableViewCell
            cell?.categoryOverlay.dropShadow()
            cell?.selectionStyle = .none
                return cell!
        }
       
       }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
