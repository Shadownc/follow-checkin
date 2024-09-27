import requests
import json
import os

# 从环境变量中获取 csrfToken 和 cookie
csrfToken="your_csrfToken_value"
cookie="your_cookie_value"

def sign_in():
    url = "https://api.follow.is/wallets/transactions/claim_daily"
    
    headers = {
        'User-Agent': 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 MicroMessenger/8.0.38(0x1800262c) NetType/4G Language/zh_CN',
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Connection': 'keep-alive',
        'Cookie': cookie
    }
    
    payload = {
        "csrfToken": csrfToken
    }
    
    # 发送 POST 请求
    response = requests.post(url, headers=headers, data=json.dumps(payload))
    
    # 解析返回结果
    result = response.json()
    code = result.get('code')
    message = result.get('message', 'No message')
    
    if code == 0:
        print("签到成功")
    else:
        if "Already claimed" in message:
            print("今日已签到")
        else:
            print(f"签到失败: {message}")

if __name__ == "__main__":
    sign_in()