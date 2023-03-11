/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation

struct Brewery : Hashable  {
    var name: String
//    var city: String
//    var updatedAt: Date
//    var createdAt: Date
//    var address2: String?
//    var websiteUrl: String?
//    var street: String
//    var countyProvince: String?
//    var id: String
//    var state: String
    var breweryType: String
//    var longitude: Double
//    var country: String
//    var postalCode: String
//    var latitude: Double
//    var phone: String
//    var address3: String?

}

//struct Json4Swift_Base : Codable {
//	let id : Int?
//	let name : String?
//	let brewery_type : String?
//	let street : String?
//	let city : String?
//	let state : String?
//	let postal_code : String?
//	let country : String?
//	let longitude : String?
//	let latitude : String?
//	let phone : String?
//	let website_url : String?
//	let updated_at : String?
//	let tag_list : [String]?
//
//	enum CodingKeys: String, CodingKey {
//
//		case id = "id"
//		case name = "name"
//		case brewery_type = "brewery_type"
//		case street = "street"
//		case city = "city"
//		case state = "state"
//		case postal_code = "postal_code"
//		case country = "country"
//		case longitude = "longitude"
//		case latitude = "latitude"
//		case phone = "phone"
//		case website_url = "website_url"
//		case updated_at = "updated_at"
//		case tag_list = "tag_list"
//	}
//
//	init(from decoder: Decoder) throws {
//		let values = try decoder.container(keyedBy: CodingKeys.self)
//		id = try values.decodeIfPresent(Int.self, forKey: .id)
//		name = try values.decodeIfPresent(String.self, forKey: .name)
//		brewery_type = try values.decodeIfPresent(String.self, forKey: .brewery_type)
//		street = try values.decodeIfPresent(String.self, forKey: .street)
//		city = try values.decodeIfPresent(String.self, forKey: .city)
//		state = try values.decodeIfPresent(String.self, forKey: .state)
//		postal_code = try values.decodeIfPresent(String.self, forKey: .postal_code)
//		country = try values.decodeIfPresent(String.self, forKey: .country)
//		longitude = try values.decodeIfPresent(String.self, forKey: .longitude)
//		latitude = try values.decodeIfPresent(String.self, forKey: .latitude)
//		phone = try values.decodeIfPresent(String.self, forKey: .phone)
//		website_url = try values.decodeIfPresent(String.self, forKey: .website_url)
//		updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
//		tag_list = try values.decodeIfPresent([String].self, forKey: .tag_list)
//	}
//
//}
