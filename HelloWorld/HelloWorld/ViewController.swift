//
//  ViewController.swift
//  HelloWorld
//
//  Created by 张剑 on 2021/8/4.
//

import UIKit

class ViewController: UIViewController {
  
  @IBAction func showMessage(sender: UIButton) {
    
    
    let emojiDict: [String: String] = [
      "👾": "异形怪兽",
      "👻": "幽灵",
      "🤓": "戴眼镜的笑脸",
      "🤖": "机器人脸"
    ]
    
    let selectedButton = sender
    
    if let wordToLookup = selectedButton.titleLabel?.text {
      
      let meaning = emojiDict[wordToLookup]
      
      let alertController = UIAlertController(title: "Meaning", message: meaning, preferredStyle: UIAlertController.Style.alert)
      
      alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
      
      present(alertController, animated: true, completion: nil)
      
    }
    
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  
}

