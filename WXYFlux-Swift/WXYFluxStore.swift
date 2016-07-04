//
//  WXYFluxStore.swift
//  FluxDemo
//
//  Created by wuxu on 16/7/1.
//  Copyright © 2016年 wuxu. All rights reserved.
//

import Foundation

public protocol WXYFluxStore : NSObjectProtocol {
    
    func identifier() -> String?
    
    func handleAction(_ action : WXYFluxAction)
    
}
