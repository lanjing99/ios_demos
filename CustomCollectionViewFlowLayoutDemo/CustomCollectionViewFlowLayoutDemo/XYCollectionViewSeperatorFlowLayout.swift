//
//  XYCollectionViewSeperatorFlowLayout.swift
//  CustomCollectionViewFlowLayoutDemo
//
//  Created by 陈文经 on 12/6/16.
//  Copyright © 2016 陈文经. All rights reserved.
//

import UIKit

public let XYCollectionSupplementaryViewCellSeperator: String = "XYCollectionSupplementaryViewCellSeperator"
public let XYCollectionSupplementaryViewLineSeperator: String = "XYCollectionSupplementaryViewLineSeperator"

@objc(XYCollectionViewSeperatorDelegateFlowLayout)
protocol XYCollectionViewSeperatorDelegateFlowLayout: UICollectionViewDelegateFlowLayout {
//    optional public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    @objc optional func collectionView(_collectionView: UICollectionView, layout collectionViewLayout: XYCollectionViewSeperatorFlowLayout, needSeperatorAt indexPath:IndexPath, of kind:String) -> Bool
    @objc optional func collectionView(_collectionView: UICollectionView, layout collectionViewLayout: XYCollectionViewSeperatorFlowLayout, seperatorAttributeWith formerItemAttribute:UICollectionViewLayoutAttributes?, of kind:String) -> UICollectionViewLayoutAttributes?
}


class XYCollectionViewSeperatorFlowLayout: UICollectionViewFlowLayout {

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let itemAttributes = super.layoutAttributesForElements(in: rect) else{
            return nil
        }
        
        var result = Array<UICollectionViewLayoutAttributes>()
        result.append(contentsOf: itemAttributes)
        result.append(contentsOf: self.seperatorAttributes(fromItems: itemAttributes))

        return result
    }
    
    //所有分割线的attributes
    func seperatorAttributes(fromItems itemsAttributes:[UICollectionViewLayoutAttributes]?) -> [UICollectionViewLayoutAttributes]{
        var totalAttributes = [UICollectionViewLayoutAttributes]()
        if let cellSeperatorAttributes = self.cellSeperatorAttributes(fromItems: itemsAttributes) {
            totalAttributes.append(contentsOf: cellSeperatorAttributes)
        }
        
        if let lineSeperatorAttributes = self.lineSeperatorAttributes(fromItems: itemsAttributes){
            totalAttributes.append(contentsOf: lineSeperatorAttributes)
        }
        
        return totalAttributes
        
    }
    
    func cellSeperatorAttributes(fromItems attributes:[UICollectionViewLayoutAttributes]?) -> [UICollectionViewLayoutAttributes]?{
        return attributes?.filter{
            $0.representedElementCategory == .cell
            }.flatMap{
                let indexPath = $0.indexPath
                let attribute = self.layoutAttributesForCellSeperator(at: indexPath)
                return attribute
        }
    }
    
    //根据item的indexPath和attribute创建 cell之间的分割线
    func layoutAttributesForCellSeperator(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
        //同一行两个cell之间的分隔符
        if indexPath.row % 2 == 0 {
            let attributes = UICollectionViewLayoutAttributes(forSupplementaryViewOfKind: XYCollectionSupplementaryViewCellSeperator, with: indexPath)
            let cellAttributes = self.layoutAttributesForItem(at: indexPath)
            let cellFrame = cellAttributes!.frame
            let frame = CGRect.init(x: cellFrame.maxX, y: cellFrame.minY + 31/2, width: 0.5, height: cellFrame.height - 31)
            attributes.frame = frame
            return attributes
        }
        
        return nil;
    }
    
    
    func lineSeperatorAttributes(fromItems attributes:[UICollectionViewLayoutAttributes]?) -> [UICollectionViewLayoutAttributes]?{
        return attributes?.filter{
            $0.representedElementCategory == .cell
            }.flatMap{
                let indexPath = $0.indexPath
                let attribute = self.layoutAttributesForLineSeperator(at: indexPath)
                return attribute
        }
    }
    
    //根据item的indexPath和attribute创建 item行之间的分割线
    func layoutAttributesForLineSeperator(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let dataSource = self.collectionView?.dataSource else{
            return nil
        }
        
        //行之间的间隔线，最后一行不需要间隔线
        if indexPath.row < dataSource.collectionView(self.collectionView!, numberOfItemsInSection: indexPath.section) - 2 &&
            indexPath.row % 2 == 0 {
            let attributes = UICollectionViewLayoutAttributes(forSupplementaryViewOfKind: XYCollectionSupplementaryViewLineSeperator, with: indexPath)
            let cellAttributes = self.layoutAttributesForItem(at: indexPath)
            let cellFrame = cellAttributes!.frame
            let frame = CGRect.init(x: cellFrame.minX, y: cellFrame.maxY - 0.5, width: 2 * cellFrame.width, height:0.5)
            attributes.frame = frame
            return attributes
        }
        
        return nil;
    }
    
    override func layoutAttributesForSupplementaryView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        if elementKind == XYCollectionSupplementaryViewCellSeperator {
            return self.layoutAttributesForCellSeperator(at: indexPath)
        }else if elementKind == XYCollectionSupplementaryViewLineSeperator{
            return self.layoutAttributesForLineSeperator(at: indexPath)
        }else{
            return super.layoutAttributesForSupplementaryView(ofKind: elementKind, at: indexPath)
        }
        
    }
    
    
    
    
    
    
    
    
   
    
    
    
    
    
}






