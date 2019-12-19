

//  ViewController.swift
//  kokopokePJ
//
//  Created by Saki Nakayama on 2019/12/02.
//  Copyright © 2019 Saki Nakayama. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        //refの下に「child()」で場所を示す。今回の場合は「1AccountInfo」
        ref.child("1AccountInfo").observe(.value, with: { (snapshot: DataSnapshot) in
        
        //let data = ["AccountID": "ID2","Age": "21","Gender": "woman","": ""]
        //self.ref.child("3AccountInfo").setValue(data) データの変更（元データは残らない) !!危険!!
        //self.ref.child("3AccountInfo/").removeValue()  //(データの削除)
        //self.ref.child("3AccountInfo").updateChildValues(data) //(データの追加（元データ保持）)
            
        // FirebaseのDBの参照を定義（root）
            
            for itemSnapShot in snapshot.children {
                //ここで取得したデータを自分で定義したデータ型に入れて、加工する
                _ = GroupData(snapshot: itemSnapShot as! DataSnapshot)
                
                let dict = snapshot.value as! [String:Any]
                print("-------------------------------------------")
                print(dict["AccountID"]!)
                print(dict["Age"]!)
                print(dict["Gender"]!)
                print(dict["ReportCount"]!)
                print(dict["LocationInfo"]!)
                //print(dict["Latitude"]!)
                //print(dict["LocationInfo/LocationInfo"]!)
                print(dict["LocationInfo/Longitude"] as Any)
                //print(dict["LocationInfo/Time"]!)
                print(dict["Name"]!)
                print(dict["Reviews"]!)
                print(dict["WantGoPlace"]!)
                print("-------------------------------------------")
            }
        }) { (error) in
            print(error.localizedDescription)
        }
    }
}

