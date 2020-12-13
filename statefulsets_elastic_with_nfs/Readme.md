# 1. 개요
nfs설치와 쿠버네티스 연동

# 2. nfs 설치
> 우분투에서 진행

* 공유 디렉터리 생성
```
sudo mkdir -p /mnt/nfs
sudo chown 777 /mnt/nfs
sudo chmod nobody:nogroup /mnt/nfs
```

* nfs 설정 (설정파일: /etc/exports)
```
sudo vi /etc/exports
/mnt/nfs *(rw,sync,no_subtree_check,no_root_squash,no_all_squash,insecure)
```

* nfs 설정 적용
```
sudo exportfs -rav
```

* nfs서버 서비스 실행
```
sudo systemctl start nfs-server
```

# 3. 쿠버네티스<->nfs서버 연동
* 각 워커노드 nfs-client설치
```sh
sudo apt-get install nfs-common
```
* helm3
```sh
helm install nfs --genereate-name
```


# 참고자료
* [1] git: https://github.com/justmeandopensource/kubernetes/tree/master/yamls/nfs-provisioner
* [2] 영상: https://youtu.be/3GPpm2nZb2s