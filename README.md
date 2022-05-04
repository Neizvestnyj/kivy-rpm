# Build kivy to rpm package

My Linux distributive - **OpenSuse15.4**

[Author of the test application](https://github.com/endvroy/kivy_paint)

**in terminal**
```bash
sudo dnf install -y ffmpeg-libs SDL2-devel SDL2_image-devel SDL2_mixer-devel \
SDL2_ttf-devel portmidi-devel libavdevice libavc1394-devel zlibrary-devel ccache \
mesa-libGL mesa-libGL-devel xclip
```

**requirements**
```
conda install pyinstaller
pip install kivy==2.0.0
```

### Create rpm
**in terminal**
```bash
sudo zypper install rpmbuild
```

**Install app after execution build.sh**
```bash
sudo dnf install rpmbuild/RPMS/noarch/paint-1.0.0-1.noarch.rpm
```
The application shortcut should appear in the education group

**additional commands**
```bash
# show installed packages
dnf list
# get info about our app
dnf info paint
# where our app installed
rpm -ql paint
# to remove app
sudo dnf remove paint
```
