//
//  ViewController.swift
//  bl
//
//  Created by Rohit Singh on 26/05/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var todoSome: UIButton!
}

extension UIViewController{
    func showToast(message: String){
        
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        
        let toastLbl = UILabel()
        toastLbl.text = message
        toastLbl.textAlignment = .center
        toastLbl.font = UIFont.systemFont(ofSize: 18)
        toastLbl.textColor = UIColor.white
        toastLbl.backgroundColor = UIColor.blue.withAlphaComponent(0.6)
        toastLbl.numberOfLines = 0
        
        let textSize = toastLbl.intrinsicContentSize
        let labelWidth = min(textSize.width, window.frame.width - 40 )
        let labelHeight = max(labelWidth, textSize.width / window.frame.width) * 30
        let adjustHeight = max(labelWidth, textSize.width + 20)
        
        toastLbl.frame = CGRect(x: 20, y: (window.frame.height - 90) - adjustHeight, width: labelWidth + 20, height: textSize.height)
        toastLbl.center.x = window.center.x
        toastLbl.layer.cornerRadius = 10
        toastLbl.layer.masksToBounds = true
        window.addSubview(toastLbl)
        
        UIView.animate(withDuration: 3.0, animations: {
            toastLbl.alpha = 0
        }) { (_) in
            toastLbl.removeFromSuperview()
            
        }


    }
}



