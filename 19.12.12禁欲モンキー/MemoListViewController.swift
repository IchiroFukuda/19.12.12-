

//
//  ViewController6.swift
//  19.12.12禁欲モンキー
//
//  Created by 福田一朗 on 2019/12/30.
//  Copyright © 2019 福田一朗. All rights reserved.
//

import UIKit

class MemoListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var memoArray = [String]()
    var dateArray = [String]()
    
     @IBOutlet weak var memoTableView: UITableView!
    let ud = UserDefaults.standard
    @IBAction func addButton(_ sender: Any) {
        
      let storyboard: UIStoryboard = self.storyboard!
      let nextView = storyboard.instantiateViewController(withIdentifier: "memo") as! MemoViewController
       nextView.AddSwitch = true
       self.navigationController?.pushViewController(nextView, animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return memoArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell", for: indexPath)
        
        
        cell.textLabel?.text = memoArray[indexPath.row]
        cell.detailTextLabel?.text = dateArray[indexPath.row]
       
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard: UIStoryboard = self.storyboard!
        
        let nextView = storyboard.instantiateViewController(withIdentifier: "memo") as! MemoViewController
       
        nextView.indexPath = indexPath.row
        self.navigationController?.pushViewController(nextView, animated: true)
        //self.performSegue(withIdentifier: "toDetail", sender: nil)
        print(nextView.indexPath)
        //押したら押した状態を解除
        tableView.deselectRow(at: indexPath, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        memoTableView.delegate = self
        memoTableView.dataSource = self
        
        
        //print("checkpoint1"+"\(category)")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadMemo()
    }
    func loadMemo(){
        if ud.array(forKey: "memoArray") != nil{
            //取得 またas!でアンラップしているのでnilじゃない時のみ
            memoArray = ud.array(forKey: "memoArray") as![String]
            //reloadしてくれる
            memoTableView.reloadData()
        }
        if ud.array(forKey: "dateArray") != nil{
            //取得 またas!でアンラップしているのでnilじゃない時のみ
            dateArray = ud.array(forKey: "dateArray") as![String]
            //reloadしてくれる
            memoTableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

            if editingStyle == .delete {

                //resultArray内のindexPathのrow番目をremove（消去）する
                memoArray.remove(at: indexPath.row)
                dateArray.remove(at: indexPath.row)
                //再び
    
                ud.set(memoArray, forKey: "memoArray")
                ud.set(dateArray, forKey: "dateArray")
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
