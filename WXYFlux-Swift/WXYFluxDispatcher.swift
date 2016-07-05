//
//  WXYFluxDispatcher.swift
//  FluxDemo
//
//  Created by wuxu on 16/7/1.
//  Copyright © 2016年 wuxu. All rights reserved.
//

import Foundation

class WXYFluxDispatcher: NSObject {
    
    static let dispatcher = WXYFluxDispatcher()
    
    private var storeHashTable : HashTable<AnyObject>
    
    private override init() {
        storeHashTable = HashTable(options: PointerFunctions.Options.weakMemory)
    }
    
    static func registerStore(_ store : WXYFluxStore) {
        if !dispatcher.storeHashTable.contains(store) {
            dispatcher.storeHashTable.add(store)
        }
    }
    
    static func unregisterStore(_ store : WXYFluxStore) {
        if dispatcher.storeHashTable.contains(store) {
            dispatcher.storeHashTable.remove(store)
        }
    }
    
    static func dispatchAction(_ action : WXYFluxAction) {
        let numeratorKey = dispatcher.storeHashTable.objectEnumerator()
        
        for store in numeratorKey {
            if let store = store as? WXYFluxStore {
                if self.isStore(store, shouldHandleAction: action) {
                    if store.responds(to: Selector(("handleAction:"))) {
                        store.handleAction(action)
                    }
                }
            }
        }
    }
    
    private static func isStore(_ store : WXYFluxStore, shouldHandleAction action : WXYFluxAction) -> Bool {
        
        var sIdentifier = ""
        if let si = store.identifier() {
            sIdentifier = si
        }
        
        var aIdentifier = ""
        if let ai = action.identifier() {
            aIdentifier = ai
        }
        
        if !sIdentifier.isEmpty && !aIdentifier.isEmpty {
            return sIdentifier == aIdentifier
        } else if !sIdentifier.isEmpty {
            return true
        } else if !aIdentifier.isEmpty {
            return false
        } else {
            return true
        }
    }
}
