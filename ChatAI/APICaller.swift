//
//  APICaller.swift
//  ChatAI
//
//  Created by Joaquin Tome on 14/12/22.
//
import OpenAISwift
import Foundation

final class APICaller {
    static let shared = APICaller()
    
    private var client: OpenAISwift?
    
    private init() {}
    
    public func setup(){
        self.client = OpenAISwift(authToken: "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")
    }
    
    public func getResponse(input: String, completion: @escaping (Result<String,Error>) -> Void){
        client?.sendCompletion(with: input, maxTokens: 200,completionHandler: { result in
            switch result {
            case .success(let model):
                let output = model.choices.first?.text ?? ""
                completion(.success(output))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
    
}
