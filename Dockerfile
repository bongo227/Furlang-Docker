FROM ubuntu:xenial

# Install llvm 3.8
RUN echo "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-3.8 main" >> /etc/apt/sources.list
RUN echo "deb-src http://apt.llvm.org/xenial/ llvm-toolchain-xenial-3.8 main" >> /etc/apt/sources.list
RUN apt-get update -q
RUN apt-get install clang-3.8 clang-3.8-doc libclang-common-3.8-dev libclang-3.8-dev libclang1-3.8 libclang1-3.8-dbg libllvm-3.8-ocaml-dev libllvm3.8 libllvm3.8-dbg lldb-3.8 llvm-3.8 llvm-3.8-dev llvm-3.8-doc llvm-3.8-examples llvm-3.8-runtime clang-format-3.8 python-clang-3.8 lldb-3.8-dev -y

# Install golang 1.7.3
RUN apt-get install wget -y
RUN wget https://storage.googleapis.com/golang/go1.7.3.linux-amd64.tar.gz
RUN tar -xf go1.7.3.linux-amd64.tar.gz
RUN mv go /usr/local
RUN rm go1.7.3.linux-amd64.tar.gz
ENV GOROOT /usr/local/go
ENV GOPATH /go
ENV PATH $GOPATH/bin:$GOROOT/bin:$PATH

# Install bats
RUN apt-get install git -y
RUN git clone https://github.com/sstephenson/bats.git
RUN ./bats/install.sh /usr/local
RUN rm -rf bats