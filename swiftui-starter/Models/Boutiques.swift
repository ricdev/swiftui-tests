//
//  Boutiques.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 3/18/22.
//

import Foundation

struct Boutiques {
    
    enum BoutiqueType: String, Decodable {
        case articleCard = "article_card"
        case briefArticleCard = "brief_article_card"
    }
    
    let type: BoutiqueType
    let content: BoutiqueContent
}

extension Boutiques: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case content = "content"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        type = try container.decode(BoutiqueType.self, forKey: .type)
        content = try container.decode(BoutiqueContent.self, forKey: .content)
    }
}

struct BoutiqueContent {
    
    enum BoutiqueContentType: String, Decodable {
        case immersive = "immersive"
    }
    
    let id: String
    let slug: String
    let eyebrow: String
    let title: String
    let type: BoutiqueContentType
    let featuredAsset: String
    let timestamp: String
    let dek: String
//    let note: BoutiqueContentNote?
}

extension BoutiqueContent: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case id
        case slug
        case type
        case eyebrow
        case title
        case featuredAsset = "featured_asset"
        case timestamp
        case dek
//        case note
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        slug = try container.decode(String.self, forKey: .slug)
        type = try container.decode(BoutiqueContentType.self, forKey: .type)
        eyebrow = try container.decode(String.self, forKey: .eyebrow)
        title = try container.decode(String.self, forKey: .title)
        featuredAsset = try container.decode(String.self, forKey: .featuredAsset)
        timestamp = try container.decode(String.self, forKey: .timestamp)
        dek = try container.decode(String.self, forKey: .dek)
//        note = try container.decode(BoutiqueContentNote.self, forKey: .note)
    }
}

struct BoutiqueContentNote {

//    let author: BoutiqueContentNoteAuthor
    let content: String
}

extension BoutiqueContentNote: Decodable {
    
    enum CodingKeys: String, CodingKey {
//        case author = "author"
        case content = "content"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

//        author = try container.decode(BoutiqueContentNoteAuthor.self, forKey: .author)
        content = try container.decode(String.self, forKey: .content)

    }
}

struct BoutiqueContentNoteAuthor {

    let firstName: String
    let lastName: String
    let jobTitle: String
}

extension BoutiqueContentNoteAuthor: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case jobTitle = "job_title"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        firstName = try container.decode(String.self, forKey: .firstName)
        lastName = try container.decode(String.self, forKey: .lastName)
        jobTitle = try container.decode(String.self, forKey: .jobTitle)
        
    }
}

struct BoutiquesApiResponseDTO {
    let items: [Boutiques]
}

extension BoutiquesApiResponseDTO: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case items = "items"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        items = try container.decode([Boutiques].self, forKey: .items)
    }
}
