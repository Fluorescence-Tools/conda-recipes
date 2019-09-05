git clone https://github.com/g-truc/glm.git glm_source
git clone https://github.com/rcsb/mmtf-cpp.git mmtf-cpp
git clone https://github.com/msgpack/msgpack-c.git msgpack
mv glm_source/glm $PREFIX/include/
mv mmtf-cpp/include/* $PREFIX/include/
mv msgpack/include/* $PREFIX/include/

if [ "$(uname)" == "Darwin" ]; then
  rm $PREFIX/include/menu.h # necessary because of MacOS file system case insensitivity
  $PYTHON setup.py install --prefix="$PREFIX" --use-msgpackc=c++11 --no-libxml --no-glut --osx-frameworks
fi
if [ "$(uname)" == "Linux" ]; then
  $PYTHON setup.py install --prefix="$PREFIX" --use-msgpackc=c++11 --no-libxml --no-glut
fi

