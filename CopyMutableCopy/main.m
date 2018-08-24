//
//  main.m
//  CopyMutableCopy
//
//  Created by Noah on 2018/8/24.
//  Copyright © 2018年 Noah. All rights reserved.
//

#import <Foundation/Foundation.h>

void stringDemo(void);
void arrayDemo(void);
void dictionaryDemo(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
//        stringDemo();
        arrayDemo();
//        dictionaryDemo();
    }
    return 0;
}

void stringDemo() {
    // __NSCFConstantString : 0x1037faa48
    NSString *s1 = @"321321321";
    
    // __NSCFConstantString : 0x1037faa48，浅复制，只拷贝指针
    NSString *cs1 = [s1 copy];
    
    // __NSCFString : 0x604000449780，深复制，开辟新的内存地址，不可变字符串 -> 可变字符串
    NSMutableString *ms1 = [s1 mutableCopy];
    
    // __NSCFString : 0x604000449780，方法变相证明了 NSString 通过 mutableCopy 生成了一个新的可变字符串
    [ms1 appendString:@"0000"];
    
    // __NSCFString : 0x60000005e330
    NSMutableString *ms = [NSMutableString stringWithString:@"fdasfda"];
    
    // NSTaggedPointerString : 0xa616466736164667，false深复制，开辟新的内存地址，可变字符串 -> 不可变字符串，如果执行可变字符串方法会崩溃
    NSString *cms = [ms copy];
    
    // __NSCFString : 0x600000443000，深复制，开辟新的内存地址
    NSMutableString *mms = [ms mutableCopy];
}

void arrayDemo() {
    // __NSArrayI 0x604000221700
    NSArray *a = @[@1, @2];
    
    // __NSArrayI 0x604000221700，浅复制，只拷贝指针
    NSArray *ca = [a copy];
    
    // __NSArrayM 0x60400024e010，深复制，开辟新的内存地址，不可变数组 -> 可变数组
    NSMutableArray *ma = [a mutableCopy];
    
    // __NSArrayM 0x60400024e010，方法变相证明了 NSArray 通过 mutableCopy 生成了一个新的可变数组
    [ma addObject:@3];
    
    // __NSArrayM 0x600000246e40
    NSMutableArray *m = [NSMutableArray arrayWithObjects:@"a", @"b", nil];
    
    // __NSArrayI 0x600000039040，false深复制，可变数组 -> 不可变数组，如果执行可变数组方法会崩溃
    NSArray *cm = [m copy];
    
    // __NSArrayM 0x600000246ea0，深复制，开辟新的内存地址
    NSMutableArray *mm = [m mutableCopy];
}

void dictionaryDemo() {
    // __NSDictionaryI : 0x60400027f8c0
    NSDictionary *d = @{@"aa": @(11), @"bb": @(22)};
    
    // __NSDictionaryI : 0x60400027f8c0，浅复制，只拷贝指针
    NSDictionary *cd = [d copy];
    
    // __NSDictionaryM : 0x604000039260，深复制，开辟新的内存地址，不可变字典 -> 可变字典
    NSMutableDictionary *md = [d mutableCopy];
    
    // __NSDictionaryM : 0x604000039260，方法变相证明了 NSDictionary 通过 mutableCopy 生成了一个新的可变字典
    [md setObject:@(33) forKey:@"cc"];
    
    // __NSDictionaryM : 0x604000039460
    NSMutableDictionary *m = [NSMutableDictionary dictionaryWithDictionary:@{@"gg": @(88), @"hh": @(99)}];
    
    // __NSFrozenDictionaryM : 0x6040000394e0，false深复制，开辟新的内存地址，可变字典 -> 不可变字典，如果执行可变字典方法会崩溃
    NSDictionary *cm = [m copy];
    
    // __NSDictionaryM : 0x6040000394a0，深复制，开辟新的内存地址
    NSMutableDictionary *mm = [m mutableCopy];
}

