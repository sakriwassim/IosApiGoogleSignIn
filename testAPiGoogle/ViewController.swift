//
//  ViewController.swift
//  testAPiGoogle
//
//  Created by Apple Esprit on 25/4/2022.
//

import UIKit
import GoogleSignIn
import Alamofire


class ViewController: UIViewController {
    
    
    //teba3 il sigin in google
    let signInConfig = GIDConfiguration.init(clientID: "70948335756-ijdvkvfstqtm2i97r0rhd68bh37o8atg.apps.googleusercontent.com")
    @IBOutlet weak var theconnectedemail: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func Google_Btn(_ sender: Any) { GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
        guard error == nil else { return }
        guard let user = user else { return }

            let emailAddress = user.profile?.email
        self.theconnectedemail.text = emailAddress
        
        
        //nfasa5 min hné ken klet b3adhhha
        let urladd = "http://localhost:3000/addaccount"
       
        let parameters = [
        
            "email" : emailAddress!
        ]
        AF.request(urladd, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode : 200..<300)
            .responseJSON{ response in
                
                switch response.result
                {
                case .failure(let error):
                    print(error)
                case .success(let value):
                    print(value)
                }

        // If sign in succeeded, display the app's main content View.
    }
    }
    
}

}
