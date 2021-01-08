REM git clone https://github.com/rcsb/mmtf-cpp.git mmtf-cpp
REM move mmtf-cpp/include/* $PREFIX/include/

REM git clone https://github.com/msgpack/msgpack-c.git msgpack
REM move msgpack/include/* ./include/

git clone https://github.com/g-truc/glm.git glm_source
move glm_source/glm ./include

REM
"%PYTHON%" setup.py install --prefix="%PREFIX%" --use-msgpackc no --no-libxml --no-vmd-plugins --jobs 8
