//
//  EquityListVC.swift
//  EquityLister
//
//  Created by Manjunath on 21/12/19.
//  Copyright © 2019 Accionlabs. All rights reserved.
//

import UIKit

class EquityListVC: RootViewController {
    var equityList = [EquityStock]()
    var assetInfo: Asset?
    var isSearchingLive = true

    @IBOutlet var homeTableView: UITableView!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var equityListBottomConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.

        var nsDictionary: NSDictionary?
        if let path = Bundle.main.path(forResource: "Environment", ofType: "plist") {
            nsDictionary = NSDictionary(contentsOfFile: path)
        }

        print(nsDictionary)
    }

    func handleResponseCallback(status _: Int, success _: Bool, json: [[String: AnyObject]]?) -> Bool {
        equityList.removeAll()
        if let jsonResponse = json {
            for dic in jsonResponse {
                let value = EquityStock(fromDictionary: dic as NSDictionary)
                equityList.append(value)
            }

            print("Response handled ==> \(jsonResponse)")
            homeTableView.reloadData()
        }
        return true
    }
}

extension EquityListVC: UITableViewDataSource, UITableViewDelegate {
    func scrollViewWillBeginDragging(_: UIScrollView) {
        view.endEditing(true)
    }

    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        if isSearchingLive {
            return 30
        }
        return 44
    }

    func numberOfSections(in _: UITableView) -> Int {
        if isSearchingLive {
            return equityList.count
        }
        return 9
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isSearchingLive {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EquityTableViewCell", for: indexPath) as! EquityTableViewCell
            cell.nameLabel.text = equityList[indexPath.section].name
            return cell
        } else {
            switch indexPath.section {
            case 0:
                let cell1 = tableView.dequeueReusableCell(withIdentifier: "AssetNameCell", for: indexPath) as! AssetNameCell
                cell1.nameLabel.text = assetInfo!.contractName
                return cell1
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "AssetsInfoCell", for: indexPath) as! AssetsInfoCell
                cell.keyLabel.text = assetInfo!.bidPriceKey
                cell.valueLabel.text = "\(assetInfo!.bidPrice!) \(assetInfo!.currency!)"
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "AssetsInfoCell", for: indexPath) as! AssetsInfoCell
                cell.keyLabel.text = assetInfo!.askPriceKey
                cell.valueLabel.text = "\(assetInfo!.askPrice!) \(assetInfo!.currency!)"
                return cell
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: "AssetsInfoCell", for: indexPath) as! AssetsInfoCell
                cell.keyLabel.text = assetInfo!.lowPriceKey
                cell.valueLabel.text = "\(assetInfo!.lowPrice!) \(assetInfo!.currency!)"
                return cell
            case 4:
                let cell = tableView.dequeueReusableCell(withIdentifier: "AssetsInfoCell", for: indexPath) as! AssetsInfoCell
                cell.keyLabel.text = assetInfo!.highPriceKey
                cell.valueLabel.text = "\(assetInfo!.highPrice!) \(assetInfo!.currency!)"
                return cell
            case 5:
                let cell = tableView.dequeueReusableCell(withIdentifier: "AssetsInfoCell", for: indexPath) as! AssetsInfoCell
                cell.keyLabel.text = assetInfo!.lastPriceKey
                cell.valueLabel.text = "\(assetInfo!.lastPrice!) \(assetInfo!.currency!)"
                return cell
            case 6:
                let cell = tableView.dequeueReusableCell(withIdentifier: "AssetsInfoCell", for: indexPath) as! AssetsInfoCell
                cell.keyLabel.text = assetInfo!.openPriceKey
                cell.valueLabel.text = "\(assetInfo!.openPrice!) \(assetInfo!.currency!)"
                return cell
            case 7:
                let cell = tableView.dequeueReusableCell(withIdentifier: "AssetsInfoCell", for: indexPath) as! AssetsInfoCell
                cell.keyLabel.text = assetInfo!.cashDividendKey
                cell.valueLabel.text = "\(assetInfo!.cashDividend!) \(assetInfo!.currency!)"
                return cell
            case 8:
                let cell = tableView.dequeueReusableCell(withIdentifier: "AssetsInfoCell", for: indexPath) as! AssetsInfoCell
                cell.keyLabel.text = assetInfo!.pricingDateKey
                cell.valueLabel.text = "\(assetInfo!.pricingDate!)"
                return cell
            default:
                let cell1 = tableView.dequeueReusableCell(withIdentifier: "AssetNameCell", for: indexPath) as! AssetNameCell
                cell1.nameLabel.text = assetInfo!.contractName
                return cell1
            }
        }
    }

    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isSearchingLive {
            view.endEditing(true)

            let eqID = equityList[indexPath.section].equityID!

            Api.getEquityDetail(equityID: eqID, completion: handleDictionaryResponseCallback)
        }
    }

    func handleDictionaryResponseCallback(status _: Int, success _: Bool, json: [String: Any]?) -> Bool {
        if let jsonResponse = json {
            assetInfo = Asset(fromDictionary: jsonResponse as NSDictionary)
            isSearchingLive = false
            homeTableView.reloadData()
        }
        return true
    }
}

extension EquityListVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn _: NSRange, replacementString string: String) -> Bool {
        let seacrh = "\(textField.text!)\(string)"
        Api.getEquityList(query: seacrh, completion: handleResponseCallback)
        return true
    }

    func textFieldDidBeginEditing(_: UITextField) {
        isSearchingLive = true
    }

    func textFieldDidEndEditing(_: UITextField) {}

    func textFieldShouldReturn(_: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
