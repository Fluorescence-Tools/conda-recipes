git clone https://github.com/rcsb/mmtf-cpp.git mmtf-cpp
move mmtf-cpp/include/* $PREFIX/include/

git clone https://github.com/g-truc/glm.git glm_source
move glm_source/glm ./include

git clone https://github.com/msgpack/msgpack-c.git msgpack
move msgpack/include/* ./include/

"%PYTHON%" setup.py install --prefix="%PREFIX%" --use-msgpackc no --no-libxml
