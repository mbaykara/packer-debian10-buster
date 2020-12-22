This repo contains customizable packer configuration file for `Debian 10 or Debian Buster`



```
$ tree
├── debian10.json
├── http
│   └── preseed.cfg
├── output
├── README.md
└── scripts
    ├── cleanup.sh
    └── init.sh

3 directories, 5 files

```
Requirements
* packer [here](https://www.packer.io/)
* Oracle Virtualbox [here](https://www.virtualbox.org/)

Then hit the terminal by:
```
packer build debian10.json
```
It will take >5 min then the outputs will be in following directories
* `output/debian10.box` for `vagrant`
* ` output-virtualbox-iso/debian-10-disk001.vmdk`
* ` output-virtualbox-iso/debian.ovf ` importable to virtualbox

To get internal ip of machines
`INTERNAL_IP=$(ip addr show enp0s8 | grep "inet " | awk '{print $2}' | cut -d / -f 1)`
