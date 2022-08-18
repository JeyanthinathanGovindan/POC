//
//  HomeViewModelTest.swift
//  VajroCodeTask_JeyanthinathanTests
//
//  Created by AMBINO4526 on 06/08/22.
//

import XCTest

class HomeViewModelTest: XCTestCase {
    
    func testService() {
        
        //Alternatively this service can also be tested with XCExpectation
        
        let viewModel = HomeViewModel()
        viewModel.didCompleteDownload = {
            let articles = viewModel.articles
            //Test if articles are downloaded
            XCTAssert((articles?.count ?? 0) > 0)
            //Test if article contains the needed info
            let article = articles?[0]
            XCTAssertNotNil(article?.title)
            XCTAssertNotNil(article?.bodyHTML)
            XCTAssertNotNil(article?.summaryHTML)
            XCTAssertNotNil(article?.image)
        }
    }

}
