//===--- Thread.swift ------------------------------------------------------===//
//Copyright (c) 2016 Daniel Leping (dileping)
//
//Licensed under the Apache License, Version 2.0 (the "License");
//you may not use this file except in compliance with the License.
//You may obtain a copy of the License at
//
//http://www.apache.org/licenses/LICENSE-2.0
//
//Unless required by applicable law or agreed to in writing, software
//distributed under the License is distributed on an "AS IS" BASIS,
//WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//See the License for the specific language governing permissions and
//limitations under the License.
//===----------------------------------------------------------------------===//

import Foundation
import CoreFoundation

#if os(Linux)
    import Glibc
#else
    import Darwin
#endif

private func ThreadLocalDestructor(pointer:UnsafeMutablePointer<Void>) {
    if pointer != nil {
        Unmanaged<AnyObject>.fromOpaque(OpaquePointer(pointer)).release()
    }
}

public class ThreadLocal<T> {
    private let _key:pthread_key_t
    
    public init(value:T? = nil) throws {
        var key = pthread_key_t()
        
        try ccall(CError.self) {
            pthread_key_create(&key, ThreadLocalDestructor)
        }
        
        _key = key
        
        if let value = value {
            try setValue(value)
        }
    }
    
    deinit {
        // Crash the whole damn thing. It's definately a programming error
        try! ccall(CError.self) {
            pthread_key_delete(_key)
        }
    }
    
    private func setValue(value:T?) throws {
        let unmanaged = value.map { Unmanaged.passRetained(AnyContainer($0)) }
        
        do {
            let pointer = unmanaged.map { unmanaged in
                UnsafeMutablePointer<Void>(OpaquePointer(bitPattern: unmanaged))
                }.getOrElse(nil)
            try ccall(CError.self) {
                pthread_setspecific(_key, pointer)
            }
        } catch {
            unmanaged?.release()
            throw error
        }
    }
    
    public var value:T? {
        get {
            let pointer = pthread_getspecific(_key)
            if pointer == nil {
                return nil
            }
            let container:AnyContainer<T> = Unmanaged.fromOpaque(OpaquePointer(pointer)).takeUnretainedValue()
            return container.content
        }
        set {
            // Yes, let it crash. Runtime error
            try! setValue(newValue)
        }
    }
}

private func thread_proc(arg: UnsafeMutablePointer<Void>) -> UnsafeMutablePointer<Void> {
    let task = Unmanaged<AnyContainer<SafeTask>>.fromOpaque(OpaquePointer(arg)).takeRetainedValue()
    task.content()
    return nil
}

public class Thread : Equatable {
    public let thread:pthread_t
    
    public init(pthread:pthread_t) {
        thread = pthread
    }
    
    public init(task:SafeTask) throws {
        #if os(Linux)
            self.thread = 0
        #else
            self.thread = nil
        #endif
        
        let unmanaged = Unmanaged.passRetained(AnyContainer(task))
        let arg = UnsafeMutablePointer<Void>(OpaquePointer(bitPattern: unmanaged))
        do {
            try ccall(CError.self) {
                pthread_create(&thread, nil, thread_proc, arg)
            }
        } catch {
            unmanaged.release()
            throw error
        }
    }
    
    public func join() throws -> UnsafeMutablePointer<Void> {
        var result:UnsafeMutablePointer<Void> = nil
        try ccall(CError.self) {
            pthread_join(thread, &result)
        }
        return result
    }
    
    public static func detach(task:SafeTask) throws {
        let _ = try Thread(task: task)
    }
    
    public static var isMain:Bool {
        get {
            #if os(Linux)
                return CFRunLoopGetMain() === CFRunLoopGetCurrent()
            #else
                return pthread_main_np() != 0
            #endif
        }
    }
    
    public static var current:Thread {
        get {
            return Thread(pthread: pthread_self())
        }
    }
    
    public static func sleep(timeout:Timeout) -> Timeout? {
        var time = timeout.timespec
        return try! ccall(CError.self) { code in
            var rem:timespec = timespec()
            let ret = nanosleep(&time, &rem)
            if ret == CError.INTR {
                return Timeout(timespec: rem)
            } else {
                code = ret
                return nil
            }
        }
    }
}

public func ==(lhs:Thread, rhs:Thread) -> Bool {
    return pthread_equal(lhs.thread, rhs.thread) != 0
}
