//
//  Meal.swift
//  BarDoZe
//
//  Created by Jonathan on 05/02/20.
//  Copyright © 2020 hbsis. All rights reserved.
//

import UIKit

class Bar {
    
    //MARK: Properties
    //MARK: Propriedades
    
    var nome: String!
    var foto: UIImage?
    var telefone: Int!
    var celular: Int!
    var rua: String!
    var complemento: String?
    var numero: Int!
    var rating: Int!
    

    //MARK: Initialization
    //MARK: Inicialização

    init?(nome: String!, foto: UIImage?, telefone: Int!, celular: Int!, rua: String!, complemento: String?, numero: Int!, rating: Int!) {
    
    //Initialization Should Fail If There Is No Name Or If The Rating Is Negative
    //Inicialização Deverá Falhar Se Não Houver Nome Ou Se a Classificação For Negativa
        if nome.isEmpty || rating < 0 {
            return nil
        }
        
    //Initialize Stored Properties
    //Inicializando Propriedades Armazenadas
        self.nome = nome
        self.foto = foto
        self.telefone = telefone
        self.celular = celular
        self.rua = rua
        self.complemento = complemento
        self.numero = numero
        self.rating = rating
    
    }
    
}
