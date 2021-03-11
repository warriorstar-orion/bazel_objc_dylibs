#import <Foundation/Foundation.h>
#include <stdio.h>
#include <iconv.h>

int main(int argc, const char * argv[]) {
    // Demonstrate that iconv works
    char src[] = "abcčde";
    char dst[100];
    size_t srclen = 6;
    size_t dstlen = 12;
 
    fprintf(stderr,"in: %s\n",src);
 
    char * pIn = src;
    char * pOut = ( char*)dst;
 
    iconv_t conv = iconv_open("UTF-8","CP1250");
    iconv(conv, &pIn, &srclen, &pOut, &dstlen);
    iconv_close(conv);
 
    fprintf(stderr,"out: %s\n",dst);

    // Demonstrate that Foundation framework works
    @autoreleasepool {
        NSLog(@"Hello, World!");
    }

    return 0;
}