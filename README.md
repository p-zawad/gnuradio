# gnuradio
Dockerfile for gnuragio container

Ubuntu based Docker image. It has installed `gqrx`, `gnuradio-companion` and other stuff. PLease note, that drivers for `rtl-sdr`, `UHD` and other physical signal sources should be installed in the host system.

It has to be run in `priviledged` mode in GUI environment
```
USER_UID=$(id -u) docker run --rm -ti --name "gnuradio" --privileged --net=host --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" -v "$(pwd)persistent_storage":/home/student/persistent -v /var/run/dbus:/var/run/dbus --device /dev/bus/usb --device /dev/snd -v /dev/snd:/dev/snd --volume=/run/user/${USER_UID}/pulse:/run/user/1000/pulse pzawad/gnuradio tilix
```

Please create `persistent_storage` folder in a present working directory to preserve some data between successive runs of the container. You will be working as a user `student` and your password is `qwerty`. You can use `sudo` to gain administrator (inside container) privileges (please note that due to docker's `priviledged` mode this also partially applies to the host system). The access to persistent storage is via `/home/student/persistent` folder.
