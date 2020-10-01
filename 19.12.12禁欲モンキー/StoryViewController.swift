//
//  ViewController.swift
//  20.7.6ゲーム性を持たせる
//
//  Created by 福田一朗 on 2020/07/06.
//  Copyright © 2020 福田一朗. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController {

    let ud = UserDefaults.standard
 
   var commentArray = ["時は250万年前、人類の繁栄を迎える前、アフリカ西部に一頭のゴリラがいた。","ジャングルを歩き続けもう１週間が経つ。彼は生き残る事ができるだろうか。","群れにはたどり着いたものの、力尽きて倒れてしまった。","ボスには認められる事ができた。しかし、群れの一員になるには、自分の実力を認めてもらう必要がある。","群れの長老である仙猿は、人を見る目も肥えている。果たして長老のお眼鏡に適う事ができるだろうか。","ジャングルは弱肉強食。常に領土争いで戦いに明け暮れる。若い雄の一員として、群れを守る事ができるだろうか。","群れが襲われ、退却を余儀なくされた。まずは怪我をした仲間を助けなければ。","群れを元の状態まで回復させなければならない。指導力を遺憾無く発揮し、群れの再建を果そう。","群れの再建は完遂された。後は自分たちを襲った敵への復讐を残すのみ！","復讐を果たし、次のステージへ進む時が来たようだ。",""]
    
    private lazy var commentLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    private lazy var timerDay: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var stepLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    weak var gameTimer : Timer!
    

    
    private var mainButton:UIButton = {
    let button = UIButton()
          button.addTarget(self, action: #selector(mainButton(_:)), for: UIControl.Event.touchUpInside)
          return button
    }()
    @objc func mainButton(_ sender:UIButton) {
        let userDefaults = UserDefaults.standard
        
        let gameSwitch = userDefaults.bool(forKey: "gameSwitch")
        
        
        if gameSwitch == false {
            startAction()
        }
        /*
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "toBoss") as! BossViewController
        self.present(secondViewController, animated: true, completion: nil)
 */
         let storyboard: UIStoryboard = self.storyboard!
         
         let nextView = storyboard.instantiateViewController(withIdentifier: "toBoss") as! BossViewController
        
        nextView.didBack = {
            self.loadView()
            self.viewDidLoad()
                }
        
         self.navigationController?.pushViewController(nextView, animated: true)
        
        
    }
    
    private var restartButton:UIButton = {
    let button = UIButton()
          button.addTarget(self, action: #selector(restartButton(_:)), for: UIControl.Event.touchUpInside)
          return button
    }()
    
    @objc func restartButton(_ sender:UIButton) {
        
        resetAction()
        
        startAction()
        /*
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "toBoss") as! BossViewController
        self.present(secondViewController, animated: true, completion: nil)
 */
        
        let storyboard: UIStoryboard = self.storyboard!
               
               let nextView = storyboard.instantiateViewController(withIdentifier: "toBoss") as! BossViewController
              
               self.navigationController?.pushViewController(nextView, animated: true)
    }
    
    func startAction(){
             let userDefaults = UserDefaults.standard
     
             
             let dateFormater = DateFormatter()
             dateFormater.locale = Locale(identifier: "ja_JP")
             dateFormater.dateFormat = "yyyy/MM/dd HH:mm:ss"
             let date = dateFormater.string(from: Date())
    
             userDefaults.set(date,forKey: "gameStart")
         
             timerStart()
        
            self.ud.set(true,forKey: "gameSwitch")
          
         }
    
    
    func resetAction(){
        if self.gameTimer != nil{
         self.gameTimer.invalidate()
        }
        
        
            ud.removeObject(forKey: "gameStart")
            ud.removeObject(forKey: "counter.b")
        ud.removeObject(forKey: "stage")
            ud.set(false,forKey: "gameSwitch")
            
            self.timerDayText = "0"
        
        self.loadView()
        self.viewDidLoad()
    }

    
/*
    private lazy var onakinTime: UILabel = {
        let label = UILabel()
        
        
        //label.setLabel(title: R.string.localizable.mailAddress())
        
        return label
    }()
*/
    static var level = 0
    static var textNo = 0
    
    /*
    let imageView = UIImageView()
    func monkeyImage(){
        // ⦿ UIViewの上にUIImageViewを貼り付けます。
         let width = view.bounds.size.width
         let height = view.bounds.size.height
         //let imageArray = ["枠付きゴミ猿","枠付きゲス猿","枠付きアホ猿","枠付きザコ猿","枠付き若猿","勇猿","暴猿","枠付き強猿","猛猿","枠付きボス猿","枠付き僧猿","神猿"]
        
         //let monkeyName = imageArray[ViewController4.myLevel]
        
         let image = UIImage(named: "子供")
        
         
        
         imageView.frame = CGRect(x:(width-(height/2))/2+25,y:50,width: (height/2)-50,height:(height/2)-50)
         /*
         let reSize = CGSize(width: width, height: width)
        
         let resizedCellImage = image?.reSizeImage(reSize: reSize)
        */
         imageView.image = image
        
         self.view.addSubview(imageView)
    }
    */
    var point = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gameSwitch = ud.bool(forKey: "gameSwitch")
               
               if self.gameTimer != nil{
                       self.gameTimer.invalidate()
               
                   }
               if gameSwitch == true{
                      
                   timerStart()
                   }
                   
            
                setUpLayout()
                 
               self.view.addBackground(name: "背景1")
        
        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
       
        //monkeyImage()
        
    }
    var gameStartTime = Date()
    
    var date = "2016/10/3 12:12:12"
    
    func timerStart(){
     
        if let startValue : String = ud.string(forKey: "gameStart"){
        let dateFormater = DateFormatter()
        dateFormater.locale = Locale(identifier: "ja_JP")
        dateFormater.dateFormat = "yyyy/MM/dd HH:mm:ss"
       
        let dateString = dateFormater.date(from: startValue)
        gameStartTime = dateString!
        gameTimer = Timer.scheduledTimer(
            
            timeInterval : 1,
            target: self,
            selector: #selector(self.timerCounter),
            userInfo:nil,
            repeats:true
        )
        }
    }
    

     var timerDayText = "0"
    
     static var day = 0
     
     @objc func timerCounter(){
                 
        
        
                 let f = DateFormatter()
                 f.dateStyle = .short
                 f.timeStyle = .none
                 f.locale = Locale(identifier: "ja_JP")
                 let strStartTime = f.string(from: gameStartTime)
                 f.dateFormat = "yyyy/MM/dd"
                 var mutCurrentTime : TimeInterval = 0
                 if let mutStartTime = f.date(from: strStartTime) {
                   mutCurrentTime = Date().timeIntervalSince(mutStartTime)
                    // print("strStartTime:\(strStartTime)")
     //print("mutStartTime:\(mutStartTime)")
                     
                 }
                 let mutatedDay = (Int)(fmod((mutCurrentTime/86400),365))
                
                 StoryViewController.day = mutatedDay
                 /*
                 let currentTime = Date().timeIntervalSince(startTime)
                 
                 let day = (Int)(fmod((currentTime/86400),365))
                 let hour = (Int)(fmod((currentTime/3600),24))
                 let minute = (Int)(fmod((currentTime/60),60))
                 //let second = (Int)(fmod(currentTime,60))
                 
                 let sHour = String(format:"%02d",hour)
                 let sMinute = String(format:"%02d",minute)
                 //let sSecond = String(format:"%02d",second)
                 */
        
                 timerDayText = "\(1 + mutatedDay)"
                 
                 print("timerDayText:\(timerDayText)")
                 setUpLayout()
                 /*
                      
                 timerHour.text = sHour
                 timerMinute.text = sMinute
                 timerSecond.text = sSecond
                 */
             }
    
    
    func setUpLayout(){
        
        //view.addSubview(csvLabel)
        //view.addSubview(pointLabel)
        view.addSubview(mainButton)
        view.addSubview(restartButton)
        view.addSubview(commentLabel)
        view.addSubview(timerDay)
        view.addSubview(stepLabel)
        let width = view.bounds.size.width
        let height = view.bounds.size.height
        
        timerDay.frame = CGRect(x:width/2-width/4, y:height*0.6, width: width/2, height: height / 20)
        timerDay.font = UIFont.systemFont(ofSize: height/40)
        timerDay.numberOfLines = 0
        timerDay.textColor = UIColor.white
        timerDay.textAlignment = NSTextAlignment.center
        timerDay.text =  "-禁欲\(timerDayText)日目-"
        
        let stage = ud.integer(forKey: "stage")
        
        commentLabel.frame = CGRect(x:0, y:height/3, width:width, height:height/3)
        commentLabel.font = UIFont.systemFont(ofSize: width/20)
        commentLabel.numberOfLines = 0
        commentLabel.textColor = UIColor.white
        commentLabel.textAlignment = NSTextAlignment.left
        commentLabel.text =  commentArray[stage]

        
        
        
        
        
        stepLabel.frame = CGRect(x:0, y:height*0.2, width:width, height:height/7)
        
        stepLabel.numberOfLines = 0
        stepLabel.textAlignment = NSTextAlignment.center
        stepLabel.text =  "Step \(stage+1)"
        stepLabel.textColor = UIColor.white
        stepLabel.font = UIFont(name: "BradleyHandITCTT-Bold", size: height / 7.5)
        

        
       
        
        /*
        csvLabel.frame = CGRect(x:0, y:height*0.4, width:width, height:height/4)
              
        csvLabel.font = UIFont.systemFont(ofSize: height/40)
        csvLabel.textAlignment = .center
        csvLabel.numberOfLines = 0
 */
        /*
        pointLabel.frame = CGRect(x:width*9/14, y:height*8/9, width:width*2/7, height:height/20)
        pointLabel.font = UIFont.systemFont(ofSize: height/40)
        pointLabel.textAlignment = .center
        pointLabel.numberOfLines = 0
        pointLabel.text = "力：\(point)"
        */
        let gameSwitch = ud.bool(forKey: "gameSwitch")
        if gameSwitch == false{
        mainButton.setTitle("始める", for: .normal)
            restartButton.isHidden = true
            timerDay.text = ""
        }else{
             mainButton.setTitle("再開する", for: .normal)
            
            print("restaretButton")
            restartButton.isHidden = false
            restartButton.setTitle("リセットする", for:.normal)
            restartButton.setTitleColor(.white, for: .normal)
            restartButton.layer.borderWidth = 2
              restartButton.layer.borderColor = UIColor.white.cgColor
             restartButton.layer.cornerRadius = 10
             restartButton.titleLabel?.font = UIFont.systemFont(ofSize: view.bounds.size.height/40)
            restartButton.frame = CGRect(x: width/2-width/4, y: height*0.8, width: width/2, height: height / 20)
        }
        mainButton.setTitleColor(.white, for: .normal)
       mainButton.layer.borderWidth = 2
         mainButton.layer.borderColor = UIColor.white.cgColor
        mainButton.layer.cornerRadius = 10
        mainButton.titleLabel?.font = UIFont.systemFont(ofSize: view.bounds.size.height/40)
         mainButton.frame = CGRect(x: width/2-width/4, y: height*2/3, width: width/2, height: height / 20)
        
    }
    
    
        
}

