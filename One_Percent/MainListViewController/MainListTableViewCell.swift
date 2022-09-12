//
//  MainListTableViewCell.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/12.
//

import UIKit

class MainListTableViewCell: BaseTableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
 
        self.backgroundColor = .clear
    }
  
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureUI() {
        
    }
    
    override func setConstraints() {
        
        
    }
}
