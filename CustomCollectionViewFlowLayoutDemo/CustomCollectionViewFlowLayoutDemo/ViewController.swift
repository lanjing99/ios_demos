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
        return 20
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
        flowLayout.itemSize = CGSize.init(width: UIScreen.main.bounds.width/4, height: 68)
        flowLayout.minimumInteritemSpacing = 0
        collectionView.register(UINib.init(nibName: "TestCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: XYCollectionSupplementaryViewCellSeperator, withReuseIdentifier: XYCollectionSupplementaryViewCellSeperator)
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: XYCollectionSupplementaryViewLineSeperator, withReuseIdentifier: XYCollectionSupplementaryViewLineSeperator)
    }
}

extension ViewController: XYCollectionViewSeperatorDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: XYCollectionViewSeperatorFlowLayout, needSeperatorAt indexPath:IndexPath, of kind:String) -> Bool {
        if kind == XYCollectionSupplementaryViewCellSeperator {
            //第0列后面跟一个分隔符
            if indexPath.row % 4 != 3 {
                return true
            }else{
                return false
            }
        }else if kind == XYCollectionSupplementaryViewLineSeperator {
            let itemsCount = collectionView.dataSource!.collectionView(collectionView, numberOfItemsInSection: indexPath.section)
            
            if (indexPath.row % 2 == 0) && indexPath.row < itemsCount - 2 {
                return true
            }else{
                return false
            }
        }
        //不应该有其它的类型
        return false
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: XYCollectionViewSeperatorFlowLayout, seperatorAttributeWith formerItemAttribute: UICollectionViewLayoutAttributes?, of kind: String) -> UICollectionViewLayoutAttributes? {
        
        guard let formerAttribute = formerItemAttribute else {
            return nil
        }
        
        if kind == XYCollectionSupplementaryViewCellSeperator {
            let attributes = UICollectionViewLayoutAttributes(forSupplementaryViewOfKind: XYCollectionSupplementaryViewCellSeperator, with: formerAttribute.indexPath)
            let cellFrame = formerAttribute.frame
            let frame = CGRect.init(x: cellFrame.maxX, y: cellFrame.minY + 31/2, width: 0.5, height: cellFrame.height - 31)
            attributes.frame = frame
            return attributes
        }else if kind == XYCollectionSupplementaryViewLineSeperator {
            let attributes = UICollectionViewLayoutAttributes(forSupplementaryViewOfKind: XYCollectionSupplementaryViewLineSeperator, with: formerAttribute.indexPath)
            let cellFrame = formerAttribute.frame
            let frame = CGRect.init(x: cellFrame.minX, y: cellFrame.maxY - 0.5, width: 2 * cellFrame.width, height:0.5)
            attributes.frame = frame
            return attributes
        }
        //不应该有其它的类型
        return nil
    }
    
}


