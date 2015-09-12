if [ $T_ARCH == "x86" ]; then
  sudo apt-get update -qq
  sudo apt-get install debootstrap
  sudo apt-get install schroot
  sudo cp precise_1386.conf /etc/schroot/chroot.d/precise_i386.conf

  sudo mkdir -p /srv/chroot/precise_i386
  sudo debootstrap --variant=buildd --arch i386 precise /srv/chroot/precise_i386 http://archive.ubuntu.com/ubuntu/
  sudo schroot -l
  sudo schroot -c precise_i386 -u root /usr/bin/bash -c "pwd"
fi
