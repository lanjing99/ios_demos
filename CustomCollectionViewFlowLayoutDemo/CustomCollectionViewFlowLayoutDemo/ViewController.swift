//
//  ViewController.swift
//  CustomCollectionViewFlowLayoutDemo
//
//  Created by 陈文经 on 12/6/16.
//  Copyright © 2016 陈文经. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configueCollectionView()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kind, for: indexPath)
        view.backgroundColor = UIColor.red
        return view
    }
}

//MARK: for collectionView
extension ViewController{
    func configueCollectionView() {
        flowLayout.itemSize = CGSize.init(width: UIScreen.main.bounds.width/2, height: 68)
        flowLayout.minimumInteritemSpacing = 0
        collectionView.register(UINib.init(nibName: "TestCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: XYCollectionSupplementaryViewCellSeperator, withReuseIdentifier: XYCollectionSupplementaryViewCellSeperator)
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: XYCollectionSupplementaryViewLineSeperator, withReuseIdentifier: XYCollectionSupplementaryViewLineSeperator)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
}


