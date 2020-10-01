//
//  ClearViewController.swift
//  20.7.6ゲーム性を持たせる
//
//  Created by 福田一朗 on 2020/08/30.
//  Copyright © 2020 福田一朗. All rights reserved.
//

import UIKit

class ClearViewController: UIViewController {
    private lazy var ClearLabel: UILabel = {
              let label = UILabel()
              
              return label
          }()
          
        
          private lazy var commentLabel: UILabel = {
              let label = UILabel()
              
              return label
          }()
    
        private var twitterButton:UIButton = {
        let button = UIButton()
              button.addTarget(self, action: #selector(twitterButton(_:)), for: UIControl.Event.touchUpInside)
              return button
        }()
        @objc func twitterButton(_ sender:UIButton) {
         let url = URL(string: "https://twitter.com/ichiro_program")
         UIApplication.shared.open(url!)
         
        }
    
    private var instaButton:UIButton = {
    let button = UIButton()
          button.addTarget(self, action: #selector(instaButton(_:)), for: UIControl.Event.touchUpInside)
          return button
    }()
    @objc func instaButton(_ sender:UIButton) {
     let url = URL(string: "https://www.instagram.com/ichlroapp/")
     UIApplication.shared.open(url!)
     
    }
          
          private var backButton:UIButton = {
          let button = UIButton()
                button.addTarget(self, action: #selector(backButton(_:)), for: UIControl.Event.touchUpInside)
                return button
          }()
          @objc func backButton(_ sender:UIButton) {
           let ud = UserDefaults.standard
           ud.set(0, forKey: "counter.b")
            /*
           let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "main") as! StoryViewController
                     self.present(secondViewController, animated: true, completion: nil)
 */
             self.dismiss(animated: true, completion: nil)
          }
          
       override func viewDidLoad() {
           super.viewDidLoad()
           setUpLayout()
           self.view.addBackground(name: "背景1")
           // Do any additional setup after loading the view.
       }
       func setUpLayout(){
       let ud = UserDefaults.standard
       view.addSubview(ClearLabel)
       view.addSubview(commentLabel)
       view.addSubview(backButton)
         view.addSubview(twitterButton)
         view.addSubview(instaButton)

       
       let width = view.bounds.size.width
       let height = view.bounds.size.height
       let stage = ud.integer(forKey: "stage")
       
       

       ClearLabel.frame = CGRect(x:0, y:height/25, width:width, height:height/3)
       
       ClearLabel.numberOfLines = 2
       ClearLabel.textAlignment = NSTextAlignment.center
       ClearLabel.text =  "Game Clear!"
       ClearLabel.textColor = UIColor.yellow
       ClearLabel.font = UIFont(name: "BradleyHandITCTT-Bold", size: height / 7.5)
       
        commentLabel.frame = CGRect(x:0, y:height/2.5, width:width, height:height/3)
              commentLabel.font = UIFont.systemFont(ofSize: width/20)
              commentLabel.numberOfLines = 0
              commentLabel.textColor = UIColor.white
              commentLabel.textAlignment = NSTextAlignment.center
              commentLabel.text =  "おめでとうございます!\nあなたは30日を達成し、ストーリーを完結させる事ができました。ここまで来れば、あなたは良い習慣を身につけ、より良い人生を送る事ができるでしょう。これから、最高の人生を謳歌してゆかれる事を心から願っております。\nGood luck!"

       
          twitterButton.setTitle("Twitter", for: .normal)
               
                   
                   twitterButton.setTitleColor(.white, for: .normal)
                  twitterButton.layer.borderWidth = 2
                    twitterButton.layer.borderColor = UIColor.white.cgColor
                   twitterButton.layer.cornerRadius = 10
                   twitterButton.titleLabel?.font = UIFont.systemFont(ofSize: view.bounds.size.height/40)
                    twitterButton.frame = CGRect(x: width/5, y: height*0.75, width: width/5, height: height / 20)
        
        
        instaButton.setTitle("Insta", for: .normal)
                      
                          
                          instaButton.setTitleColor(.white, for: .normal)
                         instaButton.layer.borderWidth = 2
                           instaButton.layer.borderColor = UIColor.white.cgColor
                          instaButton.layer.cornerRadius = 10
                          instaButton.titleLabel?.font = UIFont.systemFont(ofSize: view.bounds.size.height/40)
                           instaButton.frame = CGRect(x: width/2 + width/10, y: height*0.75, width: width/5, height: height / 20)

           
       backButton.setTitle("戻る", for: .normal)
       
           
           backButton.setTitleColor(.white, for: .normal)
          backButton.layer.borderWidth = 2
            backButton.layer.borderColor = UIColor.white.cgColor
           backButton.layer.cornerRadius = 10
           backButton.titleLabel?.font = UIFont.systemFont(ofSize: view.bounds.size.height/40)
            backButton.frame = CGRect(x: width/2-width/4, y: height*0.82, width: width/2, height: height / 20)

       
       
       }

       /*
       // MARK: - Navigation

       // In a storyboard-based application, you will often want to do a little preparation before navigation
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           // Get the new view controller using segue.destination.
           // Pass the selected object to the new view controller.
       }
       */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
