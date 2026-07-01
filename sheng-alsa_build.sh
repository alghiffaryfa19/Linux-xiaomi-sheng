# 仅在未设置环境变量时配置ccache
if [ -z "$CCACHE_DIR" ]; then
    export CCACHE_DIR="/home/runner/.ccache"
    export CCACHE_MAXSIZE="10G"
    export CCACHE_SLOPPINESS="file_macro,locale,time_macros"
fi

# 确保ccache目录存在
mkdir -p "$CCACHE_DIR"

# 确保ccache优先使用clang
export CC="ccache clang"
export CXX="ccache clang++"
export AR="llvm-ar"
export NM="llvm-nm"
export OBJCOPY="llvm-objcopy"
export OBJDUMP="llvm-objdump"
export READELF="llvm-readelf"
export STRIP="llvm-strip"


git clone https://github.com/map220v/alsa-ucm-conf
mkdir -p alsa-xiaomi-sheng/usr/share/alsa
cp -r alsa-ucm-conf/ucm2 alsa-xiaomi-sheng/usr/share/alsa/

dpkg-deb --build --root-owner-group alsa-xiaomi-sheng
