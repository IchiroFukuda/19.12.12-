
//
//  RecordViewController.swift
//  19.12.12禁欲モンキー
//
//  Created by 福田一朗 on 2019/12/30.
//  Copyright © 2019 福田一朗. All rights reserved.
//


import UIKit

class RecordViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var recordArray = [Any]()
    var recordDic = ["日数":String(),"開始日":String(),"終了日":String()]
    var startDateArray = [String]()
    var finishDateArray = [String]()
    
     @IBOutlet weak var recordTableView: UITableView!
    let ud = UserDefaults.standard
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return recordArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recordCell", for: indexPath)
        
       
        recordDic = recordArray[indexPath.row] as! [String : String]
        
        cell.textLabel?.text = recordDic["日数"]!+"日"
        
        var recordDicStart = ""
        var recordDicFinish = ""
        if let start = recordDic["開始日"] {
            recordDicStart = start
        }
        
        if let finish = recordDic["終了日"] {
            recordDicFinish = finish
        }
        
        
        cell.detailTextLabel!.text = "\(  recordDicStart),終了日：\(  recordDicFinish)"
       
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recordTableView.delegate = self
        recordTableView.dataSource = self
        
        
        //print("checkpoint1"+"\(category)")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadMemo()
    }
    func loadMemo(){
        if ud.array(forKey: "recordArray") != nil{
            //取得 またas!でアンラップしているのでnilじゃない時のみ
            recordArray = ud.array(forKey: "recordArray")!
            
        }
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

            if editingStyle == .delete {

                //resultArray内のindexPathのrow番目をremove（消去）する
                recordArray.remove(at: indexPath.row)
                
                //再び
    
                ud.set(recordArray, forKey: "recordArray")
                
                //tableViewを更新
                tableView.reloadData()
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

}
