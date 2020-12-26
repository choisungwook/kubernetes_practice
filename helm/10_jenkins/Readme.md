# 개요
* helm으로 젠킨스 설치

<br>

# 설정
* storageclass 설정
```yaml
; jenkins_charts/values.yaml
648 storageClass: [이름]
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