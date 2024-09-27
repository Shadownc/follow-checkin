#!/bin/bash

csrfToken="your_csrfToken_value"
cookie="your_cookie_value"

# API URL
url="https://api.follow.is/wallets/transactions/claim_daily"

# 设置请求头和请求体
headers=(
  -H "User-Agent: Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 MicroMessenger/8.0.38(0x1800262c) NetType/4G Language/zh_CN"
  -H "Content-Type: application/json"
  -H "Accept: */*"
  -H "Connection: keep-alive"
  -H "Cookie: $cookie"
)
payload="{\"csrfToken\":\"$csrfToken\"}"

# 发送 POST 请求
response=$(curl -s -X POST "${headers[@]}" -d "$payload" "$url")

# 解析返回结果：使用 grep 和 sed 提取 code 和 message
code=$(echo "$response" | grep -o '"code":[0-9]*' | grep -o '[0-9]*')
message=$(echo "$response" | grep -o '"message":"[^"]*' | sed 's/"message":"//')

# 检查签到结果
if [ "$code" -eq 0 ]; then
  echo "签到成功"
else
  if [[ "$message" == *"Already claimed"* ]]; then
    echo "今日已签到"
  else
    echo "签到失败: $message"
  fi
fi
