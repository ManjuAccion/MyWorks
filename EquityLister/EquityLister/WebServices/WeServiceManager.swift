//
//  WeServiceManager.swift
//  EquityLister
//
//  Created by Manjunath on 21/12/19.
//  Copyright © 2019 Accionlabs. All rights reserved.
//

import Alamofire
import UIKit

let Api = WeServiceManager.shared

class WeServiceManager {
    let dateFormatter = DateFormatter()

    static let shared = WeServiceManager()
    fileprivate let basePath = ""
    let HOST_INDEX = 0

    var hosts = [
        "https://services.investo2o.com/assetmanager-ws/api",
        "",
    ]

    fileprivate init() {
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        sessionManager = SessionManager.default
    }

    var hostname: String {
        return hosts[0]
    }

    var sessionManager: SessionManager

    typealias ApiCompletionHandler = ((Int, Bool, [[String: AnyObject]]?) -> Bool) // statuscode, success, json -> bool whether ApiManager should continue to show error message

    typealias ApiDictionaryCompletionHandler = ((Int, Bool, [String: Any]?) -> Bool) // statuscode, success, json -> bool whether ApiManager should continue to show error message

    fileprivate func request(url: String, method: HTTPMethod, parameters: [String: Any]? = nil, shouldShowActivity _: Bool = true, useJsonEncoding _: Bool = true, completion: ApiCompletionHandler? = nil) {
        let url = url
        //        let parameters : [String : Any] = (parameters == nil) ? [String : Any]() : parameters!

        var urlEncoding: ParameterEncoding = URLEncoding.default
        var headersDict = [String: String]()

        var nsDictionary: NSDictionary?
        if let path = Bundle.main.path(forResource: "Environment", ofType: "plist") {
            nsDictionary = NSDictionary(contentsOfFile: path)
        }

        headersDict = nsDictionary!["Header"] as! [String: String]

        let dataRequest: DataRequest = sessionManager.request(url, method: method, parameters: parameters, encoding: urlEncoding, headers: headersDict)

        dataRequest.response { response in

            var handleCompletion = true
            var json: [[String: Any]]?
            if let data = response.data {
                do {
                    json = try JSONSerialization.jsonObject(with: data) as! [[String: Any]]
                } catch {}
            }

            if handleCompletion, completion != nil {
                completion!(200, true, json as [[String: AnyObject]]?)
            }
        }
    }

    func getEquityList(query: String, completion: ApiCompletionHandler? = nil) {
        let url = "\(hostname)/v1/assets/getassets?query=\(query)&Type=STK&filter=&isCustom=false&%20filter="

        request(url: url, method: .get, parameters: nil, completion: completion)

        return
    }

    fileprivate func requestForDictionary(url: String, method: HTTPMethod, parameters: [String: Any]? = nil, shouldShowActivity _: Bool = true, useJsonEncoding _: Bool = true, completion: ApiDictionaryCompletionHandler? = nil) {
        let url = url
        //        let parameters : [String : Any] = (parameters == nil) ? [String : Any]() : parameters!

        var urlEncoding: ParameterEncoding = URLEncoding.default
        var headersDict = [String: String]()

        var nsDictionary: NSDictionary?
        if let path = Bundle.main.path(forResource: "Environment", ofType: "plist") {
            nsDictionary = NSDictionary(contentsOfFile: path)
        }

        headersDict = nsDictionary!["Header"] as! [String: String]

        let dataRequest: DataRequest = sessionManager.request(url, method: method, parameters: parameters, encoding: urlEncoding, headers: headersDict)

        dataRequest.response { response in

            var handleCompletion = true
            var json: [String: Any]?
            if let data = response.data {
                do {
                    json = try JSONSerialization.jsonObject(with: data) as! [String: Any]
                } catch {}
            }

            if handleCompletion, completion != nil {
                completion!(200, true, json as [String: Any]?)
            }
        }
    }

    func getEquityDetail(equityID: String, completion: ApiDictionaryCompletionHandler? = nil) {
        let url = "\(hostname)/v3/getassetdetails"

        let parameters: [String: Any] = ["Type": "STK",
                                         "isCustom": false,
                                         "asset": equityID]

        requestForDictionary(url: url, method: .get, parameters: parameters, completion: completion)
    }
}
