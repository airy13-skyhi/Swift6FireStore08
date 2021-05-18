//
//  ViewController.swift
//  Swift6FireStore08
//
//  Created by Manabu Kuramochi on 2021/05/17.
//

import UIKit
import Firebase
import FirebaseFirestore
import EMAlertController


class ViewController: UIViewController {
    
    //DBの場所を指定
    let db0 = Firestore.firestore().collection("Odai").document("TX5dxG7JV5XpGPug3x13")
    let db1 = Firestore.firestore().collection("Answers").document()
    
    
    
    var userName = String()
    
    
    @IBOutlet weak var odaiLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if UserDefaults.standard.object(forKey: "userName") != nil {
            
            userName = UserDefaults.standard.object(forKey: "userName") as! String
            
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
        
        //load(Odai)
        loadQuestionData()
    }
    
    func loadQuestionData() {
        
        db0.getDocument { snapShot, error in
            
            if error != nil {
                return
            }
            
            let data = snapShot?.data()
            self.odaiLabel.text = data!["odaiText"] as! String
            
            
        }
        
    }
    

    @IBAction func send(_ sender: Any) {
        
        db1.setData(["answer":textView.text as Any, "userName":userName as Any, "postDate":Date().timeIntervalSince1970])
        
        
        let alert = EMAlertController(icon: UIImage(named: "check"), title: "投稿完了！", message: "みんなの回答を見てみよう！")
        let doneAction = EMAlertAction(title: "OK", style: .normal)
        alert.addAction(doneAction)
        present(alert, animated: true, completion: nil)
        
        textView.text = ""
        
    }
    
    
    
    @IBAction func checkAnswer(_ sender: Any) {
        
        let checkVC = self.storyboard?.instantiateViewController(identifier: "checkVC") as! CheckViewController
        
        checkVC.odaiString = odaiLabel.text!
        
        self.navigationController?.pushViewController(checkVC, animated: true)
    }
    
    
    
    
}

