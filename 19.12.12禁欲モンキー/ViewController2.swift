//
//  ViewController2.swift
//  19.12.12禁欲モンキー
//
//  Created by 福田一朗 on 2019/12/12.
//  Copyright © 2019 福田一朗. All rights reserved.
//
import UIKit
import SCLAlertView
class ViewController2: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource,UITextFieldDelegate,UIGestureRecognizerDelegate {
   
    
    var startTime = Date()
    
    var date = "2016/10/3 12:12:12"
    //var subDate = "2016年10月3日"
    
     weak var timer : Timer!
    
    static var cancelSwitch = false
    
    
    
    private lazy var startStopButton:UIButton = {
    let button = UIButton()
          button.addTarget(self, action: #selector(startStopButton(_:)), for: UIControl.Event.touchUpInside)
          return button
    }()
    
    //@IBOutlet weak var timerHour: UILabel!
    //@IBOutlet weak var timerMinute: UILabel!
    //@IBOutlet weak var timerSecond: UILabel!
    
    var tapSwitch = true
    /*
    @IBAction func tapSwitch(_ sender: Any) {
        tapSwitch = false
        self.loadView()
        self.viewDidLoad()
        
    }
    */
    /*
    @IBAction func tapTest(_ sender: UITapGestureRecognizer) {
        tapSwitch = !tapSwitch
        
        self.loadView()
        self.viewDidLoad()

        
    }
    */
    private lazy var timerDay: UILabel = {
        let label = UILabel()
        
        
        //label.setLabel(title: R.string.localizable.mailAddress())
        
        return label
    }()
    
    
    func circleImage(){
        // ⦿ UIViewの上にUIImageViewを貼り付けます。
         let width = view.bounds.size.width
        
         let image = UIImage(named: "circle")
        
         let imageView = UIImageView()
        
         imageView.frame = CGRect(x:0,y: 100,width: width,height:width)
         /*
         let reSize = CGSize(width: width, height: width)
        
         let resizedCellImage = image?.reSizeImage(reSize: reSize)
        */
         imageView.image = image
        
         self.view.addSubview(imageView)
       
    }
    private lazy var startTimeLabel: UILabel = {
        let label = UILabel()
        
        
        //label.setLabel(title: R.string.localizable.mailAddress())
        
        return label
    }()
    
    private lazy var onakinTime: UILabel = {
           let label = UILabel()
           
           
           //label.setLabel(title: R.string.localizable.mailAddress())
           
           return label
       }()
    
    private lazy var goalDay: UILabel = {
           let label = UILabel()
           
           
           //label.setLabel(title: R.string.localizable.mailAddress())
           
           return label
       }()
    
    private lazy var untilNextLevel: UILabel = {
           let label = UILabel()
           
           
           //label.setLabel(title: R.string.localizable.mailAddress())
           
           return label
       }()
    /*
    @IBAction func startButton(_ sender: Any) {
    
    
    startTime = Date()
        let dateFormater = DateFormatter()
        dateFormater.locale = Locale(identifier: "ja_JP")
        dateFormater.dateFormat = "yyyy/MM/dd HH:mm:ss"
        let date = dateFormater.string(from: startTime)
        let userDefaults = UserDefaults.standard
        userDefaults.set(date,forKey: "start")
       
        
        if let
            TimerViewController = self.storyboard?.instantiateViewController(withIdentifier:"timer")as?TimerViewController {
            self.present(TimerViewController,animated:true, completion:nil)
        }
        return
    }
    */
    
    
    var alertNo = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
           
            
            circleImage()
        
            let onakinSwitch = userDefaults.bool(forKey: "onakinSwitch")
        
            if self.timer != nil{
                self.timer.invalidate()
        
            }
        
        
            if onakinSwitch == true{
               
            timerStart()
            }
            if alertNo == 1{
                userGoalAlert()
            } else if alertNo == 2 {
                firstAmbition()
        }
            setupLayout()
        
        
        
        // Do any additional setup after loading the view.
        }
    
    
    
    func timerStart(){
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
        }
    }
    
    @objc func startStopButton(_ sender:UIButton) {
        let userDefaults = UserDefaults.standard
        
        let onakinSwitch = userDefaults.bool(forKey: "onakinSwitch")
        
        if onakinSwitch == false {
            startAction()
            userStartAlert()
            
        }else{
            
            cancelAction()
        }
    }
    
    func startAction(){
             let userDefaults = UserDefaults.standard
     
             startTime = Date()
             let dateFormater = DateFormatter()
             dateFormater.locale = Locale(identifier: "ja_JP")
             dateFormater.dateFormat = "yyyy/MM/dd HH:mm:ss"
             let date = dateFormater.string(from: startTime)
    
             userDefaults.set(date,forKey: "start")
         
             timerStart()
          
         }
    
    
    var startDay = ""
    var formatter = DateFormatter()
    var datePicker:UIDatePicker = UIDatePicker()
    var date1 = Date()
    
    func userStartAlert(){
        
       
        
        let appearance = SCLAlertView.SCLAppearance(
             showCloseButton: false,
             shouldAutoDismiss : false
         )
        let alert = SCLAlertView(appearance: appearance)
        let txt = alert.addTextField("ここをタップして下さい")
         
        let datePicker:UIDatePicker = UIDatePicker()
        datePicker.datePickerMode = UIDatePicker.Mode.date
         datePicker.timeZone = NSTimeZone.local
         datePicker.locale = Locale.current
         datePicker.maximumDate = Date()
         //txt.inputView = datePicker
        
         // インプットビュー設定
         txt.inputView = datePicker
         alert.addButton("入力する"){
             // インプットビュー設定
             txt.endEditing(true)
            let formatter = DateFormatter()
             formatter.locale = Locale(identifier: "ja_JP")
             formatter.dateFormat = "yyyy年MM月dd日"
            self.date1 = datePicker.date
            self.startDay = "\(formatter.string(from: datePicker.date))"
            txt.text = self.startDay
            
         }
        
        alert.addButton("入力完了"){
         if txt.text == "" {
         } else {
             
            self.alertNo = 1
            
             let now = NSDate()
            
            let span = now.timeIntervalSince(self.date1)
             let daySpan = Int((span/60/60/24))
            
            
            
            let userDefaults = UserDefaults.standard
            userDefaults.set(daySpan,forKey: "daySpan")
            userDefaults.set(self.startDay,forKey: "開始日")
             //let yearOfDayspan = self.daySpan/365
             //let dayOFDayspan = Int(fmod(Double(self.daySpan),365))
             //self.localDayspan = "\(yearOfDayspan)年"+"\(dayOFDayspan)日"
             alert.hideView()
             self.loadView()
             self.viewDidLoad()
         }
         }
         alert.showEdit("開始日を入力する",subTitle:"開始日を入力して下さい")
    }
    
    var pickerView: UIPickerView = UIPickerView()
    let list = ["","30日(群れのボス)", "100日(ジャングルの王)", "300日(アフリカの王)"]
    let goalDayArray = [0,30,100,300]
    var stringChosedGoal = "30日"
    var intChosedGoal = 30
    var userDefaults = UserDefaults.standard
    private var goalTxt : UITextField = UITextField()
    
    
    func userGoalAlert(){
        
        let timeAppearance = SCLAlertView.SCLAppearance(
            showCloseButton: false,
            shouldAutoDismiss: false
        )
        let timeAlert = SCLAlertView(appearance: timeAppearance)
        let timeTxt = timeAlert.addTextField("ここをタップして下さい")
        //１個目のpickerViewの処理
        pickerView.delegate = self
        pickerView.dataSource = self
        
        timeTxt.inputView = pickerView
        timeAlert.addButton("難易度を設定する"){
            timeTxt.endEditing(true)
            timeTxt.text = self.stringChosedGoal
        }
        timeAlert.addButton("入力完了"){
            if timeTxt.text == "" {
            } else {
                self.alertNo = 2
                self.userDefaults.set(self.intChosedGoal,forKey: "難易度")
               
                let levelTime = self.intChosedGoal*24/10
                self.userDefaults.set(levelTime,forKey: "レベルタイム")
                
                self.userDefaults.set(true,forKey: "onakinSwitch")
                
                timeAlert.hideView()
                self.loadView()
                self.viewDidLoad()
            }
        }
        timeAlert.showEdit("難易度を設定する",subTitle:"難易度を選択して下さい")
        
    }
    
    
    func firstAmbition(){
        
       let appearance = SCLAlertView.SCLAppearance(
                showCloseButton: false,
                shouldAutoDismiss : false
            )
            let alert = SCLAlertView(appearance: appearance)
            let txt = alert.addTextField("初心を刻む")
            
            alert.addButton("入力する"){
            //テキストに何か書かれているか？
                if txt.text != ""{
                self.userDefaults.set(txt.text, forKey: "decision")
                
                }
                self.alertNo = 0
                alert.hideView()
                self.loadView()
                self.viewDidLoad()
                
            }
            //alert.addButton("Show Name") {
               
            //}
            alert.showEdit("初志を刻む", subTitle: "リセットボタンを押す瀬戸際に、この言葉を見返すことができます。")
            
        }
    
    
    
    func cancelAction (){
        
        performSegue(withIdentifier: "toReset", sender: nil)
        
       
    }
    
    override func prepare(for segue: UIStoryboardSegue,sender: Any?){
        if segue.identifier == "toReset" {
                // 遷移先のViewControllerを取得
                let next = segue.destination as? ResetViewController
                // 遷移先のプロパティに処理ごと渡す
                next?.resultHandler = {
                    // 引数を使ってoutputLabelの値を更新する処理
                    self.resetAction()
                    
                }
            }
        }
    
    
    func resetAction(){
        
        ViewController2.cancelSwitch = false
        
        if self.timer != nil{
                self.timer.invalidate()
               
               }
            
            let userDefaults = UserDefaults.standard
            
            var recordDic = ["日数":"","開始日":"","終了日":""]
            
            recordDic["日数"] = self.NumberOfDays
            
            recordDic["開始日"]  = self.startTimeLabelText
            
            
            let onakinTime = Date()
            let dateFormater = DateFormatter()
            dateFormater.locale = Locale(identifier: "ja_JP")
            dateFormater.dateFormat = "yyyy年MM月dd日"
            let date = dateFormater.string(from: onakinTime)
            
            recordDic["終了日"] = date
            
            var recordArray = [Any]()
            if userDefaults.array(forKey: "recordArray") != nil{
                //取得 またas!でアンラップしているのでnilじゃない時のみ
                recordArray = userDefaults.array(forKey: "recordArray")!
                
            }
            
            recordArray.append(recordDic)
            
            userDefaults.set(recordArray,forKey: "recordArray")
        
            userDefaults.removeObject(forKey: "start")
            
            userDefaults.removeObject(forKey: "daySpan")
            
            userDefaults.removeObject(forKey: "難易度")
            
            userDefaults.removeObject(forKey: "レベルタイム")
            
            userDefaults.removeObject(forKey: "開始日")
        
            userDefaults.removeObject(forKey: "decision")
            
            userDefaults.set(false,forKey: "onakinSwitch")
            
            let onakinSwitch = userDefaults.bool(forKey: "onakinSwitch")
            
            
            self.startTimeLabelText = "未スタート"
            self.timerDayText = "0"
            self.onakinTimeText = ""
            self.untilNextLevelText = ""
            
            
            self.loadView()
            self.viewDidLoad()
    }
    
    
        private func setupLayout() {
            
            let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(switchTapped(_:)))

            //デリゲートをセット
            tapGesture.delegate = self

            self.view.addGestureRecognizer(tapGesture)
            
            view.addSubview(startStopButton)
            
            
            
            
            if tapSwitch == true {
                view.addSubview(timerDay)
            } else {
                view.addSubview(startTimeLabel)
                view.addSubview(onakinTime)
                view.addSubview(goalDay)
                view.addSubview(untilNextLevel)
            }
            
            
            
            let width = view.bounds.size.width
            
            
            
            timerDay.frame = CGRect(x:0, y:100, width:width, height:width)
            timerDay.font = UIFont.systemFont(ofSize: width/2)
            timerDay.numberOfLines = 0
            timerDay.textAlignment = NSTextAlignment.center
            timerDay.text =  timerDayText
            
            startTimeLabel.frame = CGRect(x:0, y:100+width*1/6, width:width, height:width/8)
            startTimeLabel.font = UIFont.systemFont(ofSize: width/20)
            startTimeLabel.numberOfLines = 0
            startTimeLabel.textAlignment = NSTextAlignment.center
            startTimeLabel.text =  startTimeLabelText
            
            onakinTime.frame = CGRect(x:0, y:100+width*2/6, width:width, height:width/8)
            onakinTime.font = UIFont.systemFont(ofSize: width/20)
            onakinTime.text = onakinTimeText
            onakinTime.numberOfLines = 1
            onakinTime.textAlignment = NSTextAlignment.center
            
            let userDefaults = UserDefaults.standard
            var goalDate = userDefaults.integer(forKey: "難易度")
                 
            if userDefaults.object(forKey: "難易度") != nil {
                goalDate = userDefaults.integer(forKey: "難易度")
            }
            
            goalDay.frame = CGRect(x:0, y:100+width*3/6, width:width, height:width/8)
            goalDay.text = "目標:\(goalDate)日"
            goalDay.font = UIFont.systemFont(ofSize: width/20)
            goalDay.numberOfLines = 1
            goalDay.textAlignment = NSTextAlignment.center
            
            untilNextLevel.frame = CGRect(x:0, y:100+width*4/6, width:width, height:width/8)
            untilNextLevel.text = untilNextLevelText
            untilNextLevel.font = UIFont.systemFont(ofSize: width/20)
            untilNextLevel.numberOfLines = 2
            untilNextLevel.textAlignment = NSTextAlignment.center
            
       
         
        let onakinSwitch = userDefaults.bool(forKey: "onakinSwitch")
        if onakinSwitch == false{
        startStopButton.setTitle("禁欲する", for: .normal)
        }else{
             startStopButton.setTitle("リセットする", for: .normal)
        }
         startStopButton.setTitleColor(.black, for: .normal)
         startStopButton.layer.borderWidth = 2
         startStopButton.layer.borderColor = UIColor.gray.cgColor
         startStopButton.layer.cornerRadius = 10
         
        startStopButton.titleLabel?.font = UIFont.systemFont(ofSize: view.bounds.size.height/40)
         startStopButton.setTitleColor(UIColor.gray, for: .normal)
         startStopButton.frame = CGRect(x: 80, y: view.bounds.size.height*5/6, width: self.view.frame.width-160, height: self.view.frame.height / 20)
        
        }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @objc func switchTapped(_ sender: UITapGestureRecognizer){
        tapSwitch = !tapSwitch
        
        self.loadView()
        self.viewDidLoad()

   
    }

        
    
        var startTimeLabelText = "未スタート"
        var timerDayText = "0"
        var onakinTimeText = ""
        var untilNextLevelText = ""
        
        //記録用
        var NumberOfDays = ""
        var finishDate = ""
        //記録用
        @objc func timerCounter(){
            
            
            let currentTime = Date().timeIntervalSince(startTime)
           
            var day = (Int)(fmod((currentTime/86400),365))
            let hour = (Int)(fmod((currentTime/3600),24))
            let minute = (Int)(fmod((currentTime/60),60))
            //let second = (Int)(fmod(currentTime,60))
            
            let sHour = String(format:"%02d",hour)
            let sMinute = String(format:"%02d",minute)
            //let sSecond = String(format:"%02d",second)
            
            var startDate = ""
            
              if userDefaults.object(forKey: "開始日") != nil {
                startDate = userDefaults.string(forKey: "開始日") ?? ""
              }
            startTimeLabelText = "開始日:"+startDate
            
            var daySpan = 0
          
            if userDefaults.object(forKey: "daySpan") != nil {
                
                daySpan = userDefaults.integer(forKey: "daySpan")
            }
            
            
            timerDayText = "\(1 + day + daySpan)"
            NumberOfDays = "\(day+daySpan)"
            
            
            onakinTimeText = "禁欲時間:"+"\(day + daySpan)日"+"\(sHour)時間"+"\(sMinute)分"
            
            var levelTime = 0
            var goalDay = 0
            if userDefaults.object(forKey: "レベルタイム") != nil {
                levelTime = userDefaults.integer(forKey: "レベルタイム")
            }
            if userDefaults.object(forKey: "難易度") != nil {
                goalDay = userDefaults.integer(forKey: "難易度")
            }
            
            if levelTime == 0 {
            }else{
            let doubleDayHour : Double = (Double)(((day+daySpan)*24)+hour)
            let doubleLevelTime : Double = (Double)(levelTime)
            let doubleNowLevelTime = fmod((doubleDayHour),doubleLevelTime)
            let intNowLevelTime = (Int)(doubleNowLevelTime)
            let untilNextLevel = levelTime-intNowLevelTime
            
            
            
            if goalDay > (day+daySpan){
                untilNextLevelText = "次のレベルまで:\(untilNextLevel/24)日\(untilNextLevel-((untilNextLevel/24)*24))時間"
            } else {
                     untilNextLevelText = "目標達成"
            }
            }
            
            setupLayout()
            /*
                 
            timerHour.text = sHour
            timerMinute.text = sMinute
            timerSecond.text = sSecond
            */
        }
    
    
        
    
    
    
    
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        stringChosedGoal = list[row]
        intChosedGoal = goalDayArray[row]
        self.goalTxt.text = list[row]
    }
    
    
}
