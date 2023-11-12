//
//  NickNameInputView.swift
//  BebeBoilerPlate
//
//  Created by sei on 11/6/23.
//

import SwiftUI
import Combine

struct NickNameInputView: View {
    @State private var nickName = ""
    @StateObject private var viewModel = NickNameInputViewModel()
    @State private var shake: Bool = true
    @State private var hasProblem = false
    @State private var currentWarningType: InputWarning = .길이제한초과

    enum InputWarning {
        case 길이제한초과

        var description: String {
            switch self {
            case .길이제한초과:
                "닉네임은 최대 10자까지 입력이 가능해요."
            }
        }
    }

    var body: some View {
        VStack(alignment: .leading) {
            inputField
            warningText(of: currentWarningType)

        }
    }

    var inputField: some View {
        TextField(TextLiterals.limitUnder10Characters, text: $nickName)
            .onChange(of: nickName, { oldValue, newValue in
                print(newValue, nickName)
                if newValue.count > viewModel.characterLimit {
                    nickName = String(newValue.prefix(viewModel.characterLimit))
                    viewModel.needShake()
                    hasProblem = true
                } else if hasProblem && newValue.count < viewModel.characterLimit {
                    hasProblem = false
                }
            })
            .shakeAnimation($shake, sink: viewModel.shake)
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke()
            }
    }
    func warningText(of warningType: InputWarning) -> some View {
        Text(warningType.description)
            .opacity(hasProblem ? 1 : 0.5)
            .foregroundStyle(hasProblem ? Color.red : .blue)
    }
}


public struct ShakeEffect: GeometryEffect {
    public var amount: CGFloat = 10
    public var shakesPerUnit = 3
    public var animatableData: CGFloat

    public init(amount: CGFloat = 10, shakesPerUnit: Int = 3, animatableData: CGFloat) {
        self.amount = amount
        self.shakesPerUnit = shakesPerUnit
        self.animatableData = animatableData
    }

    public func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX: amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)), y: 0))
    }
}


extension View {
    public func shakeAnimation(_ shake: Binding<Bool>, sink: PassthroughSubject<Void, Never>) -> some View {
        modifier(ShakeEffect(animatableData: shake.wrappedValue ? 2 : 0))
            .animation(.default, value: shake.wrappedValue)
            .onReceive(sink) {
                print("????")
                shake.wrappedValue = true
                withAnimation(.default.delay(0.15)) { shake.wrappedValue = false }
            }
    }
}

class NickNameInputViewModel: ObservableObject {
    @Published var nickName: String = ""
    @Published var shake = PassthroughSubject<Void, Never>()
    let characterLimit = 10

    func needShake() {
        print(#function)
        shake.send()
    }
}


#Preview {
    NickNameInputView()
}
