# 개요
* helm으로 mysql설치
* mysql인증정보는 secret으로 관리

# 사용방법
```sh
helm install mysql ../6_secret_mysql
```

# value 파라미터
* username이 정해지지 않으면 default로 "user"
* user password가 정해지지 않으면 난수
* root password가 정해지지 않으면 난수
* database가 정해지지 않으면 Chart.yml.name으로 설정