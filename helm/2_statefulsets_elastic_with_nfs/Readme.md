# 1. 개요
nfs설치와 쿠버네티스 연동

# 2. nfs 설치
> 우분투에서 진행

* 공유 디렉터리 생성
```
sudo mkdir -p /mnt/nfs
sudo chmod 777 /mnt/nfs
sudo chown nobody:nogroup /mnt/nfs
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
## 3.1 각 워커노드 nfs-client설치
```sh
sudo apt-get install nfs-common
```
## 3.2 설정
* value.xml에서 nfs서버 IP와 nfs 마운트 불륨 설정
```
nfsip: "192.168.219.199"
mountvolume: "/mnt/nfs"
```

## 3.3 helm3로 nfs 리소스 
```sh
helm install nfs --genereate-name
```

# 4. helm 엘라스틱서치 설치
* 엘라스틱서치 메모리: requets.storage:[X]Gi
* nfs storageclass: storageClassname:[nfs]
```
예:
helm install elasticsearch elastic/elasticsearch \
--set volumeClaimTemplate.resources.requests.storage=3Gi \
--set volumeClaimTemplate.storageClassName=nfs
```

# 참고자료
* [1] git: https://github.com/justmeandopensource/kubernetes/tree/master/yamls/nfs-provisioner
* [2] 영상: https://youtu.be/3GPpm2nZb2s
* [3] 공식 https://github.com/elastic/helm-charts/tree/master/elasticsearch
