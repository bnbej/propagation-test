using {S4HANA_KNA1 as customer} from '../srv/external/S4HANA_KNA1';
using {S4HANA_BANKBASIC as bankbasic} from '../srv/external/S4HANA_BANKBASIC';

service PropagationService {
    // OAuth2.0SAMLAssertion
    entity Customer as projection on customer.zjwtest_kna1;
    // Basic Authentication
    entity BankBasic as projection on bankbasic.zjwtest_hbkid_f4 actions {
        // BTP에서 통신서버 호출
        action SendToBank() returns {
            resultCd : String;
            resultMsg : String;
        };
    };
    action CreateDocument() returns String;

    // 통신서버에서 호출하는 엔드포인트
    action BankResult(        // 은행 응답 데이터 수신
        TYPE    : String,     // 요청 유형
        DATA    : String     // 은행에서 온 전문 데이터
    ) returns { resultCd: String; resultMsg: String; };


    action getRapOdataAction(kunnr: String, text: String) returns String;
}