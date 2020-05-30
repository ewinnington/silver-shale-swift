# Installing Swift 

Following the instructions from the Swift website to install swift on my WSL2 Ubuntu 18.04

https://swift.org/download/

1. Downloaded the tar with wget
2. ran the apt-get command
3. extracted the tar
4. added the /bin folder to the path 
5. verify it works by running ```swift```
6. Run ```swift helloworld/hello.swift``` to check that hello world works!

# Common tasks in Swift 

It seems that for server side Swift, there's [Perfect](https://www.perfect.org/) as a complete stack and the [IBM swift libraries around Kitura](https://github.com/IBM-Swift). I started using the IBM libs for the moment. 

## Redis

```
mkdir cli-redis
cd cli-redis
swift package init --type executable
```

Modifed the Package.swift to have the reference to the [IBM Swift Kitura-Redis connector to redis](https://github.com/IBM-Swift/Kitura-redis) and followed the instructions there to add the dependency to my code. 

Ran my docker image of redis on the Windows side: 

docker run --name redis-1 -p 6379:6379 -d redis

```
swift build
.build/debug/cli-redis
```

And it worked!

I modified the test suite of cli-redisTests to catch the output ```Redis Hello World```, so we can try the Swift command line test suite as an integration test. 

```
swift test

> [8/8] Linking cli-redisPackageTests.xctest
> Test Suite 'All tests' started at 2020-05-30 09:27:48.710
> Test Suite 'debug.xctest' started at 2020-05-30 09:27:48.734
> Test Suite 'cli_redisTests' started at 2020-05-30 09:27:48.734
> Test Case 'cli_redisTests.BasicConnect' started at 2020-05-30 09:27:48.734
> Test Case 'cli_redisTests.BasicConnect' passed (0.116 seconds)
> Test Suite 'cli_redisTests' passed at 2020-05-30 09:27:48.851
>          Executed 1 test, with 0 failures (0 unexpected) in 0.116 (0.116) seconds
> Test Suite 'debug.xctest' passed at 2020-05-30 09:27:48.851
>          Executed 1 test, with 0 failures (0 unexpected) in 0.116 (0.116) seconds
> Test Suite 'All tests' passed at 2020-05-30 09:27:48.851
>          Executed 1 test, with 0 failures (0 unexpected) in 0.116 (0.116) seconds
```

It worked! 

## Postgresql 

## Rabbitmq

## Serve Rest API

## Access Rest API 