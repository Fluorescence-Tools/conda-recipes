git clone https://github.com/g-truc/glm.git glm_source
git clone https://github.com/rcsb/mmtf-cpp.git mmtf-cpp
git clone https://github.com/msgpack/msgpack-c.git msgpack
mv glm_source/glm ./include
mv mmtf-cpp/include/* ./include/
mv msgpack/include/* ./include/
$PYTHON setup.py install --prefix="$PREFIX" --use-msgpackc c++11 --no-libxml