//
//  UserCustomCellView.swift
//  iOSUITableViewProgramatical
//
//  Created by Admin on 10/03/2022.
//

import UIKit

class UserCustomCellView: UITableViewCell {

   lazy var userListDock: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    
  lazy var userImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 35
        img.clipsToBounds = true
        return img
    }()
    lazy var useremailLbl: UILabel = {
        let email = UILabel()
        email.font = UIFont.boldSystemFont(ofSize: 20)
        email.textColor = .black
        email.translatesAutoresizingMaskIntoConstraints = false
        return email
    }()
    lazy var firstNameLbl: UILabel = {
        let firstName = UILabel()
        firstName.font = UIFont.boldSystemFont(ofSize: 20)
        firstName.textColor = .black
        firstName.translatesAutoresizingMaskIntoConstraints = false
        return firstName
    }()
    lazy var lastNameLbl: UILabel = {
        let lastName = UILabel()
        lastName.font = UIFont.boldSystemFont(ofSize: 20)
        lastName.textColor = .black
        lastName.translatesAutoresizingMaskIntoConstraints = false
        return lastName
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "Cell")
        
        userListDock.addSubview(userImageView)
        userListDock.addSubview(useremailLbl)
        userListDock.addSubview(firstNameLbl)
        userListDock.addSubview(lastNameLbl)
        self.contentView.addSubview(userListDock)
        
        userListDock.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        userListDock.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10)
        userListDock.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        userListDock.heightAnchor.constraint(equalToConstant:40).isActive = true
        
        userImageView.topAnchor.constraint(equalTo:self.userListDock.topAnchor).isActive = true
        userImageView.leadingAnchor.constraint(equalTo:self.userListDock.leadingAnchor, constant: 10).isActive = true
        
        useremailLbl.topAnchor.constraint(equalTo:self.userListDock.topAnchor).isActive = true
        useremailLbl.leadingAnchor.constraint(equalTo:self.userImageView.trailingAnchor).isActive = true
        useremailLbl.trailingAnchor.constraint(equalTo:self.userListDock.trailingAnchor).isActive = true
        
        firstNameLbl.topAnchor.constraint(equalTo:self.useremailLbl.bottomAnchor).isActive = true
        firstNameLbl.leadingAnchor.constraint(equalTo:self.userImageView.trailingAnchor).isActive = true
        firstNameLbl.trailingAnchor.constraint(equalTo:self.userListDock.trailingAnchor).isActive = true
        
        lastNameLbl.topAnchor.constraint(equalTo:self.firstNameLbl.bottomAnchor).isActive = true
        lastNameLbl.leadingAnchor.constraint(equalTo:self.userImageView.trailingAnchor).isActive = true
        lastNameLbl.trailingAnchor.constraint(equalTo:self.userListDock.trailingAnchor).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
