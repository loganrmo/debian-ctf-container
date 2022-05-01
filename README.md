# Debian CTF Docker Image

A Debian-based Docker container intended to be used for CTFs and PenTesting. 

I created this image because I personally like using Windows + WSL but don't like cluttering my system - that's where containerization comes in handy. Most people use a Kali VM for CTFs and Pentesting, but I wanted to give my own, lightweight, Debian-based image a spin. 

Due to the fact that the image builds the jumbo edition of John the Ripper from source, the first time building it may take a few minutes.

For GUI programs, I just use the Windows versions - including Wireshark, Ghidra, Zap, Postman, and Burp Suite.

Programs Included:
* john (Jumbo version from source, installed in `/home/${USERNAME}/john/run`)
* netcat
* node.js
* python3.9
* pwntools
* pypykatz (Mimikatz implementation in Python)
* sqlmap (Installed in `/home/${USERNAME}/sqlmap)
* tcpdump
* tshark (CLI alternative to Wireshark)

### Configure and Run:
* Requirements: `Docker`, `docker-compose`
* The `.env` file has a variable `LOCALPATH`, which should point at a local directory that you want to mount on the container at `/home/work.
    * This is useful for when working on payloads or programs, or trying to transfer files between container and host. Obviously, this is at your own discretion - you should not put malware in this folder and should be very careful.
* In the `Dockerfile`, set the `USERNAME` arg to your own username
* In the root directory of this repository, run `docker-compose up -d` to build and run the container automatically. If any changes are made to the `Dockerfile` or `docker-compose.yml` files, you should re-run this command to relaunch the container (and rebuild if applicable)
* Once the container is running, attach a shell to it and run `passwd` to configure your password - the default is `default`

### Security:
This is a hobby project used for CTFs and practice, not in actual engagements or any security risk situations. This container may have vulnerabilities and potential misconfiguration as it is not hardened completely. However, the container does not run as root and comes with `sudo`. One thing I dislike about Kali is that it automatically runs as root - while this is crucial for fast engagement, especially if you are familiar with what you are doing, it is easy to slipup, especially during long engagements and when writing/testing exploits, especially if you are not super familiar with them.