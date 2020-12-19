# 개요
* efk helm 설치(elasitcsearch, fluent-bit, kibana)

<br>

# 실행방법
1. storageclass 설정 -> charts/elasticsearch/value.yaml
* storageClassname이름 변경
```yaml
; default
volumeClaimTemplate:
  storageClassName: nfs
  accessModes: [ "ReadWriteOnce" ]
  resources:
    requests:
      storage: 2Gi
```
2. elasticsearch anti-affinity 설정 -> charts/elasticsearch/value.yaml
* default 설정: soft(각 노드에 pod 중복 실행 허용)
* 노드에 1개의 pod만 실행: hard
```yaml
; default
antiAffinity: "soft"
```
3. elasticsearch replicas 설정 -> charts/elasticsearch/value.yaml
```yaml
; default
replicas: 2 
```

<br>

# default user, password
* elastic
  * username: elasitc
  * password: changeme

<br>

# TroubleShooting
1. fluentbit과 elasitcsearch연동 오류
* 원인: elasitcsearch버전 호환 X
* 해결: elasitcsearch, kibana 버전 변경: 8.0 -> 7.x
* 오류 로그
```
[2020/12/25 08:44:40] [error] [output:es:es.0] HTTP status=400 URI=/_bulk, response:
{"error":{"root_cause":[{"type":"illegal_argument_exception","reason":"Action/metadata line [1] contains an unknown parameter [_type]"}],"type":"illegal_argument_exception","reason":"Action/metadata line [1] contains an unknown parameter [_type]"},"status":400}
```

# 참고자료
* [1] elasitcsearch, kibana 공식 helm chart: https://github.com/elastic/helm-charts
* [2] fluent-bit 공식 helm chart: https://github.com/fluent/helm-charts.git
* [3] fluent-bit<->kubernetes fliter: https://docs.fluentbit.io/manual/pipeline/filters/kubernetes
* [4] pod에서 API접근: https://kubernetes.io/ko/docs/tasks/access-application-cluster/access-cluster/
* [4] fluent-bit elasticsearch 플러그인: https://docs.fluentbit.io/manual/pipeline/outputs/elasticsearch