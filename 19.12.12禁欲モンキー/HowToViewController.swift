//
//  HowToViewController.swift
//  19.12.12禁欲モンキー
//
//  Created by 福田一朗 on 2020/09/06.
//  Copyright © 2020 福田一朗. All rights reserved.
//

import UIKit

class HowToViewController: UIViewController {

    var scrollview = UIScrollView()
    
    private lazy var commentLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var title1: UILabel = {
           let label = UILabel()
           
           return label
       }()
    private lazy var sentence1: UILabel = {
           let label = UILabel()
           
           return label
       }()
    private lazy var title2: UILabel = {
           let label = UILabel()
           
           return label
       }()
    private lazy var sentence2: UILabel = {
           let label = UILabel()
           
           return label
       }()
    private lazy var title3: UILabel = {
           let label = UILabel()
           
           return label
       }()
    private lazy var sentence3: UILabel = {
           let label = UILabel()
           
           return label
       }()
    private lazy var title4: UILabel = {
           let label = UILabel()
           
           return label
       }()
    private lazy var sentence4: UILabel = {
           let label = UILabel()
           
           return label
       }()
    private lazy var title5: UILabel = {
           let label = UILabel()
           
           return label
       }()
    private lazy var sentence5: UILabel = {
           let label = UILabel()
           
           return label
       }()
    private lazy var title6: UILabel = {
           let label = UILabel()
           
           return label
       }()
    private lazy var sentence6: UILabel = {
           let label = UILabel()
           
           return label
       }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addBackground(name: "背景1")
        let viewX = self.view.frame.width
        let viewY = self.view.frame.height
        scrollview.frame = CGRect(x:0, y:0, width:viewX , height:viewY)
       // scrollview.backgroundColor = UIColor.red
        scrollview.contentSize = CGSize(width:viewX , height:viewY*6)
        self.view.addSubview(scrollview)
        setUpLayout()
        // Do any additional setup after loading the view.
    }

    
    
    
    func setUpLayout(){
        scrollview.addSubview(commentLabel)
        scrollview.addSubview(title1)
        scrollview.addSubview(title2)
        scrollview.addSubview(title3)
        scrollview.addSubview(title4)
        scrollview.addSubview(title5)
        scrollview.addSubview(title6)
        scrollview.addSubview(sentence1)
        scrollview.addSubview(sentence2)
        scrollview.addSubview(sentence3)
        scrollview.addSubview(sentence4)
        scrollview.addSubview(sentence5)
        scrollview.addSubview(sentence6)
        let width = view.bounds.size.width
        let height = view.bounds.size.height
        title1.frame = CGRect(x:0, y:height*0.05, width:width, height:height*0.1)
        title1.font = UIFont.systemFont(ofSize: height*0.05)
        title1.numberOfLines = 0
        title1.textColor = UIColor.white
        title1.textAlignment = NSTextAlignment.left
        title1.text = "1.理由を明確にする"
        
        title2.frame = CGRect(x:0, y:height, width:width, height:height*0.1)
        title2.font = UIFont.systemFont(ofSize: height*0.05)
        title2.numberOfLines = 0
        title2.textColor = UIColor.white
        title2.textAlignment = NSTextAlignment.left
        title2.text = "2.日記を書く"
        
        title3.frame = CGRect(x:0, y:height*2, width:width, height:height*0.1)
        title3.font = UIFont.systemFont(ofSize: height*0.05)
        title3.numberOfLines = 0
        title3.textColor = UIColor.white
        title3.textAlignment = NSTextAlignment.left
        title3.text = "3.オナ禁効果を実感する"
        
        title4.frame = CGRect(x:0, y:height*3, width:width, height:height*0.1)
        title4.font = UIFont.systemFont(ofSize: height*0.05)
        title4.numberOfLines = 0
        title4.textColor = UIColor.white
        title4.textAlignment = NSTextAlignment.left
        title4.text = "4.オナ禁で、覚醒する"
        
        title5.frame = CGRect(x:0, y:height*4, width:width, height:height*0.1)
        title5.font = UIFont.systemFont(ofSize: height*0.05)
        title5.numberOfLines = 0
        title5.textColor = UIColor.white
        title5.textAlignment = NSTextAlignment.left
        title5.text = "5.オナ禁で、勝つ"
        
        title6.frame = CGRect(x:0, y:height*5, width:width, height:height*0.1)
        title6.font = UIFont.systemFont(ofSize: height*0.05)
        title6.numberOfLines = 0
        title6.textColor = UIColor.white
        title6.textAlignment = NSTextAlignment.left
        title6.text = "6.オナニーを置き去りにする"
        
        sentence1.frame = CGRect(x:0, y:height*0.15, width:width, height:height*0.6)
        sentence1.font = UIFont.systemFont(ofSize: height*0.03)
        sentence1.numberOfLines = 0
        sentence1.textColor = UIColor.white
        sentence1.textAlignment = NSTextAlignment.left
        sentence1.text = "あなたは何故、オナ禁をするのでしょうか。途中で、目的を見失わないためにも、何故オナ禁をするのかを明確にしておく事は非常に重要です。オナ禁には様々なメリットがありますが、一番は、男らしいハングリー精神が身に付くことだと思います。「女が欲しい、金が欲しい、もっと、もっとかっこいい男になりたい。」といった気概が不思議と出てきます。オナニーをしていると、オナニーに意思力を削がれ、馬力が出ず、やるべき時に力が出ない、かつそんなショボい自分でも射精して簡単に気持ち良くなるから、自分を向上させようと言った気力も出ない。そしてどんどんダサく弱くなっていく悪循環にはまります。男らしく生きたい。その思いがあるならば、それだけで十分オナ禁をする理由があると思います。"
        sentence1.sizeToFit()
        
        sentence2.frame = CGRect(x:0, y:height+height*0.15, width:width, height:height*0.6)
        sentence2.font = UIFont.systemFont(ofSize: height*0.03)
        sentence2.numberOfLines = 0
        sentence2.textColor = UIColor.white
        sentence2.textAlignment = NSTextAlignment.left
        sentence2.text = "オナ禁には、苦しみが伴います。まず、薬物中毒のように、脳が定期的な快楽物質の供給に慣れているので、オナ禁をすると禁断症状が現れます。この禁断症状が生じたとき、（かなり難しいことだとは思いますが、）自分の真に望んでいることを、紙に書いて脳に刻み込む事が、オナ禁継続のコツとなります。「今射精すれば、確かに気持ちが良い。しかし、それは自分が真に心から望んでいることなのか？」と紙に書いて己に問うのです。"
        sentence2.sizeToFit()
        
        
        sentence3.frame = CGRect(x:0, y:height*2+height*0.15, width:width, height:height*0.6)
        sentence3.font = UIFont.systemFont(ofSize: height*0.03)
        sentence3.numberOfLines = 0
        sentence3.textColor = UIColor.white
        sentence3.textAlignment = NSTextAlignment.left
        sentence3.text = "個人差がありますが、オナ禁には以下の効果があると言われています。\n・髪サラ効果\n・肌質改善\n・ハゲ予防\n・コミュ力の向上\n・顔が凛々しくなる\n・筋肉が付きやすくなる\n・男に舐められなくなる\n・行動力が増す\n・集中力が増す。\nこれらの効果を感じる事で、オナ禁が楽しくなります。むしろオナニーをするのが怖くなる事でしょう。"
        sentence3.sizeToFit()
        
        
        sentence4.frame = CGRect(x:0, y:height*3+height*0.15, width:width, height:height*0.6)
        sentence4.font = UIFont.systemFont(ofSize: height*0.03)
        sentence4.numberOfLines = 0
        sentence4.textColor = UIColor.white
        sentence4.textAlignment = NSTextAlignment.left
        sentence4.text = "オナ禁を長く続けていると、覚醒するステージを経験します。体から何やらオーラのような、熱気が発せられ、顔つきが別人のようにキリッとし、集中力が高まります。あらゆる物事に意欲的に取り組むようになり、勉学やスポーツで結果を残すことができるようになります。その姿は、女から見て魅力的である事は間違いなく、モテるようになります。"
        sentence4.sizeToFit()
        
        sentence5.frame = CGRect(x:0, y:height*4+height*0.15, width:width, height:height*0.6)
        sentence5.font = UIFont.systemFont(ofSize: height*0.03)
        sentence5.numberOfLines = 0
        sentence5.textColor = UIColor.white
        sentence5.textAlignment = NSTextAlignment.left
        sentence5.text = "オナ禁とは、すなわち、有利な状況下で敵と戦うための、兵力の温存です。今の時代は、インターネットの発達により、ほとんどの男達が毎晩オナニーして気力を消耗しています。ここでもしあなたがオナ禁をすれば、周囲のほとんどの男たちよりも多くの精神力と体力を残す事ができ、あらゆる競争で有利な立ち位置をキープする事ができます。そして大事な事は、この状況を生かして勝つ事です。ただ兵力を温存するだけでは、宝の持ち腐れと言っても過言ではありません。温存した兵力を使って、何か目的を達成して初めて、オナ禁は意味を持ちます。"
        sentence5.sizeToFit()
        
        
        sentence6.frame = CGRect(x:0, y:height*5+height*0.15, width:width, height:height*0.6)
        sentence6.font = UIFont.systemFont(ofSize: height*0.03)
        sentence6.numberOfLines = 0
        sentence6.textColor = UIColor.white
        sentence6.textAlignment = NSTextAlignment.left
        sentence6.text = "オナ禁が完全に生活に組み込まれ、習慣化すると、「オナニー？何それ美味しいの？」とサラッと言える状態になります。「それより、ちょっと今自分の人生を向上させることで忙しいから、下らないことに時間使ってる暇無いわ。」と自分の中に芯が生まれ、自分軸で生きていけるようになります。あなたはついにオナニーを置き去りにするのです。ここまで来れば、自分をオナ禁マスターと称してもいいでしょう。"
        sentence6.sizeToFit()
       

        
        
    }
}






    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


extension UIView {
    func addBackground(name: String) {
        // スクリーンサイズの取得
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height

        // スクリーンサイズにあわせてimageViewの配置
        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        //imageViewに背景画像を表示
        imageViewBackground.image = UIImage(named: name)

        // 画像の表示モードを変更。
        imageViewBackground.contentMode = UIView.ContentMode.scaleAspectFill

        // subviewをメインビューに追加
        self.addSubview(imageViewBackground)
        // 加えたsubviewを、最背面に設置する
        self.sendSubviewToBack(imageViewBackground)
    }
}

