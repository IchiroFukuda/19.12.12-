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
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        //label.setLabel(title: R.string.localizable.mailAddress())
        return label
    }()
    
    private lazy var yuigonLabel: UILabel = {
        let label = UILabel()
        //label.setLabel(title: R.string.localizable.mailAddress())
        return label
    }()
    var yuigonArray = [String]()
    
    var userDefaults = UserDefaults.standard
    private lazy var resetButton:UIButton = {
    let button = UIButton()
          button.addTarget(self, action: #selector(resetButton(_:)), for: UIControl.Event.touchUpInside)
          return button
    }()
    
    @objc func resetButton(_ sender:UIButton) {
        self.num = 0
        let appearance = SCLAlertView.SCLAppearance(
            showCloseButton: false,
            shouldAutoDismiss : false
        )
        let alert = SCLAlertView(appearance: appearance)
        let txt = alert.addTextField("遺言を入力する")
        
        alert.addButton("リセットする"){
            
            let writingTime = Date()
            //Date型の日付をStringに変換
            let dateFormater = DateFormatter()
            dateFormater.locale = Locale(identifier: "ja_JP")
            dateFormater.dateFormat = "yyyy年MM月dd日HH時mm分ss秒"
            let date = dateFormater.string(from: writingTime)
            
        if UserDefaults.standard.array(forKey: "yuigon") != nil{
            //saveMemoArrayに取得
            var yuigonArray = self.userDefaults.array(forKey: "yuigon") as! [String]
            
                //テキストに何か書かれているか？
            if txt.text != ""{
            
            
            //let truncated = date.substring(to: endIndex)
            yuigonArray.append(txt.text!+"(\(String(date.prefix(11))))")
                self.userDefaults.set(yuigonArray, forKey: "yuigon")
            
            }else{
            

            }

        }else{
            //最初、何も書かれていない場合
            var newMemoArray = [String]()
         
            //nilを強制アンラップはエラーが出るから
            if txt.text != ""{
                //inputtextはoptional型だから強制アンラップ
                newMemoArray.append(txt.text!+"(\(String(date.prefix(11))))")
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
    
    private lazy var backButton:UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(tapBackButton(_:)), for: UIControl.Event.touchUpInside)
        return button
    }()
    @objc func tapBackButton(_ sender:UIButton) {
          self.dismiss(animated: true, completion:nil)
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
    var num = 0
    @objc func animation(){
       
        
        
        if let value : [String] = userDefaults.array(forKey: "yuigon") as? [String]{
            yuigonArray = value
        
        if num == yuigonArray.count - 1{
            num = 0
            
        } else {
            num += 1
        }
        
        yuigonLabel.text = yuigonArray[num]
        
        UIView.transition(with: yuigonLabel, duration: 1.0, options: [.transitionCrossDissolve], animations: nil, completion: nil)
        }
    }
    
    private func setupLayout() {
        view.addSubview(titleLabel)
        view.addSubview(yuigonLabel)
        view.addSubview(resetButton)
         view.addSubview(decisionButton)
        view.addSubview(backButton)
        
        let width = self.view.frame.size.width
        let height = self.view.frame.size.height
        print(width)
        titleLabel.text = "過去の遺言"
        titleLabel.frame = CGRect(x:0, y:height/10, width:width, height:height/10)
        titleLabel.font = UIFont.systemFont(ofSize: height/15)
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0
        
        yuigonLabel.text = "禁欲すらできずして、何ができるのでしょうか？"
        
        yuigonLabel.frame.size = CGSize(width:width*4/5, height:height/4)//, width:width, height:height/4)
        yuigonLabel.center = CGPoint(x: width/2, y: height/3)
        yuigonLabel.font = UIFont.systemFont(ofSize: height/30)
        yuigonLabel.textAlignment = .center
        yuigonLabel.numberOfLines = 0
        
        
        resetButton.setTitle("それでもリセットする", for: .normal)
                resetButton.setTitleColor(.black, for: .normal)
                resetButton.layer.borderWidth = 2
                resetButton.layer.borderColor = UIColor.gray.cgColor
                resetButton.layer.cornerRadius = 10
        resetButton.titleLabel?.font = UIFont.systemFont(ofSize: view.bounds.size.height/50)
                resetButton.setTitleColor(UIColor.gray, for: .normal)
                resetButton.frame = CGRect(x: width/2-width/3, y: view.bounds.size.height*5/6, width: width*2/3, height: self.view.frame.height / 20)
        
       
        //let image = UIImage(systemName: "envelope")
        //decisionButton.setBackgroundImage(image, for: .normal)
        //decisionButton.layer.borderWidth = 2
        //decisionButton.layer.borderColor = UIColor.systemRed.cgColor
        decisionButton.layer.cornerRadius = height/30
        decisionButton.setTitle("初心を見返す", for: .normal)
        decisionButton.backgroundColor = UIColor(red: 232/256, green: 85/256, blue: 98/256, alpha: 1)
        decisionButton.titleLabel?.font = UIFont.systemFont(ofSize: view.bounds.size.height/30)
        decisionButton.setTitleColor(UIColor.white, for: .normal)
        decisionButton.frame = CGRect(x: width/2-width/3, y: height*0.6, width: width*2/3, height: height / 15)
        
        backButton.layer.cornerRadius = height/30
        backButton.setTitle("戻る", for: .normal)
        backButton.backgroundColor = UIColor(red: 0/256, green: 104/256, blue: 178/256, alpha: 1)
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: view.bounds.size.height/30)
        backButton.setTitleColor(UIColor.white, for: .normal)
        backButton.frame = CGRect(x: width/2-width/3, y: height*0.7, width: width*2/3, height: height / 15)
        
        
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
