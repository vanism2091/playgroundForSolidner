//
//  Enum.swift
//  BebeBoilerPlate
//
//  Created by sei on 11/7/23.
//

import Foundation
import SwiftUI

/*
 과제 1) 다음 상황에 맞는 enum을 정의해보세요 (이름은 Direction)
- 여러분은 SwiftUI를 사용해서 방향을 선택할 수 있는 Picker를 만들고 있어요
- 방향은 [동], [서], [남], [북] 네가지 입니다.
- 모든 방향의 값을 가지고 ForEach문을 통해 피커 UI를 구현하고 싶습니다.
- (+알파) ForEach문이 어떤 모습일지도 표현해보세요
 */

enum Direction: String, Identifiable, CaseIterable {
    case 동, 서, 남, 북
    var id: Self { self }
}

struct DirectionPickerView: View {
    @State private var currentDirection = Direction.동
    var body: some View {
        Picker("방향", selection: $currentDirection) {
            ForEach(Direction.allCases) { direction in
                Text(direction.rawValue).tag(direction)
            }
        }
    }
}

//#Preview {
//    DirectionPickerView()
//}

/*
 과제 2) 다음 상황에 맞는 enum을 정의해보세요 (이름은 PostType)
- 여러분은 앱에서 게시물의 상태를 다뤄야 합니다.
- 상태의 종류는 [로딩 중], [글], [사진], [영상], [에러] 입니다.
- 글은 String, 사진은 Data, 영상은 URL, 에러는 Error 타입으로 실제 데이터가 구성됩니다.
- (+알파) 이 게시물이 보여지는 카드에서 switch 문이 어떤 모습일지도 표현 해보세요
 */

enum PostType {
    case loding
    case text(String), image(Data), video(URL)
    case error(Error)
}

struct PostView: View {
    let post: PostType

    var body: some View {
        VStack {
            switch post {
            case .loding:
                ProgressView()
            case .text(let content):
                Text(content)
            case .image(let imageData):
                Image(uiImage: UIImage(data: imageData)!)
            case .video(let videoURL):
                Text(videoURL.description)
            case .error(let error):
                Text(error.localizedDescription)
            }
        }
    }
}

#Preview {
    PostView(post: .text("haha"))
}

