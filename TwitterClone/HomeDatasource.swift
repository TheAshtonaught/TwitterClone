//
//  HomeDatasource.swift
//  TwitterClone
//
//  Created by Ashton Morgan on 3/26/17.
//  Copyright © 2017 Ashton Morgan. All rights reserved.
//

import Foundation
import LBTAComponents

class HomeDatasource: Datasource {
    
    let users: [User] = {
        let brianUser = User(name: "Brian Voong", username: "@letsBuildThatApp", bioText: "Iphone, ipad, ios programming community. Join us on Youtube to see all of our programming turorials", profileImage: #imageLiteral(resourceName: "profile_image"))
        
        let rayUser = User(name: "Ray Wenderlich", username: "@rwenderlich", bioText: "Ray Wenderlich is an Iphone developer and tweets on topics related to iphone, and gaming. Check out our conference", profileImage: #imageLiteral(resourceName: "ray_profile_image"))
        
        let kindleUser = User(name: "Kindle Course", username: "@kindleCourse", bioText: "Ray Wenderlich is an Iphone developer and tweets on topics related to iphone, and gaming. Check out our conference Ray Wenderlich is an Iphone developer and tweets on topics related to iphone, and gaming. Check out our conference", profileImage: #imageLiteral(resourceName: "profile_image"))
        
        return [brianUser, rayUser, kindleUser]
    }()
    
    //let words = ["user1", "user2", "user3"]
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    override func item(_ indexPath: IndexPath) -> Any? {
        return users[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return users.count
    }
}
