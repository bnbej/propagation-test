const cds = require('@sap/cds');

module.exports = cds.service.impl(async function() {
  // 디버그 엔드포인트
  this.on('READ', 'DebugUserInfo', async (req) => {
    const user = req.user;
    const authHeader = req.headers.authorization;
    
    // JWT 토큰 추출
    let decodedToken = null;
    if (authHeader && authHeader.startsWith('Bearer ')) {
      const token = authHeader.substring(7);
      // Base64 디코딩 (signature 검증 없이 payload만 확인)
      const parts = token.split('.');
      if (parts.length === 3) {
        decodedToken = JSON.parse(Buffer.from(parts[1], 'base64').toString());
      }
    }

    const result = [{
      userId: user.id,
      userAttr: JSON.stringify(user.attr),
      tokenIssuer: decodedToken?.iss,
      tokenSubject: decodedToken?.sub,
      tokenEmail: decodedToken?.email,
      tokenUserName: decodedToken?.user_name,
      tokenZoneId: decodedToken?.zid,
      tokenClientId: decodedToken?.client_id,
      fullToken: JSON.stringify(decodedToken, null, 2)
    }];

    // const s4rap = await cds.connect.to('MY_RAP_SERVICE');
    // let knaList = await s4rap.run(SELECT('MY_RAP_SERVICE.zjwtest_kna1'));
    // console.log('knaList', knaList);
    // knaList.forEach((kna) => {
    //   result.push({ userId: kna.kunnr, tokenUserName: kna.name1 });
    // });
    
    return result;
  });
});