//
//  AgreeView.swift
//  BebeBoilerPlate
//
//  Created by sei on 11/6/23.
//

import SwiftUI

struct AgreeView: View {
    private var isRequiredTermsAgreed: Bool {
        checkList.allSatisfy { !$0.isRequired || $0.currentAgreedStatus }
    }

    @State private var checkList = AgreeType.allCases

    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Title
            Spacer()
            Headline
            Spacer()
            threeAgreeSection
            Spacer()
                .frame(maxHeight: 50)
            doneAndNextButton
        }
    }

    var Title: some View {
        Text(TextLiterals.pleaseAgreeTitle)
            .font(.title)
            .bold()
    }

    var Headline: some View {
        Text(TextLiterals.pleaseAgreeHeadline)
            .font(.headline)
            .fontWeight(.semibold)
    }

    var threeAgreeSection: some View {
        let count = AgreeType.allCases.count
        return ForEach(0..<count) { index in
            AgreedButton(
                type: $checkList[index]
            )
        }
    }


    var doneAndNextButton: some View {
        let isDisabled = !(isRequiredTermsAgreed)
        return Button {
            print("동의하기")
        } label: {
            Text("동의하기")
                .font(.subheadline).fontWeight(.semibold)
                .foregroundStyle(isDisabled ? Color.gray : .white)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(isDisabled ? Color.secondary : Color.blue)
        }
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .disabled(isDisabled)
    }
}

extension AgreeView {
    struct AgreedButton: View {
        @Binding var type: AgreeType

        var body: some View {
            Button {
                type.toggle()
            } label: {
                Text(type.description)
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            .foregroundStyle(type.currentAgreedStatus ?  Color.accentColor : Color.gray)
        }
    }


    enum AgreeType: CaseIterable, Hashable, Identifiable {
        static var allCases: [AgreeType] = [.serviceUse(agreed: true), .personalData(agreed: true), .marketing(agreed: true)]

        case serviceUse(agreed: Bool)
        case personalData(agreed: Bool)
        case marketing(agreed: Bool)

        var id: Self { self }

        var isRequired: Bool {
            switch self {
            case .serviceUse, .personalData: true
            case .marketing: false
            }
        }

        var currentAgreedStatus: Bool {
            switch self {
            case .marketing(let agreed), .serviceUse(let agreed), .personalData(let agreed):
                agreed
            }
        }

        mutating func toggle() {
            switch self {
            case .serviceUse(let agreed):
                self = .serviceUse(agreed: !agreed)
            case .personalData(let agreed):
                self = .personalData(agreed: !agreed)
            case .marketing(let agreed):
                self = .marketing(agreed: !agreed)
            }
        }

        var description: String {
            var optionalOrNot: String {
                if isRequired { TextLiterals.AgreeType.required }
                else { TextLiterals.AgreeType.optional }
            }
            return switch self {
            case .serviceUse:
                optionalOrNot + TextLiterals.AgreeType.serviceUseText
            case .personalData:
                optionalOrNot + TextLiterals.AgreeType.personalDataText
            case .marketing:
                optionalOrNot + TextLiterals.AgreeType.marketingText
            }
        }
    }
}

#Preview {
    AgreeView()
}
