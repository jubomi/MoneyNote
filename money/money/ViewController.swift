//
//  ViewController.swift
//  money
//
//  Created by 주보미 on 2022/05/08.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    let animationView: AnimationView = .init(name: "102212-pig-coin")
    override func viewDidLoad() {
        super.viewDidLoad()
        setLottie()
        playAnimationView()
    }
    
    func setLottie() {
        self.view.addSubview(animationView)
        animationView.frame = self.view.bounds
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFit
    }
    func playAnimationView(){
        self.animationView.play()
        self.animationView.loopMode = .loop
        let time = DispatchTime.now() + .seconds(2)
        DispatchQueue.main.asyncAfter(deadline: time) {
            sleep(1)
            self.moveToVC()
        }
    }
    func moveToVC(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let HomeVC = storyboard.instantiateViewController(identifier: "HomeSB")
        HomeVC.modalPresentationStyle = .fullScreen
        self.present(HomeVC, animated: true)
    }
}

