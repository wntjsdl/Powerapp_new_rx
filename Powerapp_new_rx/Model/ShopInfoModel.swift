//
//  Datas.swift
//  wkWebView
//
//  Created by KJS on 2021/09/03.
//

struct ShopInfoModel: Codable {
    let result: Bool
    let msg: String
    let type: String
    let data: DetailData
}

struct DetailData: Codable {
//    let alerton_day: Int
    let alerton_day: String
    let ip: String?
    let ad_menu_path: String?
    let use_ad_menu_btn: Bool?
    let use_intro_image: [String]?
    let adult_type: String
    let alerton_couponnum: String
    let alerton_page_url: String
    let alerton_time: Int
    let android_authcode: String
    let android_version: String
    let app_icon_click: String
    let app_noti_click: String
    let auth_type: String
    let back_path: String
    let basket_path: String
    let bottom_display: String
    let category_path: String
    let delivery_path: String
    let enddate: String
    let folder_color: String
    let folder_custom_menu_btn: [FolderCustomMenuBtn]
    let folder_opacity: String
    let folder_rending: String
    let folder_type: FolderType
    let folder_yn: String
    let forward_path: String
    let free_shop: Bool
    let home_path: String
    let intro_android: String
    let intro_ios: String
    let invitation_benefit: String
    let invite_path: String
    let ios_version: String
    let is_invitation: Bool
    let is_join: Bool
    let kakao_js_key: String
    let menu_color: String
    let menu_path: String
    let menu_user_info: String
    let mypage_path: String
    let password_rule: String
    let popup_image: String
    let popup_link: String
    let push_agree: String
    let push_benefit: String
    let push_color: String
    let push_path: String
    let push_receive_day: String
    let reeket_ad: String
    let refresh_path: String
    let review_path: String
    let scrap_path: String
    let server: String
    let shop_category: String
    let shopname: String
    let slide_T_info: SlideTInfo
    let slide_color: String
    let slide_type: String
    let sns_facebook: String
    let sns_kakao: String
    let sns_naver: String
    let update_date: String
    let use_alerton: String
    let use_back_btn: Bool
    let use_barcode: String
    let use_basket_btn: Bool
    let use_category_btn: Bool
    let use_custom_menu_1_btn: Bool
    let use_custom_menu_2_btn: Bool
    let use_custom_menu_3_btn: Bool
    let use_delivery_btn: Bool
    let use_forward_btn: Bool
    let use_home_btn: Bool
    let use_intro_effect: String
    let use_intro_time: String
    let use_invitation: String
    let use_invite_btn: Bool
    let use_join: Bool
    let use_keyword: Bool
    let use_menu_btn: Bool
    let use_mypage_btn: Bool
    let use_offline_push: Bool
    let use_popup: String
    let use_push: String
    let use_push_btn: Bool
    let use_refresh_btn: Bool
    let use_review_btn: Bool
    let use_scrap_btn: Bool
    let use_share_fb: Bool
    let use_share_ka: Bool
    let use_share_ks: Bool
    let use_share_tw: Bool
    let use_simple_join: String
    let use_simple_review: String
}

struct FolderCustomMenuBtn: Codable {
    let custom_img: String
    let custom_link: String
    let custom_name: String
    let custom_rank: Int
    let custom_use: Bool
}

struct FolderType: Codable {
    let type: String
    let url_close: String
    let url_open: String
}

struct SlideTInfo: Codable {
    let align: String
    let color: String
}

extension Encodable {
    func hasKey(for path: String) -> Bool {
        return Mirror(reflecting: self).children.contains { $0.label == path }
    }
    func value(for path: String) -> Any? {
        return Mirror(reflecting: self).children.first { $0.label == path }?.value
    }
}
