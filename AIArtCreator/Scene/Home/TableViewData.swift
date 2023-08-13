//
//  TableViewData.swift
//  AIArtCreator
//
//  Created by Berkay Kuzu on 7.07.2023.
//

import UIKit

class TableViewData {
    
    static let shared = TableViewData()
    
    var tableViewDataImage: UIImage?
    var tableViewDataName: String?
    
    init(tableViewDataImage: UIImage = UIImage() , tableViewDataName: String = String()) {
        self.tableViewDataImage = tableViewDataImage
        self.tableViewDataName = tableViewDataName
    }
}


var tableViewDataArray = [
    TableViewData(tableViewDataImage: UIImage(named: "img_home")!, tableViewDataName: "Surrealist"),
    TableViewData(tableViewDataImage: UIImage(named: "img_home2")!, tableViewDataName: "Steampunk"),
    TableViewData(tableViewDataImage: UIImage(named: "img_home3")!, tableViewDataName: "Rick and Morty"),
    TableViewData(tableViewDataImage: UIImage(named: "img_home4")!, tableViewDataName: "Renaissance Painting"),
    TableViewData(tableViewDataImage: UIImage(named: "img_home5")!, tableViewDataName: "Portrait Photo"),
    TableViewData(tableViewDataImage: UIImage(named: "img_home6")!, tableViewDataName: "Pixelart"),
    TableViewData(tableViewDataImage: UIImage(named: "img_home7")!, tableViewDataName: "Pencil Drawing"),
    TableViewData(tableViewDataImage: UIImage(named: "img_home8")!, tableViewDataName: "Pastel"),
    TableViewData(tableViewDataImage: UIImage(named: "img_home9")!, tableViewDataName: "Oil Painting"),
    TableViewData(tableViewDataImage: UIImage(named: "img_home10")!, tableViewDataName: "Mystical"),
    TableViewData(tableViewDataImage: UIImage(named: "img_home11")!, tableViewDataName: "Macrorealistic"),
    TableViewData(tableViewDataImage: UIImage(named: "img_home12")!, tableViewDataName: "Lowpoly"),
    TableViewData(tableViewDataImage: UIImage(named: "img_home13")!, tableViewDataName: "Longshot"),
    TableViewData(tableViewDataImage: UIImage(named: "img_home14")!, tableViewDataName: "Gustavecourbet"),
    TableViewData(tableViewDataImage: UIImage(named: "img_home15")!, tableViewDataName: "Digital Painting"),
    TableViewData(tableViewDataImage: UIImage(named: "img_home16")!, tableViewDataName: "Cyberpunk"),
    TableViewData(tableViewDataImage: UIImage(named: "img_home17")!, tableViewDataName: "Cinematic"),
    TableViewData(tableViewDataImage: UIImage(named: "img_home18")!, tableViewDataName: "Anime"),
    TableViewData(tableViewDataImage: UIImage(named: "img_home19")!, tableViewDataName: "Animation"),
    TableViewData(tableViewDataImage: UIImage(named: "img_home20")!, tableViewDataName: "3D Render"),
    
]

var selectedTableViewData = TableViewData()
var getSelectedTableViewData = [TableViewData]()
