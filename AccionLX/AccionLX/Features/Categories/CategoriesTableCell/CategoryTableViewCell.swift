//
//  CategoryTableViewCell.swift
//  AccionLX
//
//  Created by Thilak kumar on 18/11/19.
//  Copyright © 2019 Manjunath. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var categoryOverlay: UIView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let categoryNib = UINib(nibName: "CategoryCollectionViewCell", bundle: nil)
        categoryCollectionView.register(categoryNib, forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //MARK:- CollectionView DataSource and Delegate Methods -
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constant.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as? CategoryCollectionViewCell
        if let image = Constant.images[indexPath.row] as? String  {
            cell?.categoryImage.image = UIImage(named: image)
            cell?.categoryName.text = Constant.categoryNames[indexPath.row]
        }
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout , sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width/4
        return CGSize(width: width, height: 94)
    }
}
