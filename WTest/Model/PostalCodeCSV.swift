//
//  PostalCode.swift
//  WTest
//
//  Created by Raphael Alkamim on 24/09/22.
//

import Foundation

struct PostalCodeCSV: Codable, Identifiable {
    var cod_distrito: String = ""
    var cod_concelho: String = ""
    var cod_localidade: String = ""
    var nome_localidade: String = ""
    var cod_arteria: String = ""
    var tipo_arteria: String = ""
    var prep1: String = ""
    var titulo_arteria: String = ""
    var prep2: String = ""
    var nome_arteria: String = ""
    var local_arteria: String = ""
    var troco: String = ""
    var porta: String = ""
    var cliente: String = ""
    var num_cod_postal: String = ""
    var ext_cod_postal: String = ""
    var desig_postal: String = ""
    var id = UUID()
    
    init(raw: [String]) {
        cod_distrito = raw[0]
        cod_concelho = raw[1]
        cod_localidade = raw[2]
        nome_localidade = raw[3]
        cod_arteria = raw[4]
        tipo_arteria = raw[5]
        prep1 = raw[6]
        titulo_arteria = raw[7]
        prep2 = raw[8]
        nome_arteria = raw[9]
        local_arteria = raw[10]
        troco = raw[11]
        porta = raw[12]
        cliente = raw[13]
        num_cod_postal = raw[14]
        ext_cod_postal = raw[15]
        desig_postal = raw[16]
    }
}
