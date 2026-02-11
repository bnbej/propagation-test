service CatalogService {
  // 디버그용
  entity DebugUserInfo {
    key userId: String;
    userAttr: String;
    tokenIssuer: String;
    tokenSubject: String;
    tokenEmail: String;
    tokenUserName: String;
    tokenZoneId: String;
    tokenClientId: String;
    fullToken: String;
  }
}