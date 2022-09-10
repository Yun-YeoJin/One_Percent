//
//  ReusableProtocol.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/10.
//

import UIKit

protocol ReusableProtocol {
    static var reusableIdentifier: String { get }
}

extension UIViewController: ReusableProtocol {
    static var reusableIdentifier: String {
        String(describing: self)
    }
}

extension UITableViewCell: ReusableProtocol {
    static var reusableIdentifier: String {
        String(describing: self)
    }
}

extension UICollectionViewCell: ReusableProtocol {
    static var reusableIdentifier: String {
        String(describing: self)
    }
}
