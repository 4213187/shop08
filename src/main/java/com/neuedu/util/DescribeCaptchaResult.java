package com.neuedu.util;

import com.tencentcloudapi.common.Credential;
import com.tencentcloudapi.common.profile.ClientProfile;
import com.tencentcloudapi.common.profile.HttpProfile;
import com.tencentcloudapi.common.exception.TencentCloudSDKException;

import com.tencentcloudapi.captcha.v20190722.CaptchaClient;
import com.tencentcloudapi.captcha.v20190722.models.DescribeCaptchaResultRequest;
import com.tencentcloudapi.captcha.v20190722.models.DescribeCaptchaResultResponse;

public class DescribeCaptchaResult {

    public DescribeCaptchaResult() {

    }

    public boolean codeResponse(String ticket, String randstr) {
        String str = "";
        try {

            Credential cred = new Credential("AKIDmNr8Bzo4MPDn7C974qTwAC2hIdldeixx", "wfEcliS0INF1au2yqfPy5ydFdokcOsAD");

            HttpProfile httpProfile = new HttpProfile();
            httpProfile.setEndpoint("captcha.tencentcloudapi.com");

            ClientProfile clientProfile = new ClientProfile();
            clientProfile.setHttpProfile(httpProfile);

            CaptchaClient client = new CaptchaClient(cred, "ap-beijing", clientProfile);

            String params = "{\"CaptchaType\":9,\"Ticket\":\"" + ticket + "\",\"UserIp\":\"127.0.0.1\",\"Randstr\":\"" + randstr + "\",\"CaptchaAppId\":2027858143,\"AppSecretKey\":\"0SYZZ35AFWkYsS15JGoCxAQ**\"}";

            DescribeCaptchaResultRequest req = DescribeCaptchaResultRequest.fromJsonString(params, DescribeCaptchaResultRequest.class);
            DescribeCaptchaResultResponse resp = client.DescribeCaptchaResult(req);

            str = DescribeCaptchaResultRequest.toJsonString(resp);

        } catch (TencentCloudSDKException e) {

            System.out.println(e.toString());
        }
        System.out.println(str);
        if (str.indexOf("OK") <0) {
            return false;
        } else {
            return true;
        }


    }

//    public static void main(String[] args) {
//        DescribeCaptchaResult describeCaptchaResult = new DescribeCaptchaResult();
//        describeCaptchaResult.codeResponse("t02lyndTsmRrt_OwHX6B12NExnwwAt5p-qkFnvu26cvgbrSZ2LRVXGn_ZQ8PwNhq_jZ4VTj-sftwvdaJECpRpc464w1-r4tbiZAPd7Cw-xrGyjxs3q3Im0y2g**", "@Lfs");
//    }


}
