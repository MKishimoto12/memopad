//
//  MemoCollectionViewController.swift
//  memopad
//
//  Created by 岸本迪之進 on 2023/05/31.
//

import UIKit

class MemoCollectionViewController: UIViewController, UICollectionViewDataSource {
    
    
    
    //コレクションビュー
    @IBOutlet var collectionView : UICollectionView!
    
    //ユーザーデフォルト
    var savedata : UserDefaults = UserDefaults.standard
    
    //タイトルの配列
    var titles: [String] = []
    
    //文字の配列
    var contents: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        //レイアウトの設定
        let configuration =  UICollectionLayoutListConfiguration(appearance:  .plain)
        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout.list(using: configuration)
        
        //savedataの取得
        savedata.register(defaults: ["titles": [], "contents": []])
        titles = savedata.object(forKey: "titles") as! [String]
        contents = savedata.object(forKey: "contents") as! [String]
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
        //titles.contで配列「titles」の要素の個数が出てくる
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(indexPath)
        //Storyboard上で用意されたセルを読み込む
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        //cellの中身（コンテンツ）を設定できる変数を用意する
        var contentConfiguration = UIListContentConfiguration.cell()
        //タイトルを設定する
        contentConfiguration.text = titles[indexPath.item]
        //サブタイトルを設定する
        contentConfiguration.secondaryText = contents[indexPath.item]
        //セルの設定を更新する
        cell.contentConfiguration = contentConfiguration
        //セルの設定を完了する
        return cell
    }
    
    

    /*
    // MARK: - Navigation

    
    }
    */

}
