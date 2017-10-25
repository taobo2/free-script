#!/bin/bash
yum install git gcc texinfo  -y

cd ${projecthome}
polipo="https://github.com/jech/polipo.git"
git clone $polipo && cd polipo && make all && make install
cd ${projecthome}


