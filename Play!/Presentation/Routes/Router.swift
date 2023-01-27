//
//  Router.swift
//  Play!
//
//  Created by Higashikata Maverick on 26/1/23.
//

import SwiftUI

class RouterContext {
    @State var navigationContext: [AppRoutes] = []
}

class Router {
    static func navigateTo(context: RouterContext, router: AppRoutes) {
        context.navigationContext.append(router)
    }
    
    static func popToRoot(context: RouterContext) {
        context.navigationContext = []
    }
    
    static func push(context: RouterContext, router: AppRoutes) {
        context.navigationContext.append(router)
    }
    
    static func pop(context: RouterContext) {
        context.navigationContext.removeLast()
    }
}
