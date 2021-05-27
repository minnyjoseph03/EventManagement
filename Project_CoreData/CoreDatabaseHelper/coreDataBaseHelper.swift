//
//  coreDataBaseHelper.swift
//  Project_CoreData
//
//  Created by RP-34 on 29/04/21.
//

import Foundation
import CoreData
import UIKit

class DatabaseHelper {
    var arrayData = [Profile]()
    static var instance = DatabaseHelper()
    let container = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //******* save profile Data *******
    func saveSignIn(myDict : [String : Any]) {
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Profile", into: container) as! Profile
        entity.name = myDict["name"] as? String
        entity.email = myDict["email"] as? String
        entity.contact = myDict["contact"] as? String
        entity.password = myDict["password"] as? String
        
        do {
            try container.save()
            print("SignIn Data Saved")
        }
        catch {
            print("Not Saved")
        }
    }
    
    
    //****** fetch Profile Data *********
    
   // func fetchProfile(name : String ,password : String) -> [profileData] {
    func fetchProfile() -> [Profile] {
        
        var profileDt = [Profile]()
        let fetch = NSFetchRequest<NSManagedObject>(entityName: "Profile")
//        fetch.fetchLimit = 1
//        fetch.predicate = NSPredicate(format: "name == %@", name)
//        fetch.predicate = NSPredicate(format: "password == %@", password)
       
        do {
            profileDt = try!container.fetch(fetch) as! [Profile]
            print(profileDt)
          //  let userDetail = try! container.fetch(fetch)
           // return userDetail.first
            
        }
        catch let fetchError {
            print("Failed to fetch \(fetchError)")
        }
        //return nil
        return profileDt
    }
    
    func saveAdmin(myAdminDict : [String:Any]) {
        let entityAdmin = NSEntityDescription.insertNewObject(forEntityName: "Admin", into: container) as! Admin
        entityAdmin.email = myAdminDict["email"] as? String
        entityAdmin.password = myAdminDict["password"] as? String
        entityAdmin.contacts = myAdminDict["contact"] as? String
        do {
            try! container.save()
            print("AdminData Saved")
        } catch  {
            print("Not Saved")
        }
    }
    
    func fetchAdmin(email : String , password : String) -> Admin? {
        let fetchAd = NSFetchRequest<Admin>(entityName: "Admin")
        fetchAd.fetchLimit = 1
        fetchAd.predicate = NSPredicate(format: "email==%@", email)
        fetchAd.predicate = NSPredicate(format: "password==%@", password)
        do {
            let AdminDetail = try! container.fetch(fetchAd)
            return AdminDetail.first
        } catch let FetchAdError {
            print("Failed to fetch \(FetchAdError)")
        }
    }
    
    func saveEvent(eventDict : [String:Any]){
        let entityEvent = NSEntityDescription.insertNewObject(forEntityName: "Events", into: container) as! Events
        entityEvent.eventName = eventDict["eventName"] as? String
        entityEvent.eventDescptn = eventDict["eventDescptn"] as? String
        entityEvent.eventAddress = eventDict["eventAddress"] as? String
        entityEvent.eventTicketAmnt = eventDict["eventTicketAmnt"] as? String
        entityEvent.eventTicketCount = eventDict["eventTicketCount"] as? String
        entityEvent.eventDate = eventDict["eventDate"] as? String
        entityEvent.eventImage = eventDict["eventImage"]  as? Data
        do {
            let fetchAdm = NSFetchRequest<NSManagedObject>(entityName: "Admin")
            let fetchRe = try! container.fetch(fetchAdm)
            if fetchRe.first != nil {
                let admin = fetchRe.first as! Admin
                admin.addToEventadd(entityEvent)
                entityEvent.adminrelation = admin
            }
            
        } catch  {
            print("Cannot Fetch!.")
        }
        
        do {
            try! container.save()
            print("Event Data Saved")
            
        } catch  {
            print("Not Saved")
        }
        
    }
    
    func fetchEvent() -> [Events] {
        var eventArray = [Events]()
        var eventFetch = NSFetchRequest<NSManagedObject>(entityName: "Events")
        do {
             eventArray = try! container.fetch(eventFetch) as! [Events]
        } catch  {
            print("There is no data available")
        }
        return eventArray
    }
    
    func updateProfile(updateDict : [String:Any]) {
        arrayData = fetchProfile()
        for i in 0..<self.arrayData.count {
            if (self.arrayData[i].name == updateDict["name"] as? String) {
                
                self.arrayData[i].contact = updateDict["name"] as? String
                self.arrayData[i].email = updateDict["email"] as? String
                self.arrayData[i].contact = updateDict["contact"] as? String
                do {
                    try! container.save()
                    print("Profile data Updated")
                } catch  {
                    print("Updated Profile dataNot Saved")
                }
            }
        }
    }
    
    func fetchSelectedEvent(eventName : String) -> [eventclass] {
     
        var eventArray = [eventclass]()
        let fetch = NSFetchRequest<NSManagedObject>(entityName: "Events")
        fetch.predicate = NSPredicate(format: "eventName == %@", eventName)
        do {
            let result = try container.fetch(fetch) as! [Events]
            for i in result {
                let data = eventclass()
                data.event_name = i.eventName
                data.event_amount = i.eventTicketAmnt
                data.event_totalTickt = i.eventTicketCount
                eventArray.append(data)
            }
            return eventArray
        } catch  {
            print("Error")
        }
    return []
    }
    
    
    func saveTicket(ticketDict : [String:Any],eventName : String, ticketCount : String, email: String) {
        let enity = NSEntityDescription.insertNewObject(forEntityName: "TicketCounter", into: container) as! TicketCounter
        
        enity.ticketUser = ticketDict["userName"] as? String
        enity.ticketEventName = ticketDict["eventName"] as? String
        enity.ticketAmount = ticketDict["ticTotalAmnt"] as? String
        enity.ticketEmail = ticketDict["email"] as? String
        enity.ticketNo = ticketDict["ticketCount"] as? String
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        let resultDate = formatter.string(from: date)
        enity.ticketDate = resultDate
        
        do {
            let Fetch = NSFetchRequest<NSManagedObject>(entityName: "Events")
            Fetch.predicate = NSPredicate(format: "eventName == %@", eventName)
            let res = try container.fetch(Fetch) as! [Events]
            if res.first != nil {
                let dataP = res.first!
                res[0].eventTicketCount = ticketCount
                dataP.addToEventtickets(enity)
                enity.eventrelation = dataP
                
            }
            
        } catch  {
            print("Error")
        }
        
        do {
            let Fetch1 = NSFetchRequest<NSManagedObject>(entityName: "Profile")
            Fetch1.predicate = NSPredicate(format: "email == %@", email)
            let res1 = try container.fetch(Fetch1) as! [Profile]
            if res1.first != nil {
                let profileData = res1.first
                profileData?.addToTicketrelation(enity)
                enity.userrelation = profileData
                
            }
            
        } catch  {
            print("Error")
        }
        
        do {
            try! container.save()
            print("Ticket Data Saved")
        } catch  {
            print("Ticket Data Not Saved")
        }
    }
    
//    func fetchTicketDetail(userName : String) -> [TicketCounter] {
//        print("Name: \(userName)")
//       var ticData = [TicketCounter]()
//        let Fetch = NSFetchRequest<NSManagedObject>(entityName: "Profile")
//            Fetch.predicate = NSPredicate(format: "name == %@",userName)
//        do {
//            let res = try container.fetch(Fetch) as! [Profile]
//            if res.first != nil {
//                for obj in res {
//                for item in obj.ticketrelation! {
//                    let ticket = item as! TicketCounter
//                     let ticketData = TicketCounter()
//                    ticketData.ticketUser = ticket.ticketUser
//                    ticketData.ticketEventName = ticket.ticketEventName
//                    ticketData.ticketNo = ticket.ticketNo
//                    ticketData.ticketAmount = ticket.ticketAmount
//                    ticData.append(ticketData)
//
//                }
////                    let ticketData = TicketCounter()
////
////                    ticketData.ticketUser = obj.ticketUser
////                    ticketData.ticketEventName = obj.ticketEventName
////                    ticketData.ticketNo = obj.ticketNo
////                    ticketData.ticketAmount = obj.ticketAmount
////                    ticData.append(ticketData)
//            }
//
//            }
//            else {
//                print("No Ticket Data")
//            }
//        } catch let error as NSError {
//            print(error)
//        }
//
//        return ticData
//
//    }
    
    
    func myticktfetch(name: String) -> [ticketmodel]{
        var friends = [ticketmodel]()
        let Fetch = NSFetchRequest<NSManagedObject>(entityName: "Profile")
            Fetch.predicate = NSPredicate(format: "name == %@", name)
        do {
            let res = try container.fetch(Fetch) as! [Profile]
            for obj in res {
                for item in obj.ticketrelation!
                {
                 let a = item as! TicketCounter
                       let ob = ticketmodel()
                       ob.user = a.ticketUser
                       ob.eventname = a.ticketEventName
                       ob.tickets = a.ticketNo
                       ob.amount = a.ticketAmount
                       friends.append(ob)
                }
            }
            return friends
        } catch let error as NSError {
            print(error)
        }
        return []
    }
}






