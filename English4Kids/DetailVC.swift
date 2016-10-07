//
//  DetailVC.swift
//  English4Kids
//
//  Created by iOS Student on 9/30/16.
//  Copyright © 2016 Duong. All rights reserved.
//

import UIKit

class DetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var stringTitle: String!
    var dictData: NSDictionary!
    var arrayKeys: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.tableView.delegate = self
        self.tableView.dataSource = self
        self.title = stringTitle
        
        self.createDataWithName(title: stringTitle)
        
        //Tạo tableView Cell
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        // Do any additional setup after loading the view.
    }

    func createDataWithName(title: String) {
        var path: String = ""
        if (title == "Fruits") {
            path = Bundle.main.path(forResource: "FruitsList", ofType: "plist")!
        }
        if (title == "Animals") {
            path = Bundle.main.path(forResource: "AnimalsList", ofType: "plist")!
        }
        dictData = NSDictionary(contentsOfFile: path)!
        arrayKeys = dictData.allKeys as NSArray!
        
        //Sap xep Text label theo ABC
        arrayKeys = arrayKeys.sortedArray(using: "compare:") as NSArray
      
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayKeys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let key: String = arrayKeys[indexPath.row] as! String
     
        cell.textLabel?.text = key
        cell.imageView?.image = UIImage(named: "\(dictData[key]!)")
        return cell
    }
    
    //Set chieu cao cho cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    //Lấy dữ liệu của cell khi người dùng click vao, thực thi theo UITableViewDelegate protocol
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row) - \(arrayKeys[indexPath.row])")
        
        let view = storyboard?.instantiateViewController(withIdentifier: "viewPic") as? ViewPicController
        navigationController?.pushViewController(view!, animated: true)
        
        view?.pic = UIImage(named: "\(dictData[arrayKeys[indexPath.row]]!)")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
