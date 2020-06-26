//
//  AnimalFarm.swift
//  doIT
//
//  Created by julia nellie on 6/25/20.
//  Copyright © 2020 julia nellie. All rights reserved.
//

import UIKit

class AnimalFarm : UIViewController
{
    @IBOutlet weak var bg3: UIImageView!
    @IBOutlet weak var txt: UIImageView!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var bear: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        time.transform = CGAffineTransform(rotationAngle: CGFloat.pi / -7.21)
    }
    
    var minutes = 30
    var timer = Timer()
    
    @IBAction func start(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(AnimalFarm.counter), userInfo: nil, repeats: true)
    }
    
    @objc func counter()
    {
        minutes -= 1
        time.text = String(minutes)
        
        bearAppear()
        
        if (minutes == 0)
        {
            timer.invalidate()
        }
    }
     
     func bearAppear()
     {
         if (minutes <= 20 && minutes > 10)
         {
             bear.image = UIImage(named: "bear3.jpg")
         }
         else if (minutes <= 10 && minutes > 1)
         {
             bear.image = UIImage(named: "bear2.jpg")
         }
         else if (minutes == 0)
         {
             bear.image = UIImage(named: "bear1.jpg")
         }
         else
         {
             
         }
     }
}
