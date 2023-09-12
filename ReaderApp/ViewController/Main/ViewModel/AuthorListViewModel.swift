//
//  AuthorListViewModel.swift
//  ReaderApp
//
//  Created by Mathias Nonohay on 24/08/2023.
//

import UIKit

class AuthorListViewModel {
    typealias AuthorList = [AuthorMock]
//    private lazy var authorList: AuthorList = {
//        return [
//            AuthorMock(identifier: "luxemburgo", portrait: UIImage(named: "Rosa_Luxemburg") ?? UIImage(), name: "Rosa Luxemburgo", lifePeriod: "1871 - 1919", phrase: "", description: "Entrou para o movimento revolucionário ainda estudante. Em 1893, colaborou na fundação do Partido Social Democrata Polaco. Entrou para o Partido Social Democrata Alemão em 1898. Em 1907, em Londres, na conferência do Partido Social Democrata Russo, apoiou os bolcheviques contra os mencheviques em todos os problemas mais importantes da Revolução russa. No mesmo ano, no Congresso de Stuttgart da II Internacional, juntamente com Lenin, apresentou a proposta revolucionária contra a guerra e que foi adotada, na essência, pelo Congresso. Após a Revolução de Novembro de 1918 na Alemanha, juntou-se a Karl Liebknecht e fundaram o Partido Comunista Alemão.", works: [Work(
//                title: "Quais São as Origens do Dia dos Trabalhadores?",
//                date: "1894 - fev",
//                firstEdition: "",
//                source: "",
//                content: "",
//                translation: "",
//                transcrition: "")]),
//            AuthorMock(identifier: "luxemburgo", portrait: UIImage(), name: "Pierre-Joseph Proudhon", lifePeriod: "1809 - 1865", phrase: "", description: "Publicista, economista e sociólogo francês, ideólogo da pequena burguesia. Um dos fundadores do anarquismo. Seu pai, de origem camponesa, trabalhava numa cervejaria e o próprio Proudhon exerceu atividades como corretor em Paris, Marselha e outras cidades. Dirigiu, durante algum tempo, uma impressora em Besançon. Seu primeiro trabalho: Que é a Propriedade? (1840) e que contém a famosa frase “A propriedade é o roubo!” teve grande repercussão. Publicou em seguida o Sistema das Contradições Econômicas ou Filosofia da Miséria (1846), ao qual Marx respondeu com a obra Miséria da Filosofia. Proudhon escreveu também a Capacidade Política dos Trabalhadores, que exerceu profunda influência sobre o movimento operário francês. Encarcerado por suas atividades, depois da revolução de 1848 Proudhon foi nomeado membro da Assembleia Constituinte. Após o golpe de Estado de Luís Napoleão, refugiou-se na Bélgica, onde permaneceu até a morte. \nAo criticar a grande propriedade capitalista de acordo com sua posição pequeno-burguesa, Proudhon aspira perpetuar a pequena propriedade privada, propunha organizar o Banco do Povo e o Banco do Câmbio, com ajuda dos quais obteriam os operários – segundo ele – seus próprios meios de produção, se converteriam em artesãos e assegurariam a venda “eqüitativa” de seus produtos. Proudhon não compreendia o papel histórico e o significado do proletariado e negava a luta de classes, a revolução proletária e a ditadura do proletariado. Como anarquista, negava, também, a necessidade do Estado. Marx e Engels mantivera, uma luta conseqüente contra as tentativas de Proudhon de impor suas idéias à I Internacional. O proudhonismo foi submetido a uma crítica demolidora na obra de Karl Marx: “Miséria da Filosofia”. A luta determinada de Karl Marx e F. Engels e seus partidários contra o proudhonismo terminou com a completa vitória do marxismo na I Internacional. Lênin caracterizou o proudhonismo de “teoria do pequeno-burguês e do filisteu obtuso”, incapaz de colocar-se do ponto de vista da classe operária. As idéias do proudhonismo são utilizadas em grande escala pelos “teóricos” burgueses para defenderem a colaboração entre as classes.", works: [Work(
//                title: "",
//                date: "",
//                firstEdition: "",
//                source: "",
//                content: "",
//                translation: "",
//                transcrition: "")]),
//            AuthorMock(identifier: "luxemburgo", portrait: UIImage(), name: "Max Weber", lifePeriod: "1864 - 1920", phrase: "", description: "Sociólogo alemão e economista político mais conhecido por sua tese da ´ética protestante´, um dos primeiros defensores da sociologia positivista e historiografia, ele promoveu a tese de que o significado de um fenômeno histórico é determinado pelo ponto de vista do investigador, e não por qualquer significado objetivo, desenvolveu o conceito de ´tipos ideais´, como uma ferramenta para isolar os fenômenos sociológicos com a finalidade de análise, sua metodologia foi conscientemente dirigida contra o marxismo, promovendo a idéia de uma pluralidade de fatores históricos como contra o que hoje é chamado de ´essencialismo´.", works: [Work(
//                title: "",
//                date: "",
//                firstEdition: "",
//                source: "",
//                content: "",
//                translation: "",
//                transcrition: "")])
//        ]
//    }()
    
    func fetchAuthorList(completion: @escaping(Result<AuthorResponse, Error>) -> Void) {
        NetworkManager().fetchData { result in
            switch result {
            case .success(let authorList):
                completion(.success(authorList))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}

enum AuthorError: Error {
    case mockFailure
    case invalidInput(Character)
}
