#import <objc/runtime.h>
#import <Foundation/Foundation.h>

// Compile with clang -framework Foundation -o afk afk.m

int main () {
  NSBundle *bundle = [NSBundle bundleWithPath:@"/Applications/Utilities/Keychain Access.app/Contents/Resources/Keychain.menu"];
  Class principalClass = [bundle principalClass];
  id instance = [[principalClass alloc] init];
  [instance performSelector:@selector(_lockScreenMenuHit:) withObject:nil];
  return 0;
}
