//
//  BaseApiClient.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/31/21.
//

import Foundation
import Alamofire

class BaseApiClient {

    private let baseUrl = "https://localhost:5001"
    private let manager = ServerTrustManager(evaluators: ["localhost": DisabledTrustEvaluator()])
    private lazy var session = {
        Session(serverTrustManager: manager)
    } ()

    func executeAndReturn<T: Decodable>(
        path: String,
        method: HTTPMethod,
        resultType: T.Type,
        completionHandler: @escaping ((T) -> ())
    ) {
        let params: [String: String]? = nil
        let body: [String: String]? = nil

        executeAndReturn(path: path, method: method, parameters: params, body: body, resultType: resultType, completionHandler: completionHandler)
    }

    func executeAndReturn<P: Encodable, T: Decodable>(
        path: String,
        method: HTTPMethod,
        parameters: P? = nil,
        resultType: T.Type,
        completionHandler: @escaping ((T) -> ())
    ) {
        let body: [String: String]? = nil

        executeAndReturn(path: path, method: method, parameters: parameters, body: body, resultType: resultType, completionHandler: completionHandler)
    }

    func executeAndReturn<B: Encodable, T: Decodable>(
        path: String,
        method: HTTPMethod,
        body: B? = nil,
        resultType: T.Type,
        completionHandler: @escaping ((T) -> ())
    ) {
        let parameters: [String: String]? = nil

        executeAndReturn(path: path, method: method, parameters: parameters, body: body, resultType: resultType, completionHandler: completionHandler)
    }

    func executeAndReturn<P: Encodable, B: Encodable, T: Decodable>(
        path: String,
        method: HTTPMethod,
        parameters: P? = nil,
        body: B? = nil,
        resultType: T.Type,
        completionHandler: @escaping ((T) -> ())
    ) {
        buildRequest(path: path, method: method, parameters: parameters, body: body)
            .responseJSON { [weak self] response in
                switch(response.result) {
                case .success( _):
                    print("DEBBUG: SUCESS \(path)")
                case .failure(let error):
                    print("DEBBUG: error \(error.localizedDescription) on \(path)")
                }
                
                guard let data = self?.parse(data: response.data, resultType: resultType) else {
                    print("DEBBUG: error failed to parse on \(path)")
                    return
                }

                completionHandler(data)
            }
    }

    func execute(
        path: String,
        method: HTTPMethod
    ) {
        let params: [String: String]? = nil
        let body: [String: String]? = nil

        execute(path: path, method: method, parameters: params, body: body)
    }

    func execute<P: Encodable>(
        path: String,
        method: HTTPMethod,
        parameters: P? = nil
    ) {
        let body: [String: String]? = nil

        execute(path: path, method: method, parameters: parameters, body: body)
    }

    func execute<B: Encodable>(
        path: String,
        method: HTTPMethod,
        body: B? = nil
    ) {
        let parameters: [String: String]? = nil

        execute(path: path, method: method, parameters: parameters, body: body)
    }

    func execute<P: Encodable, B: Encodable>(
        path: String,
        method: HTTPMethod,
        parameters: P? = nil,
        body: B? = nil
    ) {
        buildRequest(path: path, method: method, parameters: parameters, body: body)
            .response { [weak self] response in
                switch(response.result) {
                case .success( _):
                    print("DEBBUG: SUCESS \(path)")
                case .failure(let error):
                    print("DEBBUG: error \(error.localizedDescription) on \(path)")
                }
            }
    }

    private func buildRequest<P: Encodable, B: Encodable>(
        path: String,
        method: HTTPMethod,
        parameters: P? = nil,
        body: B? = nil
    ) -> DataRequest {
        let url = baseUrl + path

        let encoder: ParameterEncoder
        if body != nil {
            encoder = JSONParameterEncoder.default
            return session.request(url, method: method, parameters: body, encoder: encoder)
        } else {
            encoder = URLEncodedFormParameterEncoder(destination: .queryString)
            return session.request(url, method: method, parameters: parameters, encoder: encoder)
        }
    }

    private func parse<T: Decodable>(data: Data?, resultType: T.Type) -> T? {
        guard let data = data else {
            return nil
        }
        do {
            let dataString = String(decoding: data, as: UTF8.self)
            print("DEBUG: json response \n \(dataString)")
            return try JSONDecoder().decode(resultType, from: data)
        } catch {
            return nil
        }
    }

}
