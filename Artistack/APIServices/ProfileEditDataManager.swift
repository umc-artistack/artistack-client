    //
    //  ProfileDataManager.swift
    //  Artistack
    //
//  Created by 유지민 on 2022/08/10.
//

import Alamofire
import Foundation

class ProfileEditDataManager {
    func profileEditDataManager(_ parameter: ProfileEditInput) {
        // 프로필화면 수정
        AF.request("https://dev.artistack.shop/users/me",
                   method: .patch,
                   parameters: parameter,
                   encoder: JSONParameterEncoder.default,
                   headers: Const.header,
                   interceptor: Const.myAuthencitationInterceptor).validate().responseDecodable(of: ProfileEditModel.self) { response in
            switch response.result {
                case .success(let result):
                    print("프로필 화면 수정 성공")
                    debugPrint(response)
                case .failure(let error):
                    print("프로필 화면 수정 실패")
//                    print(error.localizedDescription)
                    debugPrint(response)
            }
        }
    }
}
