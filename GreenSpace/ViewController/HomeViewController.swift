//
//  HomeViewController.swift
//  GreenSpace
//
//  Created by 최진용 on 2022/11/09.
//

import UIKit
import PanModal

class HomeViewController: UIViewController{
    
    @IBOutlet weak var betgeModalButton: UIButton!
    
    @IBOutlet weak var myItemModalButton: UIButton!
    
    @IBOutlet weak var myItemImageView: UIImageView!
    
    @IBOutlet weak var myPoint: UIButton!
    @IBOutlet weak var betgeImageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //유저정보 가져와서 포인트 가져옴.
        LoginAPI.profile { succeed, failed in
            if let user = succeed{
                let userPoint = String(user.point) ?? "0"
                self.myPoint.setTitle(userPoint, for: .normal)
            }
        }
        
        
        
        myItemImageView.image = UIImage(named: GlobalImage.shared.myItemImageName)
        betgeImageView.image = UIImage(named: GlobalImage.shared.betgeImageName)
        navigationController?.isNavigationBarHidden = true
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        print("heeloo")
        
    }


    
    @IBAction func pressAlarmButton(_ sender: Any) {
        
        if let pushVC = self.storyboard?.instantiateViewController(withIdentifier: String(describing: AlarmViewController.self)){
            self.navigationController?.pushViewController(pushVC, animated: true)
        }
    }
    
    
    @IBAction func pressModalButton(_ sender: UIButton) {
        switch sender{
        case betgeModalButton:
            print("betge")
            let betgeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: BetgeCollectionViewController.self)) as! BetgeCollectionViewController
            presentPanModal(betgeVC)
        case myItemModalButton:
            print("item")
            let myItemVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: MyItemCollectionViewController.self)) as! MyItemCollectionViewController
            presentPanModal(myItemVC)
        default: break
        }
    }
    
}
