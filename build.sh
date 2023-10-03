#!/bin/bash

version=$1

mkdir out 
cd out 
wget https://github.com/bluguard/dnshield/releases/download/${version}/dnshield
wget https://github.com/bluguard/dnshield/releases/download/${version}/dnshield_arm32
wget https://github.com/bluguard/dnshield/releases/download/${version}/dnshield_arm64
chmod +x ./*
cd ..
cd debian
alphaversion=$(echo $version | tr -cd '[0-9.]')
./buildDebian.sh amd64 ../out/dnshield $alphaversion
./buildDebian.sh arm32 ../out/dnshield_arm32 $alphaversion
./buildDebian.sh arm64 ../out/dnshield_arm64 $alphaversion
mv *.deb ../out/
cd ..
