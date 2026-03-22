using {S4HANA_KNA1 as customer} from '../srv/external/S4HANA_KNA1';
using {S4HANA_BANKBASIC as bankbasic} from '../srv/external/S4HANA_BANKBASIC';

service PropagationService {
    // OAuth2.0SAMLAssertion
    entity Customer as projection on customer.zjwtest_kna1;
    // Basic Authentication
    entity BankBasic as projection on bankbasic.zjwtest_hbkid_f4 actions {
        // BTP에서 통신서버 호출
        // **TODO: 데이터는 파라미터 값으로 전달 받는다
        action SendToBank() returns {
            resultCd : String;
            resultMsg : String;
        };
        action SendToBank2(param123: String) returns {
            response : String;
        };
    };

    action SendToBank3(i_data: String) returns {
        e_data : String;
    };

    // entity sdf {
    //     .INCLUDE	Types	ZBZW00SFBCOMM		0	0	0	공통부
    //     TRANID	Types	ZBZW00TRANID	CHAR	9	0	0	Transaction id
    //     SITECD	Types	ZBZW00SITECD	CHAR	8	0	0	업체코드
    //     BANKCD	Types	ZBZW00BANKCD2	NUMC	2	0	0	은행코드 
    //     DOCCOD	Types	ZBZW00DOCCOD	CHAR	4	0	0	전문구분코드
    //     JOBCOD	Types	ZBZW00JOBCOD	CHAR	3	0	0	업무구분코드
    //     SENDCT	Types	ZBZW00SENDCT	NUMC	1	0	0	전문송신회수
    //     DOCUNO	Types	ZBZW00DOCUNO	NUMC	6	0	0	전문번호
    //     SENDDT	Types	ZBZW00SENDDT	DATS	8	0	0	전송일자
    //     SENDTM	Types	ZBZW00SENDTM	TIMS	6	0	0	전송시간
    //     RPLYCD	Types	ZBZW00RPLYCD	CHAR	4	0	0	응답코드
    //     BRPLYCD	Types	ZBZW00BRPLYCD	CHAR	4	0	0	은행 응답코드
    //     SEARDT	Types	ZBZW00SEARDT	DATS	8	0	0	조회일자
    //     SEARNO	Types	ZBZW00SEARNO	NUMC	6	0	0	조회번호
    //     BDOCUNO	Types	ZBZW00BDOCUNO	CHAR	15	0	0	은행전문번호 
    //     BANKCD3	Types	ZBZW00BANKCD3	NUMC	3	0	0	은행코드 3자리
    //     EMPTY	Types	ZBZW00EMPTY	CHAR	13	0	0	예비영역
    //     DATA200	Types		CHAR	200	0	0	DATA부
    // }

    //**TODO
    // P_xx parameter 메서드 입장에서 받아온 거
    // I_xx import // 파라미터 속에서도 input, output 구분되어 있다
    // E_xx export

    // L_xx local
    // G_xx global

    
    action CreateDocument() returns String;

    // 통신서버에서 호출하는 엔드포인트
    action BankResult(        // 은행 응답 데이터 수신
        TYPE    : String,     // 요청 유형
        DATA    : String     // 은행에서 온 전문 데이터
    ) returns { resultCd: String; resultMsg: String; };


    action getRapOdataAction(kunnr: String, text: String) returns String;

    action sccTest() returns String;
}