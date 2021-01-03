# 1. 개요
* nexus 설치 
* https://github.com/Oteemo/charts/tree/master/charts/sonatype-nexus 을 수정했습니다.

# 2. 실행
```sh
helm install -n nexus --create-namespace nexus ../12_nexus/
```

# 3. 접속
## 3.1 접속주소
```sh
export NODE_PORT=$(kubectl get --namespace nexus -o jsonpath="{.spec.ports[0].nodePort}" services nexus)
export NODE_IP=$(kubectl get nodes --namespace nexus -o jsonpath="{.items[0].status.addresses[0].address}")
echo http://$NODE_IP:$NODE_PORT
```