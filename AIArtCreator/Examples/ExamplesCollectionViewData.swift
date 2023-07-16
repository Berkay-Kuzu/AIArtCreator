//
//  ExamplesCollectionViewData.swift
//  AIArtCreator
//
//  Created by Berkay Kuzu on 8.07.2023.
//

import UIKit

class ExamplesCollectionViewData {
    
    static let shared = ExamplesCollectionViewData()

    var examplesCollectionViewDataName: String?
    
    init(examplesCollectionViewDataName: String = String()) {
        self.examplesCollectionViewDataName = examplesCollectionViewDataName
    }
}


var collectionViewDataArray = [
    ExamplesCollectionViewData(examplesCollectionViewDataName: "Dog"),
    ExamplesCollectionViewData(examplesCollectionViewDataName: "Cat"),
    ExamplesCollectionViewData(examplesCollectionViewDataName: "Bird"),
    ExamplesCollectionViewData(examplesCollectionViewDataName: "Goose"),
    ExamplesCollectionViewData(examplesCollectionViewDataName: "Table"),
    ExamplesCollectionViewData(examplesCollectionViewDataName: "Warrior"),
    ExamplesCollectionViewData(examplesCollectionViewDataName: "Horse"),
    ExamplesCollectionViewData(examplesCollectionViewDataName: "Chair"),
    ExamplesCollectionViewData(examplesCollectionViewDataName: "Phone"),
    ExamplesCollectionViewData(examplesCollectionViewDataName: "Television"),
    ExamplesCollectionViewData(examplesCollectionViewDataName: "Car"),
    ExamplesCollectionViewData(examplesCollectionViewDataName: "Bicycle"),
    ExamplesCollectionViewData(examplesCollectionViewDataName: "Wallet"),
    ExamplesCollectionViewData(examplesCollectionViewDataName: "Key"),
    ExamplesCollectionViewData(examplesCollectionViewDataName: "Sunglasses"),
    ExamplesCollectionViewData(examplesCollectionViewDataName: "Hat"),
    ExamplesCollectionViewData(examplesCollectionViewDataName: "Shoes"),
    ExamplesCollectionViewData(examplesCollectionViewDataName: "Knife"),
    ExamplesCollectionViewData(examplesCollectionViewDataName: "Owl"),
    ExamplesCollectionViewData(examplesCollectionViewDataName: "Dolphin"),
    ExamplesCollectionViewData(examplesCollectionViewDataName: "Butterfly"),
    ExamplesCollectionViewData(examplesCollectionViewDataName: "Sheep"),
    ExamplesCollectionViewData(examplesCollectionViewDataName: "Butterfly"),
    ExamplesCollectionViewData(examplesCollectionViewDataName: "Bee"),
    ExamplesCollectionViewData(examplesCollectionViewDataName: "Octopus"),
    ExamplesCollectionViewData(examplesCollectionViewDataName: "Jellyfish"),
    ExamplesCollectionViewData(examplesCollectionViewDataName: "Shark"),
    ExamplesCollectionViewData(examplesCollectionViewDataName: "Penguin"),
    ExamplesCollectionViewData(examplesCollectionViewDataName: "Flamingo"),
    ExamplesCollectionViewData(examplesCollectionViewDataName: "Squirrel"),
    
]

var selectedCollectionViewData = ExamplesCollectionViewData()
var getelectedCollectionViewData = [ExamplesCollectionViewData]()
