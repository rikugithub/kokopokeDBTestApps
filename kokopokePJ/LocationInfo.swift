
import Firebase

    class LocationInfo {

        var ref : DatabaseReference?
        var Latitude: Int?
        var Longitude: Int?
        var LocationInfo: String?
        var Time: Int?

            init? (snapshot: DataSnapshot) {
                ref = snapshot.ref
                guard let dict = snapshot.value as? [String:Any] else { return nil }
                guard let Latitude = dict["Latitude"] as? Int else { return nil }
                guard let Longitude = dict["Longitude"] as? Int else { return nil }
                guard let LocationInfo = dict["LocationInfo"] as? String else { return nil }
                guard let Time = dict["Time"] as? Int else { return nil }

        
        
        }
}
