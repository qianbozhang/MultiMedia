# 记录编译过程遇到的错误，与解决方案
## libiconv: error: 'gets' undeclared here (not in a function)
FIX: https://blog.51cto.com/5065548971213/2114389

## gstreamer-1.0: configure: error: Could not find bison
FIX: sudo apt install bison

## gstreamer-1.0: configure: error: Could not find flex
FIX: sudo apt install flex

## libav: nasm/yasm not found or too old. Use --disable-x86asm for a crippled build.
FIX: sudo apt install yasm