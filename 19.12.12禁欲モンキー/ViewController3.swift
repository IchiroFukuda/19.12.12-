//
//  ViewController3.swift
//  19.12.12禁欲モンキー
//
//  Created by 福田一朗 on 2019/12/12.
//  Copyright © 2019 福田一朗. All rights reserved.
//
/*
import UIKit


class ViewController3: UIViewController {
    
    
    
    @IBOutlet weak var timerDay: UILabel!
    @IBOutlet weak var timerHour: UILabel!
    @IBOutlet weak var timerMinute: UILabel!
    @IBOutlet weak var timerSecond: UILabel!
    
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var untilNextLevel: UILabel!
    var restOfDay = 0
    var restOfHour = 0
    
    
    var museiCount = 0
    static var kaku = 0
    
    var startTime = Date()
    var subStartTime = Date()
    var date = "2016/10/3 12:12:12"
    var subDate = "2016年10月3日"
    //節約した時間を受け渡すための変数を宣言
    static var temporaryDay = 0
     weak var timer : Timer!
    
    @IBAction func stopButton(_ sender: Any) {
        
       
        
        //リセット忠告を表示する
        let alertController = UIAlertController(title: "リセット",message: "本当にリセットしますか？", preferredStyle: UIAlertController.Style.alert)
        
       
        //okを押したらfrontViewControllerに戻る。
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (action:UIAlertAction)  in
            
            if self.timer != nil{
                self.timer.invalidate()
            }
            
            let userDefaults = UserDefaults.standard
            userDefaults.removeObject(forKey: "start")
            userDefaults.synchronize
            
            if let FrontViewController = self.storyboard?.instantiateViewController(withIdentifier:"front")as?FrontViewController {
                self.present(FrontViewController,animated:true, completion:nil)
            }
            return
        }
        
        alertController.addAction(okAction)
        
        let cancelButton = UIAlertAction(title: "CANCEL", style: UIAlertAction.Style.cancel,handler: nil)
        alertController.addAction(cancelButton)
        
        present(alertController, animated: true, completion : nil)
        
        
        
        
        
    }
    
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefaults = UserDefaults.standard
        
        
        
        if let startValue : String = userDefaults.string(forKey: "start"){
            date = startValue
            let dateFormater = DateFormatter()
            dateFormater.locale = Locale(identifier: "ja_JP")
            dateFormater.dateFormat = "yyyy/MM/dd HH:mm:ss"
            let dateString = dateFormater.date(from: date)
            startTime = dateString!
            timer = Timer.scheduledTimer(
                
                timeInterval : 1,
                target: self,
                selector: #selector(self.timerCounter),
                userInfo:nil,
                repeats:true
            )
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "ja_JP")
            formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
            if let subDate = formatter.date(from: date) {
                formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "ydMMM", options: 0, locale: Locale(identifier: "ja_JP"))
                let dateStr = formatter.string(from: subDate).description
                startTimeLabel.text = "開始日：" + "\(dateStr)"
            }
            
            }
        
    }
    
    // Do any additional setup after loading the view.
    
    
    @objc func timerCounter(){
        
        let currentTime = Date().timeIntervalSince(startTime)
        
        let day = (Int)(fmod((currentTime/86400),365))
        
        let hour = (Int)(fmod((currentTime/3600),24))
        let minute = (Int)(fmod((currentTime/60),60))
        let second = (Int)(fmod(currentTime,60))
        
        let sHour = String(format:"%02d",hour)
        
        let sMinute = String(format:"%02d",minute)
        let sSecond = String(format:"%02d",second)
        
        timerDay.text = "\(1 + day)日目"
        timerHour.text = sHour
        timerMinute.text = sMinute
        timerSecond.text = sSecond
        //0ゴミ猿1ゲス猿2アホ猿5ザコ猿7若猿14勇猿20暴猿30強猿60猛猿100ボス
        if day < 1 {
            TimerViewController.kaku = 1
            restOfDay = 1 - (day + 1)
            restOfHour = 24 - (hour + 1)
        }else if day < 2  {
            TimerViewController.kaku = 2
            restOfDay = 2 - (day + 1)
            restOfHour = 24 - (hour + 1)
        }else if day < 5 {
            TimerViewController.kaku = 3
            restOfDay = 5 - (day + 1)
            restOfHour = 24 - (hour + 1)
        }else if day < 7 {
            TimerViewController.kaku = 4
            restOfDay = 7 - (day + 1)
            restOfHour = 24 - (hour + 1)
        }else if day < 14 {
            TimerViewController.kaku = 5
            restOfDay = 15 - (day + 1)
            restOfHour = 24 - (hour + 1)
        }else if day < 21 {
            TimerViewController.kaku = 6
            restOfDay = 21 - (day + 1)
            restOfHour = 24 - (hour + 1)
        }else if day < 30 {
            TimerViewController.kaku = 7
            restOfDay = 30 - (day + 1)
            restOfHour = 24 - (hour + 1)
        }else if day < 60 {
            TimerViewController.kaku = 8
            restOfDay = 60 - (day + 1)
            restOfHour = 24 - (hour + 1)
        }else if day < 100 {
            TimerViewController.kaku = 9
            restOfDay = 100 - (day + 1)
            restOfHour = 24 - (hour + 1)
        }else if day < 120 {
            TimerViewController.kaku = 10
            restOfDay = 120 - (day + 1)
            restOfHour = 24 - (hour + 1)
        }else if day < 150 {
            TimerViewController.kaku = 11
            restOfDay = 150 - (day + 1)
            restOfHour = 24 - (hour + 1)
        }else  {
            TimerViewController.kaku = 12
            restOfDay = 0
            restOfHour = 0
        }
        
        //temporaryDayに日数を格納
        TimerViewController.temporaryDay = day
        untilNextLevel.text = "次のレベルまであと" + "\(restOfDay)日と" + "\(restOfHour)時間"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
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
@IBDesignable class RoundedButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0.0
    @IBInspectable var borderWidth: CGFloat = 0.0
    @IBInspectable var borderColor: UIColor = UIColor.clear
    
    override func draw(_ rect: CGRect) {
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        clipsToBounds = true
    }
}
*/
