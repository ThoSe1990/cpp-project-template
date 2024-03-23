FROM ubuntu:latest

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install build-essential -y
RUN apt-get remove gcc-11
RUN apt install gcc-13
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-13 100
RUN update-alternatives --config gcc
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-13 100
RUN update-alternatives --config g++

RUN apt install clang-tidy -y
RUN apt install clang-format -y

RUN apt-get install lcov -y

RUN apt install npm -y
RUN apt install python3-pip -y
RUN pip3 install pyyaml
RUN pip3 install cmake 
RUN pip3 install conan

RUN apt install locales
RUN locale-gen en_US.UTF-8
RUN apt-get install doxygen -y
RUN apt-get install graphviz -y
RUN pip3 install sphinx
RUN pip3 install sphinx-js
RUN pip3 install sphinx-intl
RUN npm install -g jsdoc
RUN pip3 install sphinx_rtd_theme
RUN pip3 install breathe
RUN pip3 install linuxdoc

RUN conan profile detect

RUN sed -i 's/Release/Debug/g' /root/.conan2/profiles/default
RUN sed -i 's/compiler.cppstd=gnu14/compiler.cppstd=gnu20/g' /root/.conan2/profiles/default

RUN cp /root/.conan2/profiles/default /root/.conan2/profiles/release
RUN sed -i 's/Debug/Release/g' /root/.conan2/profiles/release

CMD ["bash"]
