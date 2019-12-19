
//  GroupData.swift
//  kokopokePJ
//
//  Created by 金濱利来 on 2019/12/12.
//  Copyright © 2019 Saki Nakayama. All rights reserved.
//

import Firebase

class GroupData {

    var ref: DatabaseReference?
    var AccountID: String?
    var Age: Int?
    var Gender: String?
    var Name: String?
    var ReportCount: Int?
    var Reviews: Array? = []
    var WantGoPlace: Array? = []
    var LocationInfo : Array? = []
    
    init? (snapshot: DataSnapshot) {
        ref = snapshot.ref
        guard let dict = snapshot.value as? [String:Any] else { return nil }
        guard let AccountID = dict["AccountID"] as? String else { return nil }
        guard let Age = dict["Age"] as? Int else { return nil }
        guard let Gender = dict["Gender"] as? String else { return nil }
        guard let Name = dict["Name"] as? String else { return nil }
        guard let ReportCount = dict["ReportCount"] as? Int else { return nil }
        guard let Reviews = dict["Reviews"] as? [String:AnyObject] else { return nil }
        var newReviews  : Array? = []
        guard let WantGoPlace = dict["WantGoPlace"] as? [String:AnyObject] else { return nil }
        var newWantGoPlace : Array? = []
        guard let LocationInfo = dict["LocationInfo"] as? [String:AnyObject] else { return nil }
        var newLocationInfo : Array? = []

        
        for _ in Reviews.keys {
            newReviews?.append("")
        }
        
        for _ in WantGoPlace.keys {
            newWantGoPlace?.append("")
        }
        
        for _ in LocationInfo.keys {
            newLocationInfo?.append("")
        }

        self.AccountID = AccountID
        self.Age = Age
        self.Gender = Gender
        self.Name = Name
        self.ReportCount = ReportCount
        self.Reviews = newReviews
        self.WantGoPlace = newWantGoPlace
        self.LocationInfo = newLocationInfo
    }
}


