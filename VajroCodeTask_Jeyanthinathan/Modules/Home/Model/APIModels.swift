//
//  APIModels.swift
//  VajroCodeTask_Jeyanthinathan
//
//  Created by AMBINO4526 on 06/08/22.
//

import Foundation

struct DataResponse: Codable {
    let articles: [Article]?
}

struct Article: Codable {
    let title: String?
    let bodyHTML: String?
    let summaryHTML: String?
    let image: Image?

    enum CodingKeys: String, CodingKey {
        case title
        case bodyHTML = "body_html"
        case summaryHTML = "summary_html"
        case image
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String.self, forKey: .title)
        bodyHTML = try values.decode(String.self, forKey: .bodyHTML)
        summaryHTML = try values.decode(String.self, forKey: .summaryHTML)
        image = try values.decode(Image.self, forKey: .image)
    }

}

struct Image: Codable {
    let width, height: Double?
    let src: String?

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        width = try values.decode(Double.self, forKey: .width)
        height = try values.decode(Double.self, forKey: .height)
        src = try values.decode(String.self, forKey: .src)
    }
}
