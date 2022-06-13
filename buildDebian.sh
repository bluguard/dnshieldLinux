arch=$1
binarypath=$2
version=$3


rm -rf dnshield 
rm dnshield.deb
mkdir -p dnshield/DEBIAN/ dnshield/usr/bin dnshield/usr/lib/systemd/system/
cp $binarypath dnshield/usr/bin
cp dnshield.service dnshield/usr/lib/systemd/system/
eval "echo \"$(cat debian/control)\"" > dnshield/DEBIAN/control
cp debian/postinst dnshield/DEBIAN/

dpkg-deb --build dnshield 
rm -rf dnshield 
