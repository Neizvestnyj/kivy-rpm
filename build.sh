# compile app
cd App || echo "folder App does not exist" || exit
pyinstaller paint.spec
cd ../
echo "Compiled"

# create necessary dirs
mkdir -p rpmbuild
mkdir -p rpmbuild/{RPMS,SRPMS,BUILD,SOURCES,SPECS,tmp}
echo "rpmbuild dirs created"

# we copy the program by changing the name (name-version), it is necessary for everything to be unpacked correctly
cp -r App/dist/Paint App/dist/paint-1.0.0
# copy desktop file to app folder
cp App/paint.desktop App/dist/paint-1.0.0

# create archive
cd App/dist || echo "folder App/dist does not exist" || exit
tar -czvf paint-1.0.0.tar.gz paint-1.0.0
cd ../..

# copy our source archive to SOURCES folder
cp -r App/dist/paint-1.0.0.tar.gz rpmbuild/SOURCES/
# copy .rpmmacros to home dir in order for the path to our rpmbuild folder to be determined correctly during assembly
# (standard rpmbuild thinks that the project folder is located in the home directory)
cp .rpmmacros ~
# copy the specification file for rpmbuild
cp paint.spec rpmbuild/SPECS/

# build our app
rpmbuild -bb rpmbuild/SPECS/paint.spec
