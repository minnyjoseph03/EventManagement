//
//  HomeViewController.swift
//  Project_CoreData
//
//  Created by RP-34 on 30/04/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var ticketListBtn: UIButton!
    @IBOutlet weak var TicketRegBtn: UIButton!
    @IBOutlet weak var profileBtn: UIButton!
    @IBOutlet weak var EventListBtn: UIButton!
    
    @IBOutlet weak var eventReg_Btn: UIButton!
    var arryImage = ["images-4","images-5","images-6","images-7"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func eventReg_BtnActn(_ sender: UIButton) {
        
        let story = UIStoryboard(name: "Main", bundle: nil)
        let controller = story.instantiateViewController(withIdentifier: "EventLoginViewController") as! EventLoginViewController
        present(controller, animated: true, completion: nil)
        
    }
    
    
    @IBAction func eventListBtnActn(_ sender: UIButton) {
        let storyEvent = UIStoryboard(name: "Main", bundle: nil)
        let controllerEvent = storyEvent.instantiateViewController(withIdentifier: "EventListViewController") as! EventListViewController
        present(controllerEvent, animated: true, completion: nil)
    }
    
    @IBAction func profileBtnActn(_ sender: UIButton) {
        let storyProfile = UIStoryboard(name: "Main", bundle: nil)
        let controllerProfile = storyProfile.instantiateViewController(withIdentifier: "ProfileEditViewController") as! ProfileEditViewController
        present(controllerProfile, animated: true, completion: nil)
    }
    
    @IBAction func ticketRegBtnActn(_ sender: UIButton) {
        let storyTicketReg = UIStoryboard(name: "Main", bundle: nil)
        let controllerTicReg = storyTicketReg.instantiateViewController(withIdentifier: "TickeyRegViewController") as! TickeyRegViewController
        present(controllerTicReg, animated: true, completion: nil)
    }
    
    @IBAction func ticketListBtnactn(_ sender: UIButton) {
        let storyTicketList = UIStoryboard(name: "Main", bundle: nil)
        let controllerTicList = storyTicketList.instantiateViewController(withIdentifier: "TicketListViewController") as! TicketListViewController
        present(controllerTicList, animated: true, completion: nil)
    }
    
}
extension HomeViewController : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arryImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! homeCell
        cell.eventImage.image =  UIImage(named: arryImage[indexPath.row])
        return cell
    }
    
    
}
