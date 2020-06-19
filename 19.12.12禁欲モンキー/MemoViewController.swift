//
//  ViewController5.swift
//  19.12.12禁欲モンキー
//
//  Created by 福田一朗 on 2019/12/30.
//  Copyright © 2019 福田一朗. All rights reserved.
//
import UIKit

class MemoViewController: UIViewController,UITextViewDelegate  {
   var memoArray = [String]()
    var indexPath = 0
    var AddSwitch = false
    let ud = UserDefaults.standard
   
   //---------------------
    
    private lazy var mailLabel: UILabel = {
        let label = UILabel()
        
        //label.setLabel(title: R.string.localizable.mailAddress())
        return label
    }()
    private lazy var mailInputField: UITextView = {
           let textView = UITextView()
           textView.delegate = self
           
        //textView.setTextField(title: R.string.localizable.textInput())
           return textView
       }()
    
    private lazy var saveButton:UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(tapSaveButton(_:)), for: UIControl.Event.touchUpInside)
        return button
    }()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        mailInputField.delegate = self
       // print("checkpoint2:"+"\(category)")
       // print("checkpoint3:"+"\(indexPath)")
        
        setupLayout()
        
        //print("checkpoint4:"+"\(memoKey)"+"\(dateKey)")
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    private func setupLayout() {
        
        view.addSubview(mailLabel)
        view.addSubview(mailInputField)
        view.addSubview(saveButton)
        //label-------------------------
      mailLabel.frame = CGRect(x:0, y:view.bounds.size.width/3, width:view.bounds.size.width, height:view.bounds.size.width/50)
      mailLabel.text = "決意や苦しみを書き残す"
      mailLabel.font = UIFont.systemFont(ofSize: view.bounds.size.width/21)
      
      mailLabel.numberOfLines = 0
      mailLabel.lineBreakMode = .byCharWrapping
       /* mailLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: ViewConst.mailLabelLeft).isActive = true
       mailLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        mailLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50/*ViewConst.mailLabelTop*/).isActive = true
        //mailLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: ViewConst.mailLabelRight).isActive = true
        mailLabel.widthAnchor.constraint(equalToConstant: view.bounds.size.width).isActive = true
        mailLabel.heightAnchor.constraint(equalToConstant: view.bounds.size.width/20).isActive = true*/
        //textfield---------------------------------
        mailInputField.font = UIFont.systemFont(ofSize: view.bounds.size.width/21)
        mailInputField.layer.borderWidth = 1
        mailInputField.layer.borderColor = UIColor.gray.cgColor
        mailInputField.translatesAutoresizingMaskIntoConstraints = false
        mailInputField.textAlignment = .left
        mailInputField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        //mailInputField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: ViewConst.textFieldLeft).isActive = true
        mailInputField.topAnchor.constraint(equalTo: mailLabel.topAnchor, constant: ViewConst.textFieldTop).isActive = true
        mailInputField.widthAnchor.constraint(equalToConstant: view.bounds.size.width-80).isActive = true
        
        mailInputField.heightAnchor.constraint(equalToConstant: view.bounds.size.height/3).isActive = true
        if AddSwitch == false {
            if ud.array(forKey:"memoArray") != nil{
           
            //取得 またas!でアンラップしているのでnilじゃない時のみ
                memoArray = ud.array(forKey: "memoArray") as![String]
                mailInputField.text = memoArray[indexPath]
            
            }else{
                mailInputField.text = ""
            }
        }else{
            mailInputField.text = ""
        }
        
        //button----------------------------------------------------------
       saveButton.setTitle("保存", for: .normal)
        saveButton.setTitleColor(.black, for: .normal)
        saveButton.layer.borderWidth = 2
        saveButton.layer.borderColor = UIColor.gray.cgColor
        saveButton.layer.cornerRadius = 10
        
        saveButton.titleLabel?.font = UIFont.systemFont(ofSize: view.bounds.size.height/40)
        saveButton.setTitleColor(UIColor.gray, for: .normal)
        saveButton.frame = CGRect(x: 80, y: view.bounds.size.height*3/4, width: self.view.frame.width-160, height: self.view.frame.height / 20)
        
     
       /* saveButton.leadingAnchor.constraint(equalTo:view.leadingAnchor,constant:ViewConst.textFieldLeft).isActive = true
        print(view.leftAnchor)
        saveButton.bottomAnchor.constraint(equalTo:view.bottomAnchor, constant:20).isActive = true
        
       saveButton.widthAnchor.constraint(equalToConstant: view.bounds.size.width-80).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: view.bounds.size.height/6).isActive = true
        print(view.bounds.size.width)
 */
//image---------------------------------------------
       //commentlabel------------------------------------------------------------
        
    }

   @objc func tapSaveButton(_ sender:UIButton) {
            let inputText = mailInputField.text
           let ud = UserDefaults.standard
   
           if ud.array(forKey: "memoArray") != nil{
               //saveMemoArrayに取得
               var saveMemoArray = ud.array(forKey: "memoArray") as! [String]
               var saveDateArray = ud.array(forKey:"dateArray") as! [String]
                   //テキストに何か書かれているか？
               if inputText != ""{
                   //メモを配列に追加
                if AddSwitch == true{
                saveMemoArray.append(inputText!)
                }else{
                saveMemoArray[indexPath] = inputText!
                }
                   
                   ud.set(saveMemoArray, forKey: "memoArray")
                //日付取得
                   let writingTime = Date()
                    //Date型の日付をStringに変換
                    let dateFormater = DateFormatter()
                    dateFormater.locale = Locale(identifier: "ja_JP")
                    dateFormater.dateFormat = "yyyy年MM月dd日 HH時mm分ss秒"
                    let date = dateFormater.string(from: writingTime)
              
                
                if AddSwitch == true{
                    
                    saveDateArray.append(date)
                }else{
                    saveDateArray[indexPath] = date
                }
                    ud.set(saveDateArray,forKey:"dateArray")
               }else{
               

               }

           }else{
               //最初、何も書かれていない場合
               var newMemoArray = [String]()
            var newDateArray = [String]()
               //nilを強制アンラップはエラーが出るから
               if inputText != ""{
                   //inputtextはoptional型だから強制アンラップ
                   newMemoArray.append(inputText!)
                   ud.set(newMemoArray, forKey:  "memoArray")
                //日付取得
                let writingTime = Date()
                 //Date型の日付をStringに変換
                 let dateFormater = DateFormatter()
                 dateFormater.locale = Locale(identifier: "ja_JP")
                 dateFormater.dateFormat = "yyyy年MM月dd日 HH時mm分ss秒"
                 let date = dateFormater.string(from: writingTime)
                 newDateArray.append(date)
                 ud.set(newDateArray,forKey: "dateArray")
                
               }else{
               
               }
           }
            showAlert()
       
            
            
           ud.synchronize()
       
   }
    func showAlert(){
        let alert: UIAlertController = UIAlertController(title: "保存完了", message: "保存しました", preferredStyle:  UIAlertController.Style.alert)

        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
(action: UIAlertAction!) -> Void in
            let layere_number = self.navigationController!.viewControllers.count
            self.navigationController?.popToViewController(self.navigationController!.viewControllers[layere_number-2], animated: true)
        })
        alert.addAction(defaultAction)

        self.present(alert, animated: true, completion:nil)
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {

        
        if (text == "\n") {
            //あなたのテキストフィールド
            mailInputField.resignFirstResponder()
            return false
        }
        return true
    }
    
    override func touchesBegan(_  touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }

    private struct ViewConst {
    static let mailLabelTop: CGFloat = 150
    static let mailLabelLeft: CGFloat = 40
    static let mailLabelRight: CGFloat = 40
    static let mailLabelWidth: CGFloat = 150
    static let mailLabelHeight: CGFloat = 50
    static let textFieldTop: CGFloat = 50
    static let textFieldLeft: CGFloat = 40
               //static let textFieldWidth: CGFloat = 300
               //static let textFieldHeight: CGFloat = 50
    }
}
extension UILabel {
    func setLabel(title: String) {
        self.font = UIFont.boldSystemFont(ofSize: 15)
        self.text = title
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UITextField {
    func setTextField(title: String) {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textAlignment = .center
        self.placeholder = title
    }
}
