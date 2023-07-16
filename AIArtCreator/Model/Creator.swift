//
//  Creator.swift
//  AIArtCreator
//
//  Created by Berkay Kuzu on 6.07.2023.
//

import UIKit

class Creator {
    
    var prompt: String?
    var resultImg: UIImage?
    var style: String?
    init(prompt: String? = nil, resultImg: UIImage? = nil, style: String? = nil) {
        self.prompt = prompt
        self.resultImg = resultImg
        self.style = style
    }
}
