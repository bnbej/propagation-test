const cds = require('@sap/cds');
module.exports = cds.service.impl(async function (srv) {

    const { Customer } = this.entities;

    // 모든 요청에 대해 로그 출력
    this.before('*', (req) => {
        if (req.user.is('authenticated')) {
        console.log('============ USER INFO ============');
        console.log('User ID:', req.user.id);
        console.log('User Attributes:', JSON.stringify(req.user.attr, null, 2));
        
        if (req.headers.authorization) {
            const token = req.headers.authorization.replace('Bearer ', '');
            const parts = token.split('.');
            if (parts.length === 3) {
            try {
                const payload = JSON.parse(Buffer.from(parts[1], 'base64').toString());
                console.log('============ JWT PAYLOAD ============');
                console.log(JSON.stringify(payload, null, 2));
            } catch (e) {
                console.error('Failed to decode JWT:', e);
            }
            }
        }
        console.log('===================================');
        }
    });

    srv.on('READ', 'Customer', async req => {
        
        const S4HANA_KNA1 = await cds.connect.to('S4HANA_KNA1');
        const kna1 = await S4HANA_KNA1.run(SELECT.from('S4HANA_KNA1.zjwtest_kna1'));
        console.log('customers', kna1);
        return kna1;
    });

});