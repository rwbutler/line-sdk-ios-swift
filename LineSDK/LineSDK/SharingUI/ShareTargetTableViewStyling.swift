//
//  ShareTargetTableViewStyling.swift
//
//  Copyright (c) 2016-present, LINE Corporation. All rights reserved.
//
//  You are hereby granted a non-exclusive, worldwide, royalty-free license to use,
//  copy and distribute this software in source code or binary form for use
//  in connection with the web services and APIs provided by LINE Corporation.
//
//  As with any software that integrates with the LINE Corporation platform, your use of this software
//  is subject to the LINE Developers Agreement [http://terms2.line.me/LINE_Developers_Agreement].
//  This copyright notice shall be included in all copies or substantial portions of the software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
//  INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
//  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
//  DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

import UIKit

enum ShareTargetTableViewDesign {
    static let separatorColor = UIColor(hex6: 0xE6E7EA)
}

protocol ShareTargetTableViewStyling {
    var tableView: UITableView! { get }
    func setupTableViewStyle()
}

extension ShareTargetTableViewStyling {
    func setupTableViewStyle() {
        tableView.register(
            ShareTargetSelectingTableCell.self,
            forCellReuseIdentifier: ShareTargetSelectingTableCell.reuseIdentifier)
        tableView.rowHeight = ShareTargetSelectingTableCell.Design.height
        tableView.tableFooterView = UIView(frame: .init(x: 0, y: 0, width: tableView.frame.width, height: 60))
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorColor = ShareTargetTableViewDesign.separatorColor
    }
}

extension ShareTargetTableViewStyling where Self: UIViewController {
    func popSelectingLimitAlert(max: Int) {
        let message = String(format: Localization.string("chat.multi.fwd.confirm"), max)
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(.init(title: Localization.string("common.ok"), style: .default))
        present(alert, animated: true)
    }
}
