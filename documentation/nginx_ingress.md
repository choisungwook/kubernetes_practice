# annotation 의미

# 1. HTTPS 설정
## 1.1 ssl-passthrough
## 1.2 backend-protocol
* nginx-ingress-controller와 통신하는 프로토콜을 지정
* 기본설정이 HTTP이므로 HTTPS를 사용하는 경우 HTTPS로 변경

```yaml
nginx.ingress.kubernetes.io/backend-protocol: HTTPS
nginx.ingress.kubernetes.io/force-ssl-redirect: "true"
```

## 1.3 force-ssl-redirect
* http 요청이 오면 자동으로 https로 리다이렉트
* backend-protocol과 같이 사용
- 
```yaml
nginx.ingress.kubernetes.io/backend-protocol: HTTPS
nginx.ingress.kubernetes.io/force-ssl-redirect: "true"
```

# 참고자료
* [1] nginx 공식문서" https://kubernetes.github.io/ingress-nginx/user-guide/nginx-configuration/annotations