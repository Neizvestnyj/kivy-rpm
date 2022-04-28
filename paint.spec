Name:           paint
Version:        1.0.0
Release:        1%{?dist}
Summary:        Summary
AutoReqProv:    no
BuildArch:      noarch
Packager:       Neizvestnyj
Group:          Education
License:        GPL
Source0:        %{name}-%{version}.tar.gz

BuildRequires: rsync
Requires: bash, rpm-build, rsync

%description
Description

%define debug_package %{nil}

%prep
%setup -q -c

%install
mkdir -p %{buildroot}/usr/bin
rsync -a --progress . %{buildroot}/usr/bin

%post
ln -sf /usr/bin/%{name}-%{version}/paint.desktop /usr/share/applications//paint.desktop

%clean
rm -rf %{buildroot}

%files
%defattr(-, root, root, 0755)
/usr/bin/%{name}-%{version}
