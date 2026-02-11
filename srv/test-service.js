const cds = require('@sap/cds');

module.exports = async (srv) => {
    const serviceName = 'S4HANA_KNA1';

    srv.on('READ', 'Customers', async (req) => {
        const S4HANA_KNA1 = await cds.connect.to(serviceName);
        const knaList = await S4HANA_KNA1.run(SELECT.one.from('S4HANA_KNA1.zjwtest_kna1'));
        return knaList;
    });

    srv.on('testConnection', async (req) => {
        const { method } = req.data;

        // 테스트 목적에 따라 연결 대상을 동적으로 바꿀 수도 있음 (선택 사항)
        // if (method === 'destination') serviceName = 'S4HANA_VIA_DEST';
        
        try {
            const S4HANA_KNA1 = await cds.connect.to(serviceName);
            const knaList = await S4HANA_KNA1.run(SELECT.one.from('S4HANA_KNA1.zjwtest_kna1'));
            
            // 성공 시, 누가 조회했는지 등의 정보 리턴 (S/4HANA에서 받아왔다고 가정)
            return `Success! Data retrieved. Method: ${method}`;
        } catch (err) {
            return `Error: ${err.message}`;
        }
    });
};