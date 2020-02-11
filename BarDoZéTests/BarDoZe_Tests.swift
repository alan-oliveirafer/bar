//
//  BarDoZe_Tests.swift
//  BarDoZéTests
//
//  Created by Alan Fernandes on 29/01/20.
//  Copyright © 2020 hbsis. All rights reserved.
//

import XCTest
@testable import BarDoZe

class BarDoZe_Tests: XCTestCase {
    

    //MARK: Bar Class Tests
    //MARK: Classe Bar Teste
    
    //Confirm That The Bar Initializer Return a Bar Object When Passed Valid Parameters
    //Confirma Se o Inicializador De Barra Retorna Um Objeto De Barra Quando Passa Parâmetros Válidos
    func testBarInitializationSucceeds() {
    
        //Zero Rating
        //Zero Classificação
        let zeroRatingBar = Bar.init(nome: "Sem Classificação", foto: nil, telefone: 4732323232, celular: 47991919191, rua: "Rua Do BarDoZe", complemento: nil, numero: 832, rating: 0)
        XCTAssertNotNil(zeroRatingBar)
        
        
        //Highest Positive Rating
        //Classificação Máxima Positva
        let positiveRatingBar = Bar.init(nome: "Classificação Positiva", foto: nil, telefone: 4732323232, celular: 47991919191, rua: "Rua Do BarDoZe", complemento: nil, numero: 832, rating: 0)
        XCTAssertNotNil(positiveRatingBar)
        
        }
    
    
    //Confirm That The Bar Initialier Returns Nil When Passed a Negative Rating Or An Empty Name
    //Confirma Se a Barra Inicial Retorna Nil Quando Passou Uma Classificação Negativa Ou Vazia
    func testBarInitializationFails() {
        
        //Negative Rating
        //Classificação Negativa
        let negativeRatingBar = Bar.init(nome: "Classificação Positiva", foto: nil, telefone: 4732323232, celular: 47991919191, rua: "Rua Do BarDoZe", complemento: nil, numero: 832, rating: -1)
        XCTAssertNil(negativeRatingBar)
        
        //Rating Exceeds Maximum
        //Classificação Excede o Máximo
        let largeRatingBar = Bar.init(nome: "Classificação Positiva", foto: nil, telefone: 4732323232, celular: 47991919191, rua: "Rua Do BarDoZe", complemento: nil, numero: 832, rating: 6)
        
        
        //Empty String
        //String Vazia
        let emptyStringBar = Bar.init(nome: "Classificação Positiva", foto: nil, telefone: 4732323232, celular: 47991919191, rua: "Rua Do BarDoZe", complemento: nil, numero: 832, rating: 0)
        XCTAssertNil(emptyStringBar)
        
        
        
        }
    }
