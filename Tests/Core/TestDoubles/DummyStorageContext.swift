//
//  DummyStorageContext.swift
//  StorageKit
//
//  Copyright (c) 2017 StorageKit (https://github.com/StorageKit)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

@testable import StorageKit

import Foundation

final class DummyStorageContext {}

extension DummyStorageContext: StorageIdentifiableContext {}

extension DummyStorageContext: StorageDeletableContext {
    func delete<T: StorageEntityType>(_ entity: T) throws {}
    func delete<T: StorageEntityType>(_ entities: [T]) throws {}
    func deleteAll<T: StorageEntityType>(_ entityType: T.Type) throws {}
}

extension DummyStorageContext: StorageReadableContext {
    func fetch<T: StorageEntityType>(predicate: NSPredicate?, sortDescriptors: [SortDescriptor]?, completion: @escaping FetchCompletionClosure<T>) {}
}

extension DummyStorageContext: StorageUpdatableContext {
    func update(transform: @escaping () -> Void) throws {}
}

extension DummyStorageContext: StorageWritableContext {
    func add<T>(_ entities: [T]) throws where T : StorageEntityType {}

    func add<T>(_ entity: T) throws where T : StorageEntityType {}

    func create<T: StorageEntityType>() -> T? {
        return nil
    }
    
    func save() throws {}
}
