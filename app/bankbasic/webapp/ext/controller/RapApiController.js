sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        onTestRapAction: function(oContext, aSelectedContexts) {
            // 선택한 데이터에서 모델을 뽑아옴 (선택 안 하면 뻗음)
            // const oModel = aSelectedContexts[0].oModel;

            // Fiori Elements의 Extension API를 통해 화면(View)의 기본 모델을 가져옴
            // 환경에 따라 this.getModel() 또는 this.editFlow.getView().getModel()을 사용
            const oModel = this.getModel();

            const oAction = oModel.bindContext('/getRapOdataAction(...)');
            // 파라미터 세팅
            oAction.setParameter("kunnr", "100000");
            oAction.setParameter("text", "Fiori에서 BTP를 거쳐 보내는 테스트!");

            oAction.execute()
                .then(() => {
                    // 성공 시 리턴값(String)을 컨텍스트에서 읽어옵니다.
                    var sResultMessage = oAction.getBoundContext().getProperty("value");
                    MessageToast.show("성공: " + sResultMessage);
                })
                .catch((oError) => {
                    MessageToast.show("API 호출 실패: " + oError.message);
                });
        }
    };
});
