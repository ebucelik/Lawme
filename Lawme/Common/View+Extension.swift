//
//  View+Extension.swift
//  Lawme
//
//  Created by Ing. Ebu Celik on 26.04.22.
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder
    func SpaceDivider(height: CGFloat = 30, _ spaceDirection: Direction = .all) -> some View {
        VStack {
            switch spaceDirection {
            case .top:
                Spacer()
                    .frame(height: height)

                Divider()
            case .bottom:
                Divider()

                Spacer()
                    .frame(height: height)

            case .all:
                Spacer()
                    .frame(height: height)

                Divider()

                Spacer()
                    .frame(height: height)

            case .none:
                Spacer()
                    .frame(height: height)
            }
        }
    }
}
