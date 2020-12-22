# 개요
* _helpers.tpl로 리소스 이름 설정

# 사용방법
* value.yaml에서 nameOverride필드를 변경하면 pod이름 변경
```yaml
nameOverride: "여기를 변경하세요"
fullnameOverride: ""

image: busybox
```

# 참고자료
* [1] 블로그: https://www.alibabacloud.com/blog/helm-charts-and-template-basics---part-2_595490