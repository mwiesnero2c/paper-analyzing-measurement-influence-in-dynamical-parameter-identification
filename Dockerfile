FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y software-properties-common
RUN add-apt-repository universe
RUN add-apt-repository ppa:inkscape.dev/stable
RUN apt-get update && \
    apt-get install -y inkscape make cmake python3 python3-pip git g++ libboost-all-dev && \
    rm -rf /var/lib/apt/lists/*
RUN apt-get update && \
    apt-get install -y texlive texlive-latex-extra texlive-science dvipng cm-super
RUN apt-get update && \
    apt-get install -y qt5-qmake qt5-default libqt5charts5-dev && \
    apt-get clean && \
    strip --remove-section=.note.ABI-tag /usr/lib/x86_64-linux-gnu/libQt5Core.so.5 && \
    rm -rf /var/lib/apt/lists/*
RUN apt-get update && \
    apt install -y wget libopenblas-base libsuperlu-dev && \
    wget -q -O worhp_1.14-0~ubuntu2004.deb https://seafile.zfn.uni-bremen.de/f/0171f8b47c114aa282a5/?dl=1 && \
    chmod +x worhp_1.14-0~ubuntu2004.deb && \
    apt-get install -y ./worhp_1.14-0~ubuntu2004.deb
RUN pip3 install numpy==1.19.4 scipy==1.5.4 matplotlib==3.3.2 svgutils==0.3.2
RUN wget -q -O measurementInfluenceAnalyzer https://seafile.zfn.uni-bremen.de/f/49fb56625c894dc0b1f6/?dl=1 && \
    chmod +x measurementInfluenceAnalyzer
ENV PATH=$PATH:$PWD/
