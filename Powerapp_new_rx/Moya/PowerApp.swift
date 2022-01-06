//
//  PowerAppInfo.swift
//  Powerapp_new_rx
//
//  Created by KJS on 2022/01/06.
//

import Foundation
import Moya

enum PowerApp {
    case getShopInfo(admin_id: String, type: String, user_id: String)
}

extension PowerApp: TargetType {
    var baseURL: URL { URL(string: "https://www.cocenstore.com")!}
    var path: String {
        switch self {
        case .getShopInfo(_, _, _):
            return "/list/API/powerapp_info.html"
        }
    }
    var method: Moya.Method {
        switch self {
        case .getShopInfo:
            return .post
        }
    }
    var task: Task {
        switch self {
        case let .getShopInfo(admin_id, temp_type, user_id):
            return .requestParameters(parameters: ["admin_id" : admin_id, "type": temp_type, "user_id": user_id], encoding: URLEncoding.queryString)
        }
    }
    var sampleData: Data {
        switch self {
        case .getShopInfo(let admin_id, let type, let user_id):
            return "{\"admin_id\": \"\(admin_id)\", \"type\": \"\(type)\", \"user_id\": \"\(user_id)\"}".utf8Encoded
        }
    }
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data { Data(self.utf8) }
}
