//
//  BossViewController.swift
//  20.7.6ゲーム性を持たせる
//
//  Created by 福田一朗 on 2020/07/09.
//  Copyright © 2020 福田一朗. All rights reserved.
//

import UIKit

class BossViewController: UIViewController, UINavigationControllerDelegate {
    
    var didBack: (() -> Void)?
    override func didMove(toParent parent: UIViewController?) {
           if parent == nil {
               // 「戻る」場合の処理はここから
               super.didMove(toParent: nil)
               self.didBack?()
               return
           }
           // 「進む」場合の処理はここから
           super.didMove(toParent: parent)
       }
    
    static var character = Character(counter: 0)
    //static var actionNo = 0
    var counter = 0
    static var stage = 0
    let ud = UserDefaults.standard
    
    var Data = characterCsvData(image0: "", comment0: "", button1: "", button2: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        
          counter = ud.integer(forKey: "counter.b")
         BossViewController.stage = ud.integer(forKey: "stage")
        
         
         BossViewController.character = Character(counter:counter)
         characterCsvDM.sharedInstance.loadData()
         
         if let d = characterCsvDM.sharedInstance.nextData() {
             Data = d
         }
        
         setUpLayout()
        
         self.view.addBackground(name: "背景1")
        
        navigationController?.delegate = self
        // Do any additional setup after loading the view.
    }
    
   
    let imageView = UIImageView()
    func monkeyImage(){
        // ⦿ UIViewの上にUIImageViewを貼り付けます。
         let width = view.bounds.size.width
         let height = view.bounds.size.height
         
        
        let image = UIImage(named: Data.image0)
        
         imageView.frame = CGRect(x:(width-(height/2))/2+25,y:50,width: (height/2)-50,height:(height/2)-50)
         
         imageView.image = image
        
        imageView.alpha = 0.0
        UIView.animate(withDuration: 2.0, delay: 0.0, options: [.curveEaseIn], animations: {
            self.imageView.alpha = 1.0
        }, completion: nil)
        
         self.view.addSubview(imageView)
    }

    private var textLabel: UILabel = {
        let label = UILabel()
        //label.setLabel(title: R.string.localizable.mailAddress())
        return label
    }()

    private var button1:UIButton = {
    let button = UIButton()
          button.addTarget(self, action: #selector(button1(_:)), for: UIControl.Event.touchUpInside)
          return button
    }()

    private var button2:UIButton = {
    let button = UIButton()
          button.addTarget(self, action: #selector(button2(_:)), for: UIControl.Event.touchUpInside)
          return button
    }()
  
    
    
    var point = 0
    
    @objc func button1(_ sender:UIButton) {
       //StoryViewController.day = 30//テスト
        switch BossViewController.stage {
        case 0 :
            stage0_b1()
        case 1 :
            stage1_b1()
        case 2 :
        stage2_b1()
        case 3 :
           stage3_b1()
        case 4:
            stage4_b1()
        case 5:
            stage5_b1()
        case 6:
            stage6_b1()
        case 7:
            stage7_b1()
        case 8:
            stage8_b1()
            case 9:
            stage9_b1()
        default :
            return
        }
        //if counter < 39 { counter += 1}
        
        ud.set(counter, forKey: "counter.b")
        ud.set(BossViewController.stage, forKey: "stage")
       
        self.loadView()
        self.viewDidLoad()
    }
    var deathPoint = 0
    @objc func button2(_ sender:UIButton) {
      //   ViewController.day = 30//テスト
        switch BossViewController.stage{
        
        case 0 :
         stage0_b2()
        case 1 :
            stage1_b2()
        case 2 :
            stage2_b2()
        case 3 :
            stage3_b2()
        case 4:
            stage4_b2()
        case 5:
            stage5_b2()
        case 6:
            stage6_b2()
        case 7:
            stage7_b2()
        case 8:
                   stage8_b2()
        case 9:
        stage9_b2()
        default :
            return
        }
        
        //if counter < 39 { counter += 1}
        ud.set(counter, forKey: "counter.b")
        ud.set(BossViewController.stage, forKey: "stage")
        self.loadView()
        self.viewDidLoad()
    }
    
    private var backButton:UIButton = {
    let button = UIButton()
          button.addTarget(self, action: #selector(back(_:)), for: UIControl.Event.touchUpInside)
          return button
    }()
    
    @objc func back(_ sender:UIButton) {
         self.dismiss(animated: true, completion: nil)
       /*let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "main") as! StoryViewController
        self.present(secondViewController, animated: true, completion: nil)
 */
    }
   
   func setUpLayout(){
                monkeyImage()
            
    
    
                view.addSubview(textLabel)
            if Data.button1 != "" {
               view.addSubview(button1)
            }
            if Data.button2 != ""{
               view.addSubview(button2)
            }
           // view.addSubview(backButton)
               let width = view.bounds.size.width
               let height = view.bounds.size.height
               
    
               
                textLabel.text  = Data.comment0
               textLabel.frame = CGRect(x:0, y:height*0.5, width:width, height:height/4)
                     
               textLabel.font = UIFont.systemFont(ofSize: height/40)
               textLabel.textAlignment = .center
               textLabel.numberOfLines = 0
                textLabel.textColor = .white
               
                button1.setTitle(Data.button1, for: .normal)
                button1.setTitleColor(.white, for: .normal)
                button1.layer.borderWidth = 2
                button1.layer.borderColor = UIColor.white.cgColor
                button1.layer.cornerRadius = 10
                button1.titleLabel?.font = UIFont.systemFont(ofSize: view.bounds.size.height/40)
                
    button1.frame = CGRect(x: width/2-width*4/9, y: height*6.2/9, width: width*8/9, height: height / 20)
               
    button2.setTitle(Data.button2, for: .normal)
                button2.setTitleColor(.white, for: .normal)
              button2.layer.borderWidth = 2
                button2.layer.borderColor = UIColor.white.cgColor
                button2.layer.cornerRadius = 10
                button2.titleLabel?.font = UIFont.systemFont(ofSize: view.bounds.size.height/40)
              
    button2.frame = CGRect(x:  width/2-width*4/9, y: height*7/9, width: width*8/9, height: self.view.frame.height / 20)
    
                backButton.setTitle("戻る", for: .normal)
                backButton.setTitleColor(.black, for: .normal)
                backButton.layer.borderWidth = 2
                backButton.layer.borderColor = UIColor.gray.cgColor
                backButton.layer.cornerRadius = 10
                backButton.titleLabel?.font = UIFont.systemFont(ofSize: view.bounds.size.height/40)
                backButton.setTitleColor(UIColor.gray, for: .normal)
    backButton.frame = CGRect(x: width/2-width/7, y: height*8.2/9, width: width*2/7, height: self.view.frame.height / 20)
    
    }
    /*
    override func prepare(for segue: UIStoryboardSegue,sender: Any?){
    if segue.identifier == "toNext" {
            // 遷移先のViewControllerを取得
            let next = segue.destination as? NextViewController
            // 遷移先のプロパティに処理ごと渡す
            next?.resultHandler = {
                // 引数を使ってoutputLabelの値を更新する処理
                print("counter\(self.counter)")
                print("BossViewController.stage\(BossViewController.stage)")
                self.loadView()
                self.viewDidLoad()
                
            }
        }
    }
    */
    
    func next(){
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "next") as! NextViewController
        self.present(secondViewController,animated: true, completion: { () in
           secondViewController.resultHandler = {
           // 引数を使ってoutputLabelの値を更新する処理
           print("counter\(self.counter)")
           print("BossViewController.stage\(BossViewController.stage)")
           self.loadView()
           self.viewDidLoad()
            }
        })
    }
    /*
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
            if viewController is StoryViewController {
                //挿入したい処理
                StoryViewController.loadView()
                self.viewDidLoad()
            }
        }
    */
    
    func stage0_b1(){
        switch counter {
          case 0://アフリカ西部　ジャングル→歩く
              counter = 1
          case 1://歩いた→さらに歩く
              if StoryViewController.day < 1 {counter = 1}
              else {counter = 2}
            
            case 2://気配がする→歩く
                //counter = 0
                deathPoint = 0
               // performSegue(withIdentifier: "toNext", sender: nil)
                next()
                
          case 3://休んだ→歩く
              if StoryViewController.day < 1 {counter = 1}
              else {counter = 2}
          case 4://後ろから襲われ、殺された。→最初から始める
            
            GameOver()
          default:
              return
          }
        
    }
    func stage0_b2(){
        
        if deathPoint < 5{
        switch counter {
        case 0://アフリカ西部→休む
            counter = 3
            if StoryViewController.day < 1 {deathPoint += 1}
            
        case 1://歩いた→休む
            counter = 3
            if StoryViewController.day < 1 {deathPoint += 1}
          
        case 3://休んださらに休む
            counter = 3
            if StoryViewController.day < 1 { deathPoint += 1}
          
        default:
            return
        }
        }else{
            counter = 4
        }
    }
    
    func stage1_b1(){
        switch counter {
          case 0://誰かいそうだ→次へ
              counter = 1
              case 1:
              counter = 2
            
          case 2://見ねー顔だな→助けを
              if StoryViewController.day < 2 {counter = 3}
              else {counter = 4}
            
            case 3://他を当たれ→分かった
                counter = 0
          case 4://ボスに話してくる→次へ
               next()
           // counter = 0
          case 5://ひとり死んでいった→次へ
           GameOver()
          default:
              return
          }
        
    }
    func stage1_b2(){
        
        if deathPoint != 5{
        switch counter {
        case 2://見ねー顔だな→逃げる
            counter = 5
          
        default:
            return
        }
        }else{
            counter = 4
        }
    }
    func stage2_b1(){
        switch counter {
          case 0://黒→次へ
              counter = 1
          case 1://半目→次へ
              counter = 2
            
          case 2://目覚め→次へ
            counter = 3
          case 3://起きたか？→次へ
            counter = 4
            
          case 4 ://ボスが待ってる→会うのやめとく
           counter = 5
          case 5://ひとり死んでいった→次へ
             GameOver()
        case 6://ボスザルと話す
            if StoryViewController.day < 5 {counter = 7}
            else {counter = 8}
        case 7://首が吹き飛ぶ→次へ
          GameOver()
        case 8 :
               next()
           // counter = 0
          default:
              return
          }
        
    }
    func stage2_b2(){
        
        if deathPoint != 5{
        switch counter {
        case 4://ボス待ってる→今行く
            counter = 6
          
        default:
            return
        }
        }else{
            counter = 4
        }
    }
    func stage3_b1(){
        switch counter {
          case 0://遊ぼうぜ→遊ぶ
              counter = 1
          case 1://木苺→受けてたとう
              counter = 2
        
          case 2://ゲームスタート→
            counter = 3
          case 3://30分後→次へ
            if StoryViewController.day < 7 {counter = 4}
            else { counter = 6}
            
          case 4 ://木苺0個→次へ
           counter = 5
          case 5://話にならねーわ→次へ
            
            GameOver()
        case 6://38個!?次へ
            counter = 7
        case 7://首が吹き飛ぶ→次へ
            counter = 8
        case 8 ://友達になる次へ
              next()
          //  counter = 0
        case 9 ://友達になる次へ
            GameOver()
          default:
              return
          }
        
    }
    func stage3_b2(){
        
        
        switch counter {
        case 0://遊ぼう断る
            counter = 9
          case 1://遊ぼう断る
          counter = 9
        default:
            return
        }
            }
    
    func stage4_b1(){
        switch counter {
          case 0://新入りか→次へ
            if StoryViewController.day < 9{counter = 2}
            else {counter = 1}
          case 1://いい目をしている。次へ
              counter = 3
        
          case 2://出直せ→次へ
            counter = 0
          case 3://オナ禁いいぞ→次へ
            counter = 4
            
          case 4 ://特殊能力→次へ
           counter = 5
          case 5://楽しみにしている。次へ。
             next()
            //counter = 0
        
        
          default:
              return
          }
        
    }
    func stage4_b2(){
        
     print("stage4_b2()")
    }
    func stage5_b1(){
        switch counter {
          case 0://敵襲だ！→次へ
            counter = 1
          case 1://襲ってきたようだ。次へ
              counter = 2
        
          case 2://殺す！→右ストレーtp
            if StoryViewController.day < 12{
                
                counter = 3
            }else{
                counter = 4
            }
          case 3://攻撃が外れる次へ
           GameOver()
          case 4 ://攻撃が入る→次へ
           counter = 6
        
        case 5://攻撃が入る→次へ
        counter = 6
            
          case 6://逃げろ！次へ。
            counter = 7
          case 7://逃げた。次へ。
          counter = 8
          case 8://もう追ってこない。次へ。
            counter = 9
            case 9://もう追ってこない。次へ。
          
             next()
           // counter = 0
          default:
              return
          }
        
    }
    func stage5_b2(){
        switch counter {
        case 2://殺す！左フックストレート
        
        if StoryViewController.day < 12{
            
            counter = 3
        }else{
            counter = 5
        }
        default:
                return
            }
        
    }
    
    func stage6_b1(){
        switch counter {
          case 0://手当て→次へ
            counter = 1
          case 1://目。次へ
              counter = 2
        
          case 2://涙がたまる次へ
           counter = 3
          case 3://涙が落ちる
             if StoryViewController.day < 15 {counter = 0}
             else{counter = 4}
          case 4 ://涙が落ちる→次へ
           counter = 5
            
          case 5://傷がそのまま→
            counter = 6
          case 6://傷が治る→次へ
          counter = 7
          case 7://お前、もしかして。次へ
            counter = 8
            case 8://もう追ってこない。次へ。
            counter = 9
            case 9://もう追ってこない。次へ。
              next()
           // counter = 0
          default:
              return
          }
        
    }
    func stage6_b2(){
        return
        
    }
    var rabellionPoint = 0
    var recoverPoint = 0
    func stage7_b1(){
        switch counter {
          case 0://群れ再建→次へ
            counter = 1
          case 1://お前が指揮→次へ
              counter = 2
        
          case 2://指揮をとる
            
            if StoryViewController.day < 20{
                if rabellionPoint < 5{
                    counter = 3
                rabellionPoint += 1
                }else {
                    counter = 4
                }
            }
            else {
                if recoverPoint < 10{
                    counter = 3
                recoverPoint += 1
                }else {
                        counter = 5
                    }
            }
          case 3://皆んな一生懸命働いた
            counter = 2
          case 4 ://やめた！
            GameOver()
            
          case 5://むれが再建
              next()
            //counter = 0
         
          default:
              return
          }
        
    }
    func stage7_b2(){
        switch counter {
        case 2://殺す！左フックストレート
        
        if StoryViewController.day < 12{
            
            counter = 3
        }else{
            counter = 4
        }
        default:
                return
            }
        
    }
    
    func stage8_b1(){
          switch counter {
            case 0://復讐→次へ
              counter = 1
            case 1://お前を頼り→次へ
                counter = 2
          
            case 2://よし行こう
              
              counter = 3
            case 3://雑魚に負けるか！
              counter = 4
            case 4 ://ザコを簡単に倒す
               counter = 5
            case 5://あいつがボスだs
            
            if StoryViewController.day < 25{counter=6}
            else {counter=7}
            case 6://殴る→次へ
                counter = 9
         
          case 7://頬骨を粉砕
            counter = 8
            
          case 8:
               next()
           // counter = 0
            
         case 9:
                 GameOver()
            
            default:
                return
            }
          
      }
      func stage8_b2(){
          print("stage8_b2()")
          
      }
    
    func stage9_b1(){
          switch counter {
            case 0://俺は行くよ
                if StoryViewController.day < 30{counter = 1}
                else {counter = 2}
            case 1://孤独にしぬ
                GameOver()
          
            case 2://さらに強くなる
              
              GameClear()
            case 3://窓際おじさん
              GameOver()
            case 4 ://伝説となる
               GameClear()
             
         
            
            
            default:
                return
            }
          
      }
      func stage9_b2(){
         
          switch counter {
          case 0://止まる
            if StoryViewController.day < 30{counter = 3}
            else {counter = 4}
            default:
                           return
                       }
                     
      }
    
    func GameOver(){
            
            counter = 0
           // BossViewController.stage = 0
            //ud.set(false,forKey: "onakinSwitch")
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "GameOver") as! GameOverViewController
        self.present(secondViewController, animated: true, completion: nil)

    }
    
    func GameClear(){
               
              // counter = 0
              // BossViewController.stage = 0
              
           let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "GameClear") as! ClearViewController
           self.present(secondViewController, animated: true, completion: nil)

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
