import Foundation
import SwiftRedis

let redis = Redis()

redis.connect(host: "localhost", port: 6379) { (redisError: NSError?) in
    if let error = redisError {
        print(error)
    }
    else {
        // Set a key
        redis.set("Key1", value: "Hello World") { (result: Bool, redisError: NSError?) in
            if let error = redisError {
                print(error)
            }
            // Get the same key
            redis.get("Key1") { (string: RedisString?, redisError: NSError?) in
                if let error = redisError {
                    print(error)
                }
                else if let string = string?.asString {
                    print("Redis \(string)")
                }
            }
        }
    }
}