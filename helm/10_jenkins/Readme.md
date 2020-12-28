# 개요
* helm으로 젠킨스 설치

<br>

# 설정
* storageclass 설정
```yaml
; jenkins_charts/values.yaml
648 storageClass: [이름]
```
* nfs서버 설정
```yaml
507 volumes: 
    - type: Nfs
      mountPath: /var/myapp/mynfs
      readOnly: false
      serverAddress: "192.168.219.156"
      serverPath: /mnt/nfs/jenkins
```

<br>

# 실행방법
```sh
helm install [차트이름] jenkins
```

<br>

# 참고자료
* [1] 젠킨스 설치 공식문서: https://www.jenkins.io/doc/book/installing/kubernetes/
* [2] 젠킨스 공식 helm chart: https://github.com/jenkinsci/helm-charts