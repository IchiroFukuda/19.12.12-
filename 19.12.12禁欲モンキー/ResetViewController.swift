//
//  ResetViewController.swift
//  19.12.12禁欲モンキー
//
//  Created by 福田一朗 on 2020/06/22.
//  Copyright © 2020 福田一朗. All rights reserved.
//

import UIKit
import SCLAlertView
class ResetViewController: UIViewController {
    
    var resultHandler : (() -> Void)?
    
    private lazy var yuigonLabel: UILabel = {
        let label = UILabel()
        //label.setLabel(title: R.string.localizable.mailAddress())
        return label
    }()
    var yuigonArray = ["あなたは楽な道に進みますか？","このまま強い男への道を進みますか？"]
    
    var userDefaults = UserDefaults.standard
    private lazy var resetButton:UIButton = {
    let button = UIButton()
          button.addTarget(self, action: #selector(resetButton(_:)), for: UIControl.Event.touchUpInside)
          return button
    }()
    
    @objc func resetButton(_ sender:UIButton) {
        
        let appearance = SCLAlertView.SCLAppearance(
            showCloseButton: false,
            shouldAutoDismiss : false
        )
        let alert = SCLAlertView(appearance: appearance)
        let txt = alert.addTextField("遺言を入力する")
        
        alert.addButton("リセットする"){
        if UserDefaults.standard.array(forKey: "yuigon") != nil{
            //saveMemoArrayに取得
            var yuigonArray = self.userDefaults.array(forKey: "yuigon") as! [String]
            
                //テキストに何か書かれているか？
            if txt.text != ""{
            
            yuigonArray.append(txt.text!)
                self.userDefaults.set(yuigonArray, forKey: "yuigon")
            
            }else{
            

            }

        }else{
            //最初、何も書かれていない場合
            var newMemoArray = [String]()
         
            //nilを強制アンラップはエラーが出るから
            if txt.text != ""{
                //inputtextはoptional型だから強制アンラップ
                newMemoArray.append(txt.text!)
                self.userDefaults.set(newMemoArray, forKey:  "yuigon")

             
            }else{
            
            }
        }
            alert.hideView()
            self.dismiss(animated: true, completion:nil)
            if let handler = self.resultHandler{
                handler()
            }
            ViewController2.cancelSwitch = true
            
        }
        //alert.addButton("Show Name") {
           // print("Text value: \(txt.text)")
        //}
        alert.showEdit("遺言を入力する", subTitle: "")
        
    }
    
    private lazy var decisionButton:UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(tapDecisionButton(_:)), for: UIControl.Event.touchUpInside)
        return button
    }()
    @objc func tapDecisionButton(_ sender:UIButton) {
           showAlert()
       }
    func showAlert(){
        
        
        var decisionText = "決意が設定されていません。"
        
        if let value : String = userDefaults.string(forKey: "decision"){
             decisionText = value
        }
        SCLAlertView().showNotice(decisionText, subTitle: "初心忘るるべからず")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setTimer()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
     super.viewWillDisappear(animated)
     
    }

    
    func setTimer(){
        Timer.scheduledTimer(timeInterval: 4.0, target: self,selector: #selector(self.animation),userInfo: nil, repeats: true
        )
    }
    
    @objc func animation(){
       
        
        
        if let value : [String] = userDefaults.array(forKey: "yuigon") as? [String]{
            yuigonArray = value
        }
        
        yuigonLabel.text = yuigonArray.randomElement()
        
        UIView.transition(with: yuigonLabel, duration: 1.0, options: [.transitionFlipFromLeft], animations: nil, completion: nil)
    }
    
    private func setupLayout() {
        view.addSubview(yuigonLabel)
        view.addSubview(resetButton)
         view.addSubview(decisionButton)
        
        let width = view.bounds.size.width
        let height = view.bounds.size.height
        yuigonLabel.text = yuigonArray.randomElement()
        yuigonLabel.frame = CGRect(x:0, y:height/4, width:width, height:height/4)
        yuigonLabel.font = UIFont.systemFont(ofSize: height/40)
        yuigonLabel.textAlignment = .center
        yuigonLabel.numberOfLines = 0
        
        resetButton.setTitle("それでもリセットする", for: .normal)
                resetButton.setTitleColor(.black, for: .normal)
                resetButton.layer.borderWidth = 2
                resetButton.layer.borderColor = UIColor.gray.cgColor
                resetButton.layer.cornerRadius = 10
        resetButton.titleLabel?.font = UIFont.systemFont(ofSize: view.bounds.size.height/40)
                resetButton.setTitleColor(UIColor.gray, for: .normal)
                resetButton.frame = CGRect(x: 80, y: view.bounds.size.height*5/6, width: self.view.frame.width-160, height: self.view.frame.height / 20)
        
       
        //let image = UIImage(systemName: "envelope")
        //decisionButton.setBackgroundImage(image, for: .normal)
        decisionButton.layer.borderWidth = 2
        decisionButton.layer.borderColor = UIColor.systemRed.cgColor
        decisionButton.layer.cornerRadius = height/40
        decisionButton.setTitle("本当に辛い時に開く手紙", for: .normal)
        //decisionButton.backgroundColor = UIColor(red: 0.3, green: 0.7, blue: 0.6, alpha: 1)
        decisionButton.titleLabel?.font = UIFont.systemFont(ofSize: view.bounds.size.height/30)
        decisionButton.setTitleColor(UIColor.red, for: .normal)
        decisionButton.frame = CGRect(x: width/2-height/4, y: height/2, width: height / 2, height: height / 20)
        
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
