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
    
    let tweets: [Tweet] = {
        let brianUser = User(name: "Brian Voong", username: "@letsBuildThatApp", bioText: "Iphone, ipad, ios programming community. Join us on Youtube to see all of our programming turorials", profileImage: #imageLiteral(resourceName: "profile_image"))
        let tweet = Tweet(user: brianUser, message: "Welcome to episode 9 of the twitter turorial I am just typing some things to fill out this text block my typing is really slow right now lololol")
        
        let tweet2 = Tweet(user: brianUser, message: "This is another tweet since the first one felt a little lonely sorry about the typos it happens deal with it and the lack of puntuation")
        return[tweet, tweet2]
    }()
    
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    override func item(_ indexPath: IndexPath) -> Any? {
        
        if indexPath.section == 1 {
            return tweets[indexPath.row]
        }
        return users[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        
        if section == 1 {
            return tweets.count
        }
        return users.count
    }

    override func numberOfSections() -> Int {
        return 2
    }
    
    
}








