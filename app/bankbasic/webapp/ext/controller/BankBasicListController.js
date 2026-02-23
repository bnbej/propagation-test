sap.ui.define([
    "sap/m/MessageToast",
    "sap/m/MessageBox"
], function(MessageToast, MessageBox) {
    'use strict';

    return {
        post: function(oContext, aSelectedContexts) {
            console.log('oContext', oContext);
            console.log('aSelectedContexts', aSelectedContexts);
            const oModel = aSelectedContexts[0].oModel;
            const oBinding = aSelectedContexts[0].oBinding;

            const oAction = oModel.bindContext('/CreateDocument(...)');
            oAction.execute()
                .then(() => {
                    MessageToast.show("전표 생성 액션 호출 성공!");
                })
                .catch((oError) => {
                    MessageBox.error(oError.message || "오류가 발생했습니다.");
                });
        }
    };
});
