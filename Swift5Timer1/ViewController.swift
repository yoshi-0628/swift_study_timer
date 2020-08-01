//
//  ViewController.swift
//  Swift5Timer1
//
//  Created by USER on 2020/07/14.
//  Copyright © 2020 Yoshihisa Iijima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ImageView: UIImageView!
    
    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var startButton: UIButton!
    
    var timer = Timer();
    
    var count = Int();
    
    var imageArray = [UIImage]();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        stopButton.isEnabled = false;
        count = 0;
        
        for i in 0..<5 {
            
            let image = UIImage(named: "\(i)")
            imageArray.append(image!)
        }
        
        ImageView.image = UIImage(named: "0")
        
    }
    
    func startTimer(){
        
        // タイマーを回す 0.2秒毎にあるメソッドを呼ぶ
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
    }
    
    @objc func timerUpdate(){
        count = count + 1;
        if count > 4 {
            count = 0;
        }
        
        ImageView.image=imageArray[count]
    }

    @IBAction func stop(_ sender: Any) {
        startButton.isEnabled = true;
        stopButton.isEnabled = false;
        timer.invalidate()
        
        count = 0
    }
    @IBAction func start(_ sender: Any) {
        startTimer()
        startButton.isEnabled = false;
        stopButton.isEnabled = true;
        
    }
}

