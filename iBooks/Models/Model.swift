import Foundation

// MARK: - Welcome
class Welcome: Codable {
    let items: [Item]

    init(items: [Item]) {
        self.items = items
    }
}

// MARK: - Item
class Item: Codable {
    let id, etag: String
    let selfLink: String
    let volumeInfo: VolumeInfo
    let saleInfo: SaleInfo
    let accessInfo: AccessInfo
    let searchInfo: SearchInfo?

    init(id: String, etag: String, selfLink: String, volumeInfo: VolumeInfo, saleInfo: SaleInfo, accessInfo: AccessInfo, searchInfo: SearchInfo?) {
        self.id = id
        self.etag = etag
        self.selfLink = selfLink
        self.volumeInfo = volumeInfo
        self.saleInfo = saleInfo
        self.accessInfo = accessInfo
        self.searchInfo = searchInfo
    }
}

// MARK: - AccessInfo
class AccessInfo: Codable {
    let country: Country
    let viewability: Viewability
    let embeddable, publicDomain: Bool
    let textToSpeechPermission: TextToSpeechPermission
    let epub, pdf: Epub
    let webReaderLink: String
    let accessViewStatus: AccessViewStatus
    let quoteSharingAllowed: Bool

    init(country: Country, viewability: Viewability, embeddable: Bool, publicDomain: Bool, textToSpeechPermission: TextToSpeechPermission, epub: Epub, pdf: Epub, webReaderLink: String, accessViewStatus: AccessViewStatus, quoteSharingAllowed: Bool) {
        self.country = country
        self.viewability = viewability
        self.embeddable = embeddable
        self.publicDomain = publicDomain
        self.textToSpeechPermission = textToSpeechPermission
        self.epub = epub
        self.pdf = pdf
        self.webReaderLink = webReaderLink
        self.accessViewStatus = accessViewStatus
        self.quoteSharingAllowed = quoteSharingAllowed
    }
}

enum AccessViewStatus: String, Codable {
    case none = "NONE"
    case sample = "SAMPLE"
}

enum Country: String, Codable {
    case pe = "PE"
}

// MARK: - Epub
class Epub: Codable {
    let isAvailable: Bool
    let acsTokenLink: String?

    init(isAvailable: Bool, acsTokenLink: String?) {
        self.isAvailable = isAvailable
        self.acsTokenLink = acsTokenLink
    }
}

enum TextToSpeechPermission: String, Codable {
    case allowed = "ALLOWED"
    case allowedForAccessibility = "ALLOWED_FOR_ACCESSIBILITY"
}

enum Viewability: String, Codable {
    case noPages = "NO_PAGES"
    case partial = "PARTIAL"
}

// MARK: - SaleInfo
class SaleInfo: Codable {
    let country: Country
    let saleability: Saleability
    let isEbook: Bool
    let listPrice, retailPrice: SaleInfoListPrice?
    let buyLink: String?
    let offers: [Offer]?

    init(country: Country, saleability: Saleability, isEbook: Bool, listPrice: SaleInfoListPrice?, retailPrice: SaleInfoListPrice?, buyLink: String?, offers: [Offer]?) {
        self.country = country
        self.saleability = saleability
        self.isEbook = isEbook
        self.listPrice = listPrice
        self.retailPrice = retailPrice
        self.buyLink = buyLink
        self.offers = offers
    }
}

// MARK: - SaleInfoListPrice
class SaleInfoListPrice: Codable {
    let amount: Double
    let currencyCode: String

    init(amount: Double, currencyCode: String) {
        self.amount = amount
        self.currencyCode = currencyCode
    }
}

// MARK: - Offer
class Offer: Codable {
    let finskyOfferType: Int
    let listPrice, retailPrice: OfferListPrice

    init(finskyOfferType: Int, listPrice: OfferListPrice, retailPrice: OfferListPrice) {
        self.finskyOfferType = finskyOfferType
        self.listPrice = listPrice
        self.retailPrice = retailPrice
    }
}

// MARK: - OfferListPrice
class OfferListPrice: Codable {
    let amountInMicros: Int
    let currencyCode: String

    init(amountInMicros: Int, currencyCode: String) {
        self.amountInMicros = amountInMicros
        self.currencyCode = currencyCode
    }
}

enum Saleability: String, Codable {
    case forSale = "FOR_SALE"
    case notForSale = "NOT_FOR_SALE"
}

// MARK: - SearchInfo
class SearchInfo: Codable {
    let textSnippet: String

    init(textSnippet: String) {
        self.textSnippet = textSnippet
    }
}

// MARK: - VolumeInfo
class VolumeInfo: Codable {
    let title: String
    let publisher: String?
    let publishedDate: String
    let description: String?
    let industryIdentifiers: [IndustryIdentifier]
    let readingModes: ReadingModes
    let pageCount: Int
    let printType: PrintType
    let categories: [String]?
    let averageRating: Double?
    let ratingsCount: Int?
    let maturityRating: MaturityRating
    let allowAnonLogging: Bool
    let contentVersion: String
    let panelizationSummary: PanelizationSummary?
    let comicsContent: Bool?
    let imageLinks: ImageLinks?
    let language: Language
    let previewLink: String
    let infoLink: String
    let canonicalVolumeLink: String
    let subtitle: String?
    let authors: [String]?

    enum CodingKeys: String, CodingKey {
        case title, publisher, publishedDate
        case description
        case industryIdentifiers, readingModes, pageCount, printType, categories, averageRating, ratingsCount, maturityRating, allowAnonLogging, contentVersion, panelizationSummary, comicsContent, imageLinks, language, previewLink, infoLink, canonicalVolumeLink, subtitle, authors
    }

    init(title: String, publisher: String?, publishedDate: String, description: String?, industryIdentifiers: [IndustryIdentifier], readingModes: ReadingModes, pageCount: Int, printType: PrintType, categories: [String]?, averageRating: Double?, ratingsCount: Int?, maturityRating: MaturityRating, allowAnonLogging: Bool, contentVersion: String, panelizationSummary: PanelizationSummary?, comicsContent: Bool?, imageLinks: ImageLinks?, language: Language, previewLink: String, infoLink: String, canonicalVolumeLink: String, subtitle: String?, authors: [String]?) {
        self.title = title
        self.publisher = publisher
        self.publishedDate = publishedDate
        self.description = description
        self.industryIdentifiers = industryIdentifiers
        self.readingModes = readingModes
        self.pageCount = pageCount
        self.printType = printType
        self.categories = categories
        self.averageRating = averageRating
        self.ratingsCount = ratingsCount
        self.maturityRating = maturityRating
        self.allowAnonLogging = allowAnonLogging
        self.contentVersion = contentVersion
        self.panelizationSummary = panelizationSummary
        self.comicsContent = comicsContent
        self.imageLinks = imageLinks
        self.language = language
        self.previewLink = previewLink
        self.infoLink = infoLink
        self.canonicalVolumeLink = canonicalVolumeLink
        self.subtitle = subtitle
        self.authors = authors
    }
}

// MARK: - ImageLinks
class ImageLinks: Codable {
    let smallThumbnail, thumbnail: String

    init(smallThumbnail: String, thumbnail: String) {
        self.smallThumbnail = smallThumbnail
        self.thumbnail = thumbnail
    }
}

// MARK: - IndustryIdentifier
class IndustryIdentifier: Codable {
    let type: TypeEnum
    let identifier: String

    init(type: TypeEnum, identifier: String) {
        self.type = type
        self.identifier = identifier
    }
}

enum TypeEnum: String, Codable {
    case isbn10 = "ISBN_10"
    case isbn13 = "ISBN_13"
}

enum Language: String, Codable {
    case en = "en"
    case es = "es"
}

enum MaturityRating: String, Codable {
    case notMature = "NOT_MATURE"
}

// MARK: - PanelizationSummary
class PanelizationSummary: Codable {
    let containsEpubBubbles, containsImageBubbles: Bool

    init(containsEpubBubbles: Bool, containsImageBubbles: Bool) {
        self.containsEpubBubbles = containsEpubBubbles
        self.containsImageBubbles = containsImageBubbles
    }
}

enum PrintType: String, Codable {
    case book = "BOOK"
}

// MARK: - ReadingModes
class ReadingModes: Codable {
    let text, image: Bool

    init(text: Bool, image: Bool) {
        self.text = text
        self.image = image
    }
}
