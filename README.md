# ansible-network-with-docker
This repo creates for setting following network envionment.

```console
Environment:
ubuntu: 16.04.1 

Module:
- Docker
- Docker Compose
- SoR 
```

## VMs
| VM name | ifname0 | ifname1 |
| :-----: | :-----: | :-----: |
| cloud   |  ×      |  1.1    |
| core-edge | 1.2   | 2.1     | 
| edge    |  2.1    |  3.1    | 
| client  | 3.2     |  ×      |

## Bridge
| Bridge ename | ip addr |  where to connect | 
| :-----: | :-----: | :----: |
| internal01 |  192.168.1.0/24 | cloud(ens9) - core-edge(ens8) |
| internal12 |  192.168.2.0/24 | core-edge(ens9) - edge(ens8) |
| internal23 |  192.168.3.0/24 | edge(ens9) - client(ens8) |
| internal00 | × | cloud(ens8) |
| internal33 | × | client(ens9) |


## Before start 
You have to prepare following three
- Connect bridge between VMs
- Install python
- Setting your virtual ip addrs to `hosts` file

```bash
$ sudo apt-get install python-dev
$ sudo apt-get install pyhton-apt
```

## How to start 
```bash
$ ansible-playbook -i hosts site.yml --ask-pass --ask-become-pass
````


## How to debug
```bash
# use password not public key cryptosystem
$ ansible-playbook -i hosts site.yml --check --ask-pass --ask-become-pass
```
