//
//  UserCell.swift
//  MvvmJson
//
//  Created by KULDEP KUMAR PRAJAPATI on 25/07/20.
//  Copyright © 2020 KULDEP KUMAR PRAJAPATI. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    
    @IBOutlet weak var lbStatus: UILabel!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbId: UILabel!
    var modelUser: UserModel?{
            didSet{
                userConfiguration()
            }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func userConfiguration(){
        let status = modelUser?.getstatusColor()
        lbStatus.text = status?.0
        backgroundColor = status?.1
        
        if let id = modelUser?.id {
            lbId.text = "\(id)"
        }else{
            lbId.text = "No ID"
        }
        lbTitle.text=modelUser?.title
    }
    
}
