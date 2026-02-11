using { S4HANA_KNA1 } from './external/S4HANA_KNA1';

service TestService { // 3번 테스트를 위해 인증 필요 설정
    // 결과를 문자열로 간단히 확인하거나, 데이터를 그대로 리턴
    function testConnection(method: String) returns String;
    
    // 데이터 조회 테스트용 (읽기 전용)
    entity Customers as projection on S4HANA_KNA1.zjwtest_kna1;
}