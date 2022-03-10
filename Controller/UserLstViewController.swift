//
//  ViewController.swift
//  iOSUITableViewProgramatical
//
//  Created by Admin on 10/03/2022.
//

import UIKit

class UserLstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    let tableView = UITableView()
    
    var usersList: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        getUsers()
        }
    
    func setTableView(){
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0.0).isActive = true
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0.0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0.0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0.0).isActive = true
        tableView.register(UserCustomCellView.self, forCellReuseIdentifier: "Cell")
        getUsers()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func getUsers() {
        let session = URLSession.shared
        let urlString = "https://reqres.in/api/users"
        guard let url = URL(string: urlString) else {return}
        
        let dataTask = session.dataTask(with: url) { data, responce, error in
            do {
                let decodedResponce = try JSONDecoder().decode(UserResponceModel.self, from: data!)
                
                self.usersList = decodedResponce.data
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
        dataTask.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! UserCustomCellView
        let user = usersList[indexPath.row]
        cell.userImageView.getImage(avatar: usersList[indexPath.row].avatar!)
        cell.userImageView.getImage(avatar: user.avatar ?? "")
        cell.useremailLbl.text = "\(usersList[indexPath.row].email)"
        cell.firstNameLbl.text = "\(usersList[indexPath.row].first_name)"
        cell.lastNameLbl.text = "\(usersList[indexPath.row].last_name)"
        cell.backgroundColor = UIColor.lightGray
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 150
    }
    
}



