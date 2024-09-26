const axios = require('axios');

// 配置变量
const cookie = "authjs.csrf-token=...";
const userId = "userId";
const url = "https://api.follow.is/wallets";

// HTTP 请求头
const headers = {
  'accept': '*/*',
  'accept-language': 'zh-CN,zh;q=0.9',
  'baggage': 'sentry-environment=alpha,sentry-release=e2ba869f62002cf525103a2ccfdb7f8c018a6877,sentry-public_key=e5bccf7428aa4e881ed5cb713fdff181,sentry-trace_id=b6a1f8df170d4007877510581d07050a,sentry-sample_rate=1,sentry-sampled=true',
  'cookie': cookie,
  'origin': 'https://app.follow.is',
  'priority': 'u=1, i',
  'sec-ch-ua': '^Chromium^;v=^128^, ^Not'
};

// 发送 GET 请求
axios.get(url, {
  headers: headers,
  params: {
    userId: userId
  }
})
.then(response => {
  console.log("Response Data:", response.data);
})
.catch(error => {
  console.error(`Failed to fetch data: ${error.message}`);
});
