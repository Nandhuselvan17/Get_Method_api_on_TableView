//
//  ViewController.swift
//  GetMethod
//
//  Created by IOS on 30/12/22.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    var jsonResult = [String:Any]()
    var test = [[String:Any]]()

    @IBOutlet weak var ApiTab: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

       
    

        self.getApi()
    }
    func getApi(){
        let url = URL(string: "https://reqres.in/api/users?delay=3")
        var urlReq = URLRequest(url: url!)
        urlReq.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: urlReq) { data , resp, err in
            if let error = err {
                print(error.localizedDescription)
            }
            if let response = resp {
                print(response)
            }
            do{
                self.jsonResult = try JSONSerialization.jsonObject(with: data!) as! [ String: Any]
                self.test = self.jsonResult["data"] as! [[String : Any]]
                print(self.jsonResult)
            }catch let err as NSError {
                print(err.localizedDescription)
            }
            DispatchQueue.main.async {
                self.ApiTab.reloadData()
            }
            
        }
        task.resume()
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.test.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ApiTableViewCell", for: indexPath) as! ApiTableViewCell
        cell.idLB.text = "\(self.test[indexPath.row]["id"] ?? "")"
        let myImg = URL(string: "\(self.test[indexPath.row]["avatar"]!)")
        let mydata = NSData(contentsOf: myImg!)
        cell.apiImg.image = UIImage.init(data: mydata! as Data)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }

    
}
