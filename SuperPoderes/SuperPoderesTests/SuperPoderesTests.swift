//
//  SuperPoderesTests.swift
//  SuperPoderesTests
//
//  Created by David Robles Lopez on 1/4/23.
//

import XCTest
import SwiftUI
import ViewInspector
import Combine
@testable import SuperPoderes

final class SuperPoderesTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: Test de UI
    
    func testLoaderView() throws {
        let view = LoaderView().environmentObject(ViewModelHeros())
        
        XCTAssertNotNil(view)
        
        let text = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(text)
    }
    
    func testErrorView() throws {
        let view = ErrorView(error: "Testing")
            .environmentObject(ViewModelHeros())
        
        XCTAssertNotNil(view)
        
        
        let image = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(image)
        
        let text = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(text)
        
        let texto = try text.text().string()
        XCTAssertEqual(texto, "Testing")
        
        let boton = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(boton)
        try boton.button().tap()
    }
    
    func testHeroesViewRow() throws {
        let view = HeroesRowView(hero: Heros(id: 95865, name: "Outlaw (Inez Temple)", description: "Prueba", modified: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/4ce59d3a80ff7", thumbnailExtension: .jpg), resourceURI: "", comics: Comics(available: 2, collectionURI: "", items: [ComicsItem(resourceURI: "", name: ""),ComicsItem(resourceURI: "", name: "")], returned: 2), series: Comics(available: 2, collectionURI: "", items: [ComicsItem(resourceURI: "", name: ""),ComicsItem(resourceURI: "", name: "")], returned: 2), stories: Stories(available: 1, collectionURI: "", items: [StoriesItem(resourceURI: "", name: " ", type: .cover)], returned: 1), events: Comics(available: 2, collectionURI: "", items: [ComicsItem(resourceURI: "", name: ""),ComicsItem(resourceURI: "", name: " ")], returned: 2), urls: [URLElement(type: .detail, url: "")]))
            .environmentObject(ViewModelHeros())
        
        XCTAssertNotNil(view)
        
        let image = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(image)
        
        let text = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(text)
    }
    
    func testHeroesSeriesRowView() throws {
        let view = HeroesSeriesRowView(serie: Serie(id: 1, title: "test", description: "", thumbnail: Thumbnail(path: "",thumbnailExtension: .jpg)))
            .environmentObject(ViewModelHeros())
        
        XCTAssertNotNil(view)
        
        // Title
        let title = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(title)
        
        let image = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(image)
        
        let description = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(description)
    }
    
    // MARK: Test de Models
    func testModels() throws {
        let hero = Heros(id: 95865, name: "Outlaw (Inez Temple)", description: "testHero", modified: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/4ce59d3a80ff7", thumbnailExtension: .jpg), resourceURI: "", comics: Comics(available: 2, collectionURI: "", items: [ComicsItem(resourceURI: "", name: ""),ComicsItem(resourceURI: "", name: "")], returned: 2), series: Comics(available: 2, collectionURI: "", items: [ComicsItem(resourceURI: "", name: ""),ComicsItem(resourceURI: "", name: "")], returned: 2), stories: Stories(available: 1, collectionURI: "", items: [StoriesItem(resourceURI: "", name: " ", type: .cover)], returned: 1), events: Comics(available: 2, collectionURI: "", items: [ComicsItem(resourceURI: "", name: ""),ComicsItem(resourceURI: "", name: " ")], returned: 2), urls: [URLElement(type: .detail, url: "")])
        
        XCTAssertNotNil(hero)
        XCTAssertEqual(hero.name, "Outlaw (Inez Temple)")
        XCTAssertEqual(hero.description, "testHero")
        XCTAssertEqual(hero.thumbnail.path, "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/4ce59d3a80ff7")
        
        let serie = Serie(id: 1, title: "testSerie", description: "descriptionSerie", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/4ce59d3a80ff7", thumbnailExtension: .jpg ))
        
        XCTAssertNotNil(serie)
        XCTAssertEqual(serie.title, "testSerie")
        XCTAssertEqual(serie.description, "descriptionSerie")
        XCTAssertEqual(serie.thumbnail.path, "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/4ce59d3a80ff7")
    }
    
    // MARK: Test de Combine
    func testViewModelHero() throws {
        var suscriptor = Set<AnyCancellable>()
        
        let expectation = self.expectation(description: "Models heroes")
        
        //instanciar el viewModel
        let vm = ViewModelHeros(testing: false)
        XCTAssertNotNil(vm)
        
        //observador de los heros

        vm.heros.publisher
            .sink { completion in
                switch completion{
                case.finished:
                    XCTAssertEqual(1, 1)
                    expectation.fulfill()
                case.failure:
                    XCTAssertEqual(1, 2)
                    expectation.fulfill()
                }
            } receiveValue: { data in
            }
            .store(in: &suscriptor)
        
        //lanzar la carga
        vm.getHeros(sortBy: .formerModified)
        
        self.waitForExpectations(timeout: 10)  // esperamos 10 segundos
    }
    
    func testViewModelSeries() throws {
        var suscriptor = Set<AnyCancellable>()
        
        let expectation = self.expectation(description: "Models series")
        
        //instanciar el viewModel
        let vm = ViewModelSeries(hero: Heros(id: 0001, name: "David", description: "", modified: "", thumbnail: Thumbnail(path: "", thumbnailExtension: .jpg), resourceURI: "", comics: Comics(available: 1, collectionURI: "", items: [], returned: 12), series: Comics(available: 12, collectionURI: "", items: [], returned: 12), stories: Stories(available: 12, collectionURI: "", items: [], returned: 12), events: Comics(available: 12, collectionURI: "", items: [], returned: 2), urls: []), testing: false)
        XCTAssertNotNil(vm)
        
        //observador de las series

        vm.series.publisher
            .sink { completion in
                switch completion{
                case.finished:
                    XCTAssertEqual(1, 1)
                    expectation.fulfill()
                case.failure:
                    XCTAssertEqual(1, 2)
                    expectation.fulfill()
                }
            } receiveValue: { data in
            }
            .store(in: &suscriptor)
        //lanzar la carga
        vm.getHerosSerie()
        
        self.waitForExpectations(timeout: 10)  // esperamos 10 segundos
    }
}
