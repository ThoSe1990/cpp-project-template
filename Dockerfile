# Use the official Ubuntu image from Docker Hub
FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    cmake \
    git \
    python3 \
    python3-pip && \
    pip3 install --no-cache-dir conan

# Install GCC compiler for C++20 support
RUN apt-get install -y \
    software-properties-common && \
    add-apt-repository ppa:ubuntu-toolchain-r/test && \
    apt-get update && \
    apt-get install -y \
    g++-13 \
    && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-13 100 \
    && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-13 100

RUN conan profile detect
RUN sed -i -e 's/compiler.cppstd=gnu17/compiler.cppstd=gnu20/g' /root/.conan2/profiles/default

# WORKDIR /wrk

# COPY . .

RUN git clone https://github.com/ThoSe1990/cwt-cucumber-conan.git

RUN conan create ./cwt-cucumber-conan/package --version 1.2.2 --user cwt --channel stable

# RUN conan install ./conan/with-cucumber.txt -of ./build_docker --build missing 
# RUN cmake -S . -B ./build_docker -DCMAKE_TOOLCHAIN_FILE="./build_docker/conan_toolchain.cmake" -DCMAKE_BUILD_TYPE=Release
# RUN cmake --build ./build_docker

CMD ["bash"]