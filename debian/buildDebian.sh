arch=$1
binarypath=$2
version=$3

echo $version

mkdir -p dnshield/DEBIAN/ dnshield/usr/bin dnshield/usr/lib/systemd/system/
cp $binarypath dnshield/usr/bin/dnshield
cp ../dnshield.service dnshield/usr/lib/systemd/system/
eval "echo \"$(cat control)\"" > dnshield/DEBIAN/control
cp postinst prerm dnshield/DEBIAN/

dpkg-deb -Zxz --build dnshield 
rm -rf dnshield 
mv dnshield.deb dnshield_${arch}.deb