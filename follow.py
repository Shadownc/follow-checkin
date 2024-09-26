import requests

# 配置变量
cookie = "authjs.csrf-token=..."
user_id = "user_id"
url = "https://api.follow.is/wallets"

# HTTP 请求头
headers = {
    'accept': '*/*',
    'accept-language': 'zh-CN,zh;q=0.9',
    'baggage': 'sentry-environment=alpha,sentry-release=e2ba869f62002cf525103a2ccfdb7f8c018a6877,sentry-public_key=e5bccf7428aa4e881ed5cb713fdff181,sentry-trace_id=b6a1f8df170d4007877510581d07050a,sentry-sample_rate=1,sentry-sampled=true',
    'cookie': cookie,
    'origin': 'https://app.follow.is',
    'priority': 'u=1, i',
    'sec-ch-ua': '^Chromium^;v=^128^, ^Not'
}

# 发送 GET 请求
params = {'userId': user_id}

response = requests.get(url, headers=headers, params=params)

# 输出响应
if response.status_code == 200:
    print("Response Data:", response.json())
else:
    print(f"Failed to fetch data. Status code: {response.status_code}")
