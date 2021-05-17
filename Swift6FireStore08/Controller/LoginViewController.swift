//
//  LoginViewController.swift
//  Swift6FireStore08
//
//  Created by Manabu Kuramochi on 2021/05/17.
//

import UIKit
import FirebaseAuth


class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var textField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
        
        
    }
    
    
    func login() {
        
        Auth.auth().signInAnonymously { Result, Error in
            
            let user = Result?.user
            print(user)
            
            UserDefaults.standard.set(self.textField.text, forKey: "userName")
            
            //画面遷移
            let viewVC = self.storyboard?.instantiateViewController(identifier: "viewVC") as! ViewController
            
            self.navigationController?.pushViewController(viewVC, animated: true)
            
        }
        
    }
    
    
    @IBAction func done(_ sender: Any) {
        
        
        login()
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
