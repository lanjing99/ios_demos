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
    
    @objc optional func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: XYCollectionViewSeperatorFlowLayout, needSeperatorAt indexPath:IndexPath, of kind:String) -> Bool
    @objc optional func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: XYCollectionViewSeperatorFlowLayout, seperatorAttributeWith formerItemAttribute:UICollectionViewLayoutAttributes?, of kind:String) -> UICollectionViewLayoutAttributes?
    
}

@objc(XYCollectionViewSeperatorFlowLayout)
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
        if let cellSeperatorAttributes = self.seperatorAttributes(fromItems: itemsAttributes, of:XYCollectionSupplementaryViewCellSeperator)  {
            totalAttributes.append(contentsOf: cellSeperatorAttributes)
        }
        
        if let lineSeperatorAttributes = self.seperatorAttributes(fromItems: itemsAttributes, of:XYCollectionSupplementaryViewLineSeperator){
            totalAttributes.append(contentsOf: lineSeperatorAttributes)
        }
        
        return totalAttributes
        
    }
    
    func seperatorAttributes(fromItems attributes:[UICollectionViewLayoutAttributes]?, of kind: String) -> [UICollectionViewLayoutAttributes]?{
        return attributes?.filter{
            $0.representedElementCategory == .cell
            }.flatMap{
                let indexPath = $0.indexPath
                let attribute = self.layoutAttributesForSeperator(at: indexPath, of: kind)
                return attribute
        }
    }
    
    //根据item的indexPath和attribute创建 cell之间的分割线
    func layoutAttributesForSeperator(at indexPath: IndexPath, of kind: String) -> UICollectionViewLayoutAttributes? {
        
        guard let delegate =  collectionView?.delegate as? XYCollectionViewSeperatorDelegateFlowLayout,
              let needSeperator = delegate.collectionView?(collectionView!, layout: self, needSeperatorAt: indexPath, of: kind),
            needSeperator == true else{
            return nil
        }
        
        let itemAttributes = self.layoutAttributesForItem(at: indexPath)
        
        guard let seperatorAttribute = delegate.collectionView?(collectionView!, layout: self, seperatorAttributeWith: itemAttributes, of: kind) else {
            return nil
        }
        
        return seperatorAttribute;
    }
    

    override func layoutAttributesForSupplementaryView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        if elementKind == XYCollectionSupplementaryViewCellSeperator || elementKind == XYCollectionSupplementaryViewLineSeperator{
            return self.layoutAttributesForSeperator(at: indexPath, of:elementKind)
        }else{
            return super.layoutAttributesForSupplementaryView(ofKind: elementKind, at: indexPath)
        }
        
    }
    
}






