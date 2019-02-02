//
//  SheetyColorsViewFactoryTests.swift
//  SheetyColors_Tests
//
//  Created by Christoph Wendt on 25.03.19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Nimble
import Quick
@testable import SheetyColors

class SheetyColorsViewFactoryTests: QuickSpec {
    override func spec() {
        describe("The SheetyColorsViewFactory") {
            context("when calling create with a config of type .rgb") {
                var testConfig: SheetyColorsConfigProtocol!
                var view: SheetyColorsView!

                beforeEach {
                    testConfig = SheetyColorsConfigMock(alphaEnabled: true, initialColor: .red, hapticFeedbackEnabled: true, title: "", type: .rgb)
                    view = SheetyColorsViewFactory.createView(withConfig: testConfig)
                }

                it("returns a SheetyColorsView with RGB components") {
                    expect(view.viewModel).to(beAnInstanceOf(RGBViewModel.self))

                    let viewModel = view.viewModel as! RGBViewModel
                    expect(viewModel.isAlphaEnabled).to(equal(testConfig.alphaEnabled))
                    expect(viewModel.colorModel).to(equal(testConfig.initialColor.rgbaColor))
                }
            }
        }
    }
}
