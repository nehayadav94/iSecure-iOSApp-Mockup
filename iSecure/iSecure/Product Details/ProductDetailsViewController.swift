//
//  ProductDetailsViewController.swift
//  iSecure
//
//  Created by Neha Yadav on 01/05/16.
//  Copyright © 2016 Neha Yadav. All rights reserved.
//

import UIKit
import Kingfisher
import Alamofire
import ObjectMapper

class ProductDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView : UITableView!
    var product : ProductModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(UINib(nibName: "ProductInfoCard", bundle: nil), forCellReuseIdentifier: "ProductInfoCard")
        tableView.registerNib(UINib(nibName: "ProductDescriptionCard", bundle: nil), forCellReuseIdentifier: "ProductDescriptionCard")
        
        tableView.separatorStyle = .None
        
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_arrow_back_white_18pt"), style: .Plain, target: self, action: "backButtonPressed:")
        self.title = "Product Details"
    }
    
    func backButtonPressed(sender: UIButton) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        switch indexPath.row {
            
        case 0 :
            let cell = tableView.dequeueReusableCellWithIdentifier("ProductInfoCard", forIndexPath: indexPath) as! ProductInfoCard
            cell.productTitle.text = product.title
            cell.productPrice.text = product.price
            cell.productCategory.text = product.category
            cell.productImage.kf_setImageWithURL(NSURL(string: product.image!)!)
            return cell
            
        case 1 :
            let cell = tableView.dequeueReusableCellWithIdentifier("ProductDescriptionCard", forIndexPath: indexPath) as! ProductDescriptionCard
            cell.descriptionLabel.text = product.productDescription
            return cell
        default :
            break
            
        }
        return UITableViewCell()
    }
    
    func calculateHeightForString(description: String) -> CGFloat {
        
        let annotationPadding = CGFloat(24)
        let font = UIFont(name: "Montserrat-Regular", size: 15)!
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.9
        paragraphStyle.lineSpacing = 4.0
        
        
        let rect = NSString(string: description).boundingRectWithSize(CGSize(width: self.tableView.frame.width - 24, height: CGFloat(MAXFLOAT)), options: .UsesLineFragmentOrigin, attributes: [NSFontAttributeName : font, NSParagraphStyleAttributeName: paragraphStyle], context: nil)
        
        let descriptionHeight = ceil(rect.height)
        let height = annotationPadding + descriptionHeight
        
        return height
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 260
        } else if indexPath.row == 1 {
            let description = product.productDescription!
            return calculateHeightForString(description)
        }
        return CGFloat()
    }
    
}
