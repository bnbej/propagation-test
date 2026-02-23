const cds = require('@sap/cds');
const { executeHttpRequest } = require('@sap-cloud-sdk/http-client');
const { retrieveJwt, getDestination } = require('@sap-cloud-sdk/connectivity');

module.exports = cds.service.impl(async function (srv) {

    srv.on('READ', 'Customer', async req => {
        const S4HANA_KNA1 = await cds.connect.to('S4HANA_KNA1');
        const kna1 = await S4HANA_KNA1.run(SELECT.from('S4HANA_KNA1.zjwtest_kna1'));
        // console.log('customers', kna1);
        return kna1;
    });

    srv.on('READ', 'BankBasic', async req => {
        const S4HANA_BANKBASIC = await cds.connect.to('S4HANA_BANKBASIC');
        const BankBasic = await S4HANA_BANKBASIC.run(SELECT.from('S4HANA_KNA1.zjwtest_hbkid_f4'));
        // console.log('BankBasic', BankBasic);
        return BankBasic;
    });


    this.on('CreateDocument', async (req) => {
        const jwt = retrieveJwt(req.http.req);

        const dest = await getDestination({
            destinationName: 'BNB_S4HC_OAUTH_SAML',
            jwt: jwt,
        });
        console.log('Destination authType:', dest?.authentication);
        console.log('Destination URL:', dest?.url);

        const payload = {
            bukrs: "4310",
            transnokey: "0812026021900138",
            zelno: "",
            postgubn: "I001",
            hbkid: "HANA2",
            hktid: "03002",
            hkont: "0011001000",
            gubun: "1"
        };

        try {
            // 2. HTTP POST 요청 실행
            // SDK가 Principal Propagation 인증과 CSRF 토큰 Fetch를 알아서 2-Step으로 수행합니다.
            const response = await executeHttpRequest(
                {
                    jwt: jwt,
                    destinationName: 'BNB_S4HC_OAUTH_SAML' 
                },
                {
                    method: 'POST',
                    url: '/sap/bc/http/sap/zbzpw01post', // S/4HANA 커스텀 HTTP 서비스 경로
                    data: payload,
                    headers: { 'Content-Type': 'application/json' }
                },
                { fetchCsrfToken: false } // S/4HANA POST 요청 시 CSRF 자동 처리 보장
            );

            // 3. 성공 응답 결과 처리 (ABAP의 ty_response 구조)
            const responseData = response.data;
            console.log("전표 생성 결과:", responseData.belnr, responseData.msg);

            // ✅ [추가된 부분] 프론트엔드(UI)로 성공 메시지 전달
            // Fiori Elements 화면 하단에 잠깐 나타나는 Message Toast 형태로 표시됩니다.
            req.notify(`전표가 성공적으로 생성되었습니다. (전표번호: ${responseData.belnr})`);
            
            // 만약 팝업창(Dialog) 형태로 띄우고 싶다면 아래 코드를 사용할 수도 있습니다.
            // req.info(`전표 생성 완료: ${responseData.belnr}`);

            return responseData;
        } catch (error) {
            console.error("API 호출 중 오류 발생:", error.message);
            console.error("status:", error.response?.status);
            console.error("response data:", JSON.stringify(error.response?.data));
            console.error("response headers:", JSON.stringify(error.response?.headers));
            console.error("request url:", error.config?.url);
            console.error("request headers:", JSON.stringify(error.config?.headers)); 
            
            // ✅ req.reject는 Fiori 화면에서 자동으로 에러 팝업(Message Box)을 띄웁니다.
            // req.reject(500, errorMessage);
        }
    });





    /**
     * 통신 서버에 요청하는 API
     */
    this.on('SendToBank', 'BankBasic', async (req) => {
        const { hbkid } = req.params[0];

        // 통신서버 연결
        const commServer = await cds.connect.to('BNB_COMM_API');

        const payload = {
            TYPE: "WON/KEB",
            DATA: hbkid // 실제 전문 데이터로 추후 교체
        };
        console.log('payload', payload);
        
        const result = await commServer.send({
            method: 'POST',
            path: '/api/sendData',
            data: payload,
            headers: { 'Content-Type': 'application/json' }
        });
        
        // 응답 반환 {"resultCd":"S","resultMsg":"SUCCESS"}
        console.log('result: ', result);
        return {
            resultCd:  result.resultCd,
            resultMsg: result.resultMsg
        };
    });



    /**
     * 통신 서버에서 요청하는 API
     */
    this.on('BankResult', async (req) => {
        const { TYPE, DATA } = req.data;

        // 데이터 확인용 로그
        console.log('===== 통신서버에서 데이터 수신 =====');
        console.log('TYPE:', TYPE);
        console.log('DATA:', DATA);
        console.log('전체 req.data:', JSON.stringify(req.data));
        console.log('====================================');

        try {
            // 은행 응답 전문 파싱 후 S/4HANA 업데이트 로직
            // ex. 계좌이체 결과를 S/4HANA에 반영

            return { resultCd: 'S', resultMsg: 'SUCCESS' };
        } catch (error) {
            console.error('BankResult 처리 오류:', error.message);
            return { resultCd: 'F', resultMsg: error.message };
        }
    });


});