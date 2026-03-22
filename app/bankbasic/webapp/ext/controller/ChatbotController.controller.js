sap.ui.define([
    "sap/ui/core/mvc/ControllerExtension",
    "sap/m/Dialog",
    "sap/m/Button",
    "sap/m/Input",
    "sap/m/List",
    "sap/m/CustomListItem",
    "sap/m/Text",
    "sap/m/VBox",
    "sap/m/HBox",
    "sap/m/ScrollContainer",
    "sap/m/FlexBox",
    "sap/ui/model/json/JSONModel",
    "sap/ui/core/HTML"
], function (
    ControllerExtension, Dialog, Button, Input, List,
    CustomListItem, Text, VBox, HBox, ScrollContainer,
    FlexBox, JSONModel, HTML
) {
    "use strict";

    return ControllerExtension.extend("bankbasic.ext.controller.ChatbotController", {

        // ── 채팅 데이터 모델 ──
        _oChatModel: null,
        _oChatDialog: null,
        _oFloatingBtn: null,

        override: {
            onAfterRendering: function () {
                console.log("ChatbotController onAfterRendering");
                // 플로팅 챗봇 버튼 생성 (최초 1회)
                if (!this._oFloatingBtn) {
                    this._createFloatingButton();
                }
                // 채팅 데이터 모델 초기화
                if (!this._oChatModel) {
                    this._oChatModel = new JSONModel({
                        messages: [
                            { text: "안녕하세요! BiznBank AI 어시스턴트입니다. 무엇을 도와드릴까요?", type: "bot" }
                        ]
                    });
                }
            }
        },

        _createFloatingButton: function () {
            var that = this;

            // 이미 존재하면 스킵
            if (document.getElementById("chatbotFloatingBtn")) {
                return;
            }

            // CSS 스타일 추가
            var oStyleEl = document.createElement("style");
            oStyleEl.textContent =
                '.chatbot-floating-btn {' +
                '  position: fixed;' +
                '  bottom: 2rem;' +
                '  right: 2rem;' +
                '  width: 56px;' +
                '  height: 56px;' +
                '  border-radius: 50%;' +
                '  background-color: #0a6ed1;' +
                '  color: #fff;' +
                '  border: none;' +
                '  cursor: pointer;' +
                '  box-shadow: 0 4px 12px rgba(0,0,0,0.25);' +
                '  z-index: 9999;' +
                '  display: flex;' +
                '  align-items: center;' +
                '  justify-content: center;' +
                '  font-size: 1.5rem;' +
                '  transition: transform 0.2s, box-shadow 0.2s;' +
                '}' +
                '.chatbot-floating-btn:hover {' +
                '  transform: scale(1.1);' +
                '  box-shadow: 0 6px 20px rgba(0,0,0,0.3);' +
                '}' +
                '.chatbot-msg-bot {' +
                '  background-color: #f0f0f0;' +
                '  border-radius: 12px 12px 12px 4px;' +
                '  padding: 0.6rem 1rem;' +
                '  margin: 0.3rem 0;' +
                '  max-width: 80%;' +
                '  word-wrap: break-word;' +
                '}' +
                '.chatbot-msg-user {' +
                '  background-color: #0a6ed1;' +
                '  color: #fff;' +
                '  border-radius: 12px 12px 4px 12px;' +
                '  padding: 0.6rem 1rem;' +
                '  margin: 0.3rem 0;' +
                '  max-width: 80%;' +
                '  word-wrap: break-word;' +
                '}';
            document.head.appendChild(oStyleEl);

            // 플로팅 버튼 생성
            var oBtnEl = document.createElement("button");
            oBtnEl.id = "chatbotFloatingBtn";
            oBtnEl.className = "chatbot-floating-btn";
            oBtnEl.title = "AI 챗봇";
            oBtnEl.textContent = "💬";
            oBtnEl.addEventListener("click", function () {
                that._openChatDialog();
            });
            document.body.appendChild(oBtnEl);

            this._oFloatingBtn = oBtnEl;
        },

        // ── 채팅 Dialog 열기 ──
        _openChatDialog: function () {
            if (!this._oChatDialog) {
                this._createChatDialog();
            }
            this._oChatDialog.open();
        },

        // ── 채팅 Dialog 생성 ──
        _createChatDialog: function () {
            var that = this;

            // 메시지 리스트
            this._oMessageList = new List({
                showNoData: false,
                showSeparators: "None"
            });

            // 스크롤 컨테이너
            var oScrollContainer = new ScrollContainer("chatbotScrollContainer", {
                height: "100%",
                width: "100%",
                vertical: true,
                horizontal: false,
                content: [this._oMessageList]
            });

            // 입력창
            var oInput = new Input("chatbotInput", {
                placeholder: "메시지를 입력하세요...",
                width: "100%",
                submit: function () {
                    that._onSendMessage(oInput);
                }
            });

            // 전송 버튼
            var oSendBtn = new Button({
                icon: "sap-icon://paper-plane",
                type: "Emphasized",
                press: function () {
                    that._onSendMessage(oInput);
                }
            });

            // 입력 영역 (Input + Send 버튼)
            var oInputArea = new HBox({
                width: "100%",
                alignItems: "Center",
                items: [oInput, oSendBtn]
            });
            oInput.setLayoutData(new sap.m.FlexItemData({ growFactor: 1 }));

            // Dialog 전체
            this._oChatDialog = new Dialog({
                title: "AI 챗봇",
                contentWidth: "420px",
                contentHeight: "500px",
                draggable: true,
                resizable: true,
                verticalScrolling: false,
                state: "None",
                content: [
                    new VBox({
                        height: "100%",
                        items: [oScrollContainer, oInputArea]
                    })
                ],
                endButton: new Button({
                    text: "닫기",
                    press: function () {
                        that._oChatDialog.close();
                    }
                }),
                afterOpen: function () {
                    that._renderMessages();
                    oInput.focus();
                }
            });

            // 스크롤 컨테이너가 대부분의 공간을 차지하도록
            oScrollContainer.setLayoutData(new sap.m.FlexItemData({ growFactor: 1 }));

            // 초기 메시지 렌더링
            this._renderMessages();
        },

        // ── 메시지 전송 처리 ──
        _onSendMessage: function (oInput) {
            var sMessage = oInput.getValue().trim();
            if (!sMessage) {
                return;
            }

            // 사용자 메시지 추가
            var aMessages = this._oChatModel.getProperty("/messages");
            aMessages.push({ text: sMessage, type: "user" });
            this._oChatModel.setProperty("/messages", aMessages);
            oInput.setValue("");

            // 메시지 렌더링
            this._renderMessages();

            // AI 응답 (현재는 하드코딩 → 추후 CAP 서비스 호출로 교체)
            var that = this;
            setTimeout(function () {
                that._getBotResponse(sMessage);
            }, 800);
        },

        // ── AI 응답 처리 (추후 CAP 서비스 연동 지점) ──
        _getBotResponse: function (sUserMessage) {
            var aMessages = this._oChatModel.getProperty("/messages");

            // ──────────────────────────────────────────────
            // TODO: 추후 이 부분을 CAP 서비스 호출로 교체
            //
            // 예시:
            // var oModel = this.base.getExtensionAPI().getModel();
            // oModel.callFunction("/getChatResponse", {
            //     method: "POST",
            //     urlParameters: { query: sUserMessage },
            //     success: function (oData) {
            //         aMessages.push({ text: oData.reply, type: "bot" });
            //         ...
            //     }
            // });
            // ──────────────────────────────────────────────

            var sBotReply = "Hello! 입력하신 메시지: \"" + sUserMessage + "\"";
            aMessages.push({ text: sBotReply, type: "bot" });
            this._oChatModel.setProperty("/messages", aMessages);

            this._renderMessages();
        },

        // ── 메시지 목록 렌더링 ──
        _renderMessages: function () {
            if (!this._oMessageList) {
                return;
            }

            this._oMessageList.removeAllItems();

            var aMessages = this._oChatModel.getProperty("/messages");
            aMessages.forEach(function (oMsg) {
                var bIsBot = oMsg.type === "bot";
                var oText = new Text({ text: oMsg.text });
                oText.addStyleClass(bIsBot ? "chatbot-msg-bot" : "chatbot-msg-user");

                var oFlexBox = new FlexBox({
                    justifyContent: bIsBot ? "Start" : "End",
                    width: "100%",
                    items: [oText]
                });

                this._oMessageList.addItem(new CustomListItem({
                    content: [oFlexBox]
                }));
            }.bind(this));

            // 스크롤을 맨 아래로
            setTimeout(function () {
                var oScrollContainer = sap.ui.getCore().byId("chatbotScrollContainer");
                if (oScrollContainer) {
                    var oDom = oScrollContainer.getDomRef();
                    if (oDom) {
                        oDom.scrollTop = oDom.scrollHeight;
                    }
                }
            }, 100);
        }
    });
});