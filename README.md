# Dockerfile - Deb12

Debian 12 docker image with Python3. Can be used in Ansible Molecule testing.<br/>

Clone the Git Repository or Download the ZIP package and expand. CD into the folder. Then follow these steps to build docker container instance.

Build Docker Image:
```
docker build -t hammadrauf/dockerdeb12 .
```
OR Pull from Docker Hub, Quay.io (Not uploaded yet).

Run Docker Conatiner:
```
docker run -d --name debian12 --hostname debian12 -it hammadrauf/dockerdeb12:latest sleep infinity & wait
```

Connect to BASH Shell in the Container:
```
docker exec -it debian12  /bin/bash
```

Then check status of Salt master like:

---

## Debug Port connections

Check open ports

Linux:
```
netstat -tulpn
```

Windows:
```
netstat -na
netstat -ao
netstat -na | find "4505"
netstat -ao | find "4505"
```

Show Process ID in Windows (Running under podman machine - wsl):
```
C:\Users\uname>netstat -noa | find "4506"
  TCP    127.0.0.1:4506         0.0.0.0:0              LISTENING       11816

C:\Users\uname>netstat -noa | find "8000"
  TCP    127.0.0.1:8000         0.0.0.0:0              LISTENING       11816

C:\Users\uname>netstat -noa | find "4505"
  TCP    127.0.0.1:4505         0.0.0.0:0              LISTENING       11816
```  

To Show Process Name in Windows:
```
C:\Users\uname>tasklist /fi "pid eq 11816"

Image Name                     PID Session Name        Session#    Mem Usage
========================= ======== ================ =========== ============
wslhost.exe                  11816 Console                    1      7,948 K
```

On Windows 10/11 Port 4505, 4506 may be occupied by "IP Helper" Service in Windows 11. Disable the service (Or reconfigure Salt Master to use different ports).

1. Click search and type in Services, open it.
2. Scroll down until you find an entry called "IP Helper", right click it, then click restart.
3. Scroll all the way down to the bottom and do the same thing for "Xbox Live Networking Service"

[About "IP Helper"](https://docs.microsoft.com/en-us/windows-hardware/drivers/network/ip-helper)

----
