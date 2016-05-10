//
//  ProductListingViewController.swift
//  iSecure
//
//  Created by Neha Yadav on 30/04/16.
//  Copyright © 2016 Neha Yadav. All rights reserved.
//

import UIKit
import Kingfisher
import Alamofire
import ObjectMapper

class ProductListingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    var products = [ProductModel]()
    var allProducts = [ProductModel]()
    @IBOutlet weak var apiQuotaLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(UINib(nibName: "ProductCard", bundle: nil), forCellReuseIdentifier: "ProductCard")
        tableView.separatorStyle = .None
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 247.0/255.0, green: 133.0/255.0, blue: 147.0/255.0, alpha: 1.0)
        navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Montserrat-ExtraBold", size: 18)!, NSForegroundColorAttributeName : UIColor.whiteColor()]
        self.title = "iSecure"
        
        fetchData()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ProductCard", forIndexPath: indexPath) as! ProductCard
        
        let product = products[indexPath.row]
        cell.productTitle.text = product.title
        cell.productCategory.text = product.category
        cell.productPrice.text = product.price
        cell.productImage.kf_setImageWithURL(NSURL(string: product.image!)!)
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let viewController = storyboard?.instantiateViewControllerWithIdentifier("ProductDetailsViewController") as! ProductDetailsViewController
        let product = products[indexPath.row]
        viewController.product = product
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func fetchData() {
        Alamofire.request(BaseRouter.ProductRouteManager(ProductRouter.GetProductList)).responseString { response in
            switch response.result {
            case .Success(let value):
                let productList : ProductListModel = Mapper<ProductListModel>().map(value)!
                self.products = productList.products!
                self.allProducts = productList.products!
                self.tableView.reloadData()
                
                var apiQuota = (Float(productList.quote_available!)!/Float(productList.quote_max!)!)  * 100
                self.apiQuotaLabel.text = "\(apiQuota)%"
                break
            case .Failure(let error):
                print(error.localizedDescription)
                break
            }
        }
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        filterByText(searchText)
    }
    
    func filterByText(keyword: String) {
        
        products.removeAll()
        
        for product in allProducts {
            if let _ = product.title!.rangeOfString(keyword) {
                products.append(product)
            }
        }
        
        if keyword == "" {
            products = allProducts
        }
        
        tableView.reloadData()
    }
    
    
}
