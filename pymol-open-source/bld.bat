git clone https://github.com/g-truc/glm.git glm_source
git clone https://github.com/rcsb/mmtf-cpp.git mmtf-cpp
git clone https://github.com/msgpack/msgpack-c.git msgpack
move glm_source/glm ./include
move mmtf-cpp/include/* ./include/
move msgpack/include/* ./include/
python setup.py install --prefix="$PREFIX" --use-msgpackc c++11 --no-libxml