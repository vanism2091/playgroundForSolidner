//
//  TextLiterals.swift
//  BebeBoilerPlate
//
//  Created by sei on 11/7/23.
//

import Foundation

enum TextLiterals {
    static let pleaseAgreeTitle =
    """
    서비스 이용약관에
    동의해주세요
    """

    static let pleaseAgreeHeadline =
    """
    솔리너의 원활한 사용을 위해
    아래의 정보 제공에 동의해주세요.
    """

    static let limitUnder10Characters = "최대 10자 이내로 입력할 수 있어요."
    
    // --- Agree ---
    enum AgreeType {
        static let required = "[필수] "
        static let optional = "[선택] "
        static let serviceUseText = "어찌구 저찌구 약관"
        static let personalDataText = "개인 정보 제 3자 동의"
        static let marketingText = "마케팅 수신 동의"
    }




}
