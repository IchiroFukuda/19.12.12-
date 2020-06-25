//
//  ViewController4.swift
//  19.12.12禁欲モンキー
//
//  Created by 福田一朗 on 2019/12/12.
//  Copyright © 2019 福田一朗. All rights reserved.
//

import UIKit

class ViewController4: UIViewController {
 
    
    static var textPage = 0
    
    static var myLevel = 0
    
    @IBAction func upSwipe(_ sender: UISwipeGestureRecognizer) {
        
        ViewController4.textPage += 1
        if ViewController4.textPage > 9 {
            ViewController4.textPage = 9
        }
        
        //csvの文章を読み込む処理
        csvDataManager.sharedInstance.loadData()
        
    //csvの文章を取り出す処理。DataにはmuramuraDataクラスのインスタンスが入る。これはもう金型じゃなくて鯛焼きであり、鯛焼きの中にあんこが入った状態。
        guard let Data = csvDataManager.sharedInstance.nextData()
            else {
                return
        }
        
        //nextData()で、sentenceValueにはもう文が入っている。
        csvLabel.text = "\(Data.sentenceValue)"
        
        
    }
    
    
    //ss
    
    @IBAction func downSwipe(_ sender: UISwipeGestureRecognizer) {
        
        ViewController4.textPage -= 1
        if ViewController4.textPage < 0{
            ViewController4.textPage = 0
        }
       csvDataManager.sharedInstance.loadData()
        
        guard let Data = csvDataManager.sharedInstance.nextData()
            else {
                return
        }
        
        
        csvLabel.text = "\(Data.sentenceValue)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        let userDefaults = UserDefaults.standard
        let onakinSwitch = userDefaults.bool(forKey: "onakinSwitch")
        
        if onakinSwitch == false {
        ViewController4.myLevel = 0
        } else {
             ViewController4.myLevel = myLevel()
        }
        csvDataManager.sharedInstance.loadData()
        
        guard let Data = csvDataManager.sharedInstance.nextData()
            else {
                return
        }
        
        setupLayout()
        
        csvLabel.text = "\(Data.sentenceValue)"
        
        
        //写真を表示する関数
        //monkeyImage ()
        
        //節約した時間を表示する
        //savingDay.text = "節約した時間 : " + "\(TimerViewController.temporaryDay/3 * 2)" + "時間"
        //達成した日数を表示する
        //achivement.text = "達成した日数　: " + "\(TimerViewController.temporaryDay)日"
 */
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
      
        let userDefaults = UserDefaults.standard
        let onakinSwitch = userDefaults.bool(forKey: "onakinSwitch")
        
        if onakinSwitch == false {
            ViewController4.myLevel = 0
        } else {
             ViewController4.myLevel = myLevel()
        }
        csvDataManager.sharedInstance.loadData()
        
        guard let Data = csvDataManager.sharedInstance.nextData()
            else {
                return
        }
        
        setupLayout()
        
        csvLabel.text = "\(Data.sentenceValue)"
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    let imageView = UIImageView()
    func monkeyImage(){
        // ⦿ UIViewの上にUIImageViewを貼り付けます。
         let width = view.bounds.size.width
         let height = view.bounds.size.height
         let imageArray = ["枠付きゴミ猿","枠付きゲス猿","枠付きアホ猿","枠付きザコ猿","枠付き若猿","勇猿","暴猿","枠付き強猿","猛猿","枠付きボス猿","枠付き僧猿","神猿"]
        
         let monkeyName = imageArray[ViewController4.myLevel]
        
         let image = UIImage(named: monkeyName)
        
         
        
         imageView.frame = CGRect(x:(width-(height/2))/2+25,y:50,width: (height/2)-50,height:(height/2)-50)
         /*
         let reSize = CGSize(width: width, height: width)
        
         let resizedCellImage = image?.reSizeImage(reSize: reSize)
        */
         imageView.image = image
        
         self.view.addSubview(imageView)
    }

    
    
    func myLevel() ->Int{
       
        
        let userDefaults = UserDefaults.standard
        
        var startTime = Date()
        if let startValue : String = userDefaults.string(forKey: "start"){
               let date = startValue
               let dateFormater = DateFormatter()
               dateFormater.locale = Locale(identifier: "ja_JP")
               dateFormater.dateFormat = "yyyy/MM/dd HH:mm:ss"
               let dateString = dateFormater.date(from: date)
               startTime = dateString!
        }
         let currentTime = Date().timeIntervalSince(startTime)
        
        let day =  (Int)(fmod((currentTime/86400),365))
        
        var daySpan = 0
        
        if userDefaults.object(forKey: "daySpan") != nil {
            daySpan = userDefaults.integer(forKey: "daySpan")
        }
        var levelTime = 0
        var level = 0
        if userDefaults.object(forKey: "レベルタイム") != nil {
            levelTime = userDefaults.integer(forKey: "レベルタイム")
        
        level = (day + daySpan)*24 / levelTime
        }
        if level > 11{
        return 11
        } else{
            return level
        }
    }
    private lazy var csvLabel: UILabel = {
        let label = UILabel()
        //label.setLabel(title: R.string.localizable.mailAddress())
        return label
    }()
    private lazy var levelLabel: UILabel = {
        let label = UILabel()
        //label.setLabel(title: R.string.localizable.mailAddress())
        
        return label
    }()
    private lazy var monkeyNameLabel: UILabel = {
        let label = UILabel()
        //label.setLabel(title: R.string.localizable.mailAddress())
        return label
    }()
    private func setupLayout() {
        view.addSubview(csvLabel)
        view.addSubview(levelLabel)
        view.addSubview(monkeyNameLabel)
        
        monkeyImage ()
        
        let monkeyArray = ["下猿","雑猿","凡猿","童猿","若猿","勇猿","暴猿","強猿","猛猿","ボス猿","僧猿","神猿"]
        
         let width = view.bounds.size.width
        let height = view.bounds.size.height
       monkeyNameLabel.frame = CGRect(x:0, y:(height/2)+20, width:width+100, height:height/50)
        
      
       monkeyNameLabel.text = "\(monkeyArray[ViewController4.myLevel])"
       monkeyNameLabel.font = UIFont.systemFont(ofSize: height/20)
        
        monkeyNameLabel.numberOfLines = 0
        
       
       levelLabel.frame = CGRect(x:0, y:height/2 + (height/10), width:width, height:height/100)

         
      
       levelLabel.text = "サル山"+"\(ViewController4.myLevel)"+"合目"
        levelLabel.font = UIFont.systemFont(ofSize: height/40)
        
        levelLabel.numberOfLines = 0
        
       
        
        csvLabel.frame = CGRect(x:0, y:(height/2) + (height/8), width:width, height:height/4)
              
        csvLabel.font = UIFont.systemFont(ofSize: height/40)
                
        csvLabel.numberOfLines = 0
   
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        imageView.removeFromSuperview()
    }
    override func viewDidDisappear(_ animated: Bool) {
       super.viewWillDisappear(animated)
       
    }
    
}


