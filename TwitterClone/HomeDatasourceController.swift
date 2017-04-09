//
//  HomeDatasourceController.swift
//  TwitterClone
//
//  Created by Ashton Morgan on 3/26/17.
//  Copyright © 2017 Ashton Morgan. All rights reserved.
//

import Foundation
import LBTAComponents
import TRON
import SwiftyJSON


class HomeDatasourceController: DatasourceController {
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)

        setupNavigationBarItems()
        
        //let homeDatasource = HomeDatasource()
        //self.datasource = homeDatasource
        
        fetchHomeFeed()
    }
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    class Home: JSONDecodable {
        required init(json: JSON) throws {
            print("Now ready to parse json: \n", json)
        }
    }
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON ERROr")
        }
    }
    
    fileprivate func fetchHomeFeed() {
        
        let request: APIRequest<Home, JSONError> = tron.request("/twitter/home")
        
        request.perform(withSuccess: { (home) in
            print("Successfully fetched our json objects")
        }) { (err) in
            print("Failed to fetch json", err)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let user = self.datasource?.item(indexPath) as? User {
            
            let approxWidthOfBioTextView = view.frame.width - 12 - 50 - 12 - 2
            let size = CGSize(width: approxWidthOfBioTextView, height: 1000)
            let attributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]
            
            let estimatedFrame = NSString(string: user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            
            return CGSize(width: view.frame.width, height: estimatedFrame.height + 66)
        }
        
        
        return CGSize(width: view.frame.width, height: 200)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 64)
    }
}















