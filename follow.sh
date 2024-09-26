#!/bin/bash

# 配置变量
COOKIE="authjs.csrf-token=..."
USER_ID="USER_ID"
URL="https://api.follow.is/wallets"

# 执行 GET 请求
response=$(curl -X GET "$URL" \
  --get \
  --data-urlencode "userId=$USER_ID" \
  --header 'accept: */*' \
  --header 'accept-language: zh-CN,zh;q=0.9' \
  --header 'baggage: sentry-environment=alpha,sentry-release=e2ba869f62002cf525103a2ccfdb7f8c018a6877,sentry-public_key=e5bccf7428aa4e881ed5cb713fdff181,sentry-trace_id=b6a1f8df170d4007877510581d07050a,sentry-sample_rate=1,sentry-sampled=true' \
  --header "cookie: $COOKIE" \
  --header 'origin: https://app.follow.is' \
  --header 'priority: u=1, i' \
  --header 'sec-ch-ua: ^Chromium^;v=^128^, ^Not')
  
# 输出响应
echo "$response"
