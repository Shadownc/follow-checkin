const axios = require('axios');

// 直接在文件中定义 csrfToken 和 cookie
const csrfToken = 'your_csrfToken_value';
const cookie = 'your_cookie_value';

async function signIn() {
    const url = "https://api.follow.is/wallets/transactions/claim_daily";
    
    const headers = {
        'User-Agent': 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 MicroMessenger/8.0.38(0x1800262c) NetType/4G Language/zh_CN',
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Connection': 'keep-alive',
        'Cookie': cookie
    };

    const payload = {
        csrfToken: csrfToken
    };

    try {
        // 发送 POST 请求
        const response = await axios.post(url, payload, { headers });

        const result = response.data;
        const code = result.code;
        const message = result.message || 'No message';

        if (code === 0) {
            console.log("签到成功");
        } else {
            if (message.includes("Already claimed")) {
                console.log("今日已签到");
            } else {
                console.log(`签到失败: ${message}`);
            }
        }
    } catch (error) {
        console.error("请求失败:", error);
    }
}

signIn();
