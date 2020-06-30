//
//  MenuViewController.swift
//  19.12.12禁欲モンキー
//
//  Created by 福田一朗 on 2019/12/30.
//  Copyright © 2019 福田一朗. All rights reserved.
//


import UIKit
import StoreKit
import Accounts
import SCLAlertView

var sectionTitle = ["","",""]
var section0 = ["開始日を変更する","難易度を変更する","過去の遺言を削除する","手記を残す","記録を見る"]
var section1 = ["友人へ紹介する","このアプリを評価する"]
var section2 = ["プライバシーポリシー","お問い合わせ・不具合報告"]

let tableData = [section0,section1,section2]
class MenuViewController: UITableViewController,UIPickerViewDelegate, UIPickerViewDataSource,UITextFieldDelegate {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return sectionTitle.count
    }
    
    override func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int{
        
        let sectionData = tableData[section]
        return sectionData.count
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }
    override func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        let sectionData = tableData[(indexPath as NSIndexPath).section]
        let cellData = sectionData[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = cellData
        
        return cell
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // Do any additional setup after loading the view.
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //0-0
        if (indexPath.section == 0) && (indexPath.row == 0){
            
            userStartAlert()
            
        }else if (indexPath.section == 0) && (indexPath.row == 1){
            userGoalAlert()
            //2-1
        }else if (indexPath.section == 0) && (indexPath.row == 2){
            let alertView = SCLAlertView()
            alertView.addButton("過去の遺言を削除する") {
            let userDefaults = UserDefaults.standard
            userDefaults.removeObject(forKey: "yuigon")
           
        
            }
            alertView.showWarning("遺言を削除", subTitle: "一度削除すると元には戻せません。")
            
        
        }else if (indexPath.section == 0) && (indexPath.row == 3){
            
            let storyboard: UIStoryboard = self.storyboard!
            let nextView = storyboard.instantiateViewController(withIdentifier: "memoList") as! MemoListViewController
            self.navigationController?.pushViewController(nextView, animated: true)
                
            
        }else if (indexPath.section == 0) && (indexPath.row == 4){
            let storyboard: UIStoryboard = self.storyboard!
                let nextView = storyboard.instantiateViewController(withIdentifier: "record") as! RecordViewController
            self.navigationController?.pushViewController(nextView, animated: true)
            
        }else if (indexPath.section == 1) && (indexPath.row == 0){
            
            let width = view.bounds.size.width
            let height = view.bounds.size.height
            
            let shareWebsite = NSURL(string: "https://itunes.apple.com/us/app/%E3%82%B7%E3%83%B3%E3%82%B0%E3%83%AB%E3%82%BF%E3%82%B9%E3%82%AF/id1454994773?l=ja&ls=1&mt=8")!
            _ = [shareWebsite]
            let controller = UIActivityViewController(activityItems: [""], applicationActivities: nil)
           
            controller.popoverPresentationController?.sourceView = self.view;
            controller.popoverPresentationController?.sourceRect = CGRect(x: 100, y: 200, width: width/5, height: height/5)
            self.present(controller, animated: true, completion: nil)
            
        }else if (indexPath.section == 1) && (indexPath.row == 1){
            SKStoreReviewController.requestReview()
            
        }else if (indexPath.section == 2) && (indexPath.row == 0){
            
             let url = URL(string:"https://onakinmonkey.wordpress.com")
                       
                      
            UIApplication.shared.open(url!)
            
            
        }else if (indexPath.section == 2) && (indexPath.row == 1){
            let url = URL(string: "https://docs.google.com/forms/d/e/1FAIpQLSeG9DXjQ84M1Qk5jiNZ389MI2RrrtYD0HoO6wr05eQ4uTPXHg/viewform?usp=sf_link")
            UIApplication.shared.open(url!)
        }
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
             
            var dateStartDay = Date()
            if let startValue : String = self.userDefaults.string(forKey: "start"){
                   let date = startValue
                   let dateFormater = DateFormatter()
                   dateFormater.locale = Locale(identifier: "ja_JP")
                   dateFormater.dateFormat = "yyyy/MM/dd HH:mm:ss"
                   dateStartDay = dateFormater.date(from: date)!
                   
                  
            }
            
           
            
            let span = dateStartDay.timeIntervalSince(self.date1)
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
        timeAlert.addButton("難易度を変更する"){
            timeTxt.endEditing(true)
            timeTxt.text = self.stringChosedGoal
        }
        timeAlert.addButton("入力完了"){
            if timeTxt.text == "" {
            } else {
                
                self.userDefaults.set(self.intChosedGoal,forKey: "難易度")
               
                let levelTime = self.intChosedGoal*24/10
                self.userDefaults.set(levelTime,forKey: "レベルタイム")
                
                self.userDefaults.set(true,forKey: "onakinSwitch")
                
                timeAlert.hideView()
                self.loadView()
                self.viewDidLoad()
            }
        }
        timeAlert.showEdit("難易度を変更する",subTitle:"難易度を選択して下さい")
        
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
    
    /*
     func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
     switch result {
     case .cancelled:
     print("キャンセルされたある")
     // let targetViewController = self.storyboard!.instantiateViewController(withIdentifier: "list")as! UIViewController
     // self.present(targetViewController, animated: true, completion: nil)
     case .saved:
     print("保存された")
     //let targetViewController = self.storyboard!.instantiateViewController(withIdentifier: "list")as! UIViewController
     //self.present(targetViewController, animated: true, completion: nil)
     case .sent:
     SCLAlertView().showSuccess("送信完了", subTitle: "")
     //let targetViewController = self.storyboard!.instantiateViewController(withIdentifier: "collection")as! UIViewController
     //self.present(targetViewController, animated: true, completion: nil)
     default:
     SCLAlertView().showError("送信失敗", subTitle: "大変お手数ですが、時間を空けてもう一度送信して下さい。")
     //let targetViewController = self.storyboard!.instantiateViewController(withIdentifier: "list")as! UIViewController
     //self.present(targetViewController, animated: true, completion: nil)
     }
     dismiss(animated: true, completion: nil)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


