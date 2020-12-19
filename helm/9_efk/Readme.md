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

# 참고자료
* [1] elasitcsearch, kibana 공식 helm chart: https://github.com/elastic/helm-charts
* [2] fluent-bit 공식 helm chart: https://github.com/fluent/helm-charts.git