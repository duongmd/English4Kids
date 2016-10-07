//
//  MasterTableVC.swift
//  English4Kids
//
//  Created by iOS Student on 9/30/16.
//  Copyright © 2016 Duong. All rights reserved.
//

import UIKit

class MasterTableVC: UITableViewController {

    var dicList = ["Fruits" : "fruits.png", "Animals" : "animals.jpeg",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        navigationItem.backBarButtonItem = backButton
        
        
    }

   

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dicList.count
    }

    //Tạo ra cell, tái sử dụng cell & hiển thị dữ liệu ra tableView
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        var arrayKey = Array(dicList.keys)
   
        cell.textLabel?.text = arrayKey[indexPath.row]
        cell.imageView?.image = UIImage(named: dicList["\(arrayKey[indexPath.row])"]!)
        
        return cell
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ShowDetail") {
            let detailVC = segue.destination as! DetailVC
            
            //Lấy indexPath của cell đã chọn
            let selectedRowIndex: NSIndexPath = self.tableView.indexPathForSelectedRow! as NSIndexPath
            
            //Lấy ra cell đã chọn từ indexPath trên
            let selectedCell: UITableViewCell = self.tableView.cellForRow(at: selectedRowIndex as IndexPath)!
            
            //Gán textLabel của cell thành title bên Detail
            detailVC.stringTitle = selectedCell.textLabel?.text
        }
    }
    
    }
