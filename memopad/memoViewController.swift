//
//  memoViewController.swift
//  memopad
//
//  Created by 岸本迪之進 on 2023/05/24.
//

import UIKit

class memoViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var titletextfield : UITextField!//「タイトル」の部分のテキストフィールド
    @IBOutlet weak var contenttextview : UITextView!//「テキスト」の部分のテキストビュー

    var savedata : UserDefaults = UserDefaults.standard//（仮）セーブデータ
    
    //保存するデータを配列にする（タイトル）
    var titles : [String] = []
    //保存するデータを配列にする（テキスト）
    var contents : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //初期値の意味がわからないから初期値のパート一旦保留→理解！！
        savedata.register(defaults: ["titles":[], "contents":[] ] )
        
        
        //UserDefaultsからデータを引っ張ってきて配列に入れる
        titles = savedata.object(forKey: "titles") as! [String]
        contents = savedata.object(forKey: "contents") as! [String]
        
        
        
        
        //↓今のとこ保留
        //titletextfield.text = savedata.object(forKey: "title") as? String
        //↑（仮）セーブデータの中からタイトルのやつを取り出して「タイトル」に入れる
        //contenttextview.text = savedata.object(forKey: "content") as? String
        //↑（仮）セーブデータの中からテキストのやつを取り出して「テキスト」に入れる
        //↑今のとこ保留

            // Do any additional setup after loading the view.
        titletextfield.delegate = self
        
        //動作確認
        print(titles)
        print(contents)
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        //はじめの画面に戻るやつ
        
    }
    
    @IBAction func saveMemo(_ sender: Any){
        //↓今のとこ保留part2
        //savedata.set(titletextfield.text, forKey: "title")
        //savedata.set(contenttextview.text, forKey: "content")
        //↑今のtこ保留part2
        
        //UserDefaultsにデータを保存したい
        //STEP1 入力データを変数に格納
        let title = titletextfield.text!
        let content = contenttextview.text!
        //STEP2 変数(仮)を配列に入れる
        titles.append(title)
        contents.append(content)
        //STEP3 上記をUserdefaultsに追加
        savedata.set(titles, forKey: "titles")
        savedata.set(contents,forKey: "contents")
        
        //アラートを出す処理
        let alert: UIAlertController = UIAlertController(title: "保存", message: "保存が完了しました。", preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(title: "OK",
                          style: .default,
                          handler:{action in
                              self.navigationController?.popViewController(animated: true)
                              let vc = self.navigationController?.viewControllers.last as? MemoCollectionViewController
                              vc!.collectionView.reloadData()
                          })
        )
        present(alert,animated: true, completion: nil)
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
