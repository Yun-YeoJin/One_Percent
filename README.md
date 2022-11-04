
![%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2022-10-31_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_6 14 27](https://user-images.githubusercontent.com/106153549/199047494-4504eeef-e9d3-49cb-bb31-4ac1eeb025be.png)

# One Percent - 국내주식 : 나만의 매매일지

🌱 새싹 iOS 앱 개발자 과정 첫 개인 출시 프로젝트 One Percent 입니다. [앱 스토어에서 구경하기](https://apps.apple.com/kr/app/one-percent/id1645004697)

- 국내주식 거래 매매일지를 작성할 수 있는 앱입니다.
    - 복리 계산을 해보며 희망회로를 돌릴 수 있는 복리 계산기 탭
    - 주식거래에 빠질 수 없는 차트패턴과 캔들패턴에 대해 알아볼 수 있는 차트패턴 탭
    - 증시뉴스를 한 눈에 확인할 수 있는 경제 뉴스 탭
    - 공공데이터 API를 사용해서 대한민국에 상장되어 있는 주식을 직접 검색하여 등록할 수 있습니다.
- Realm을 이용해 종목명, 매수/매도, 매매날짜, 수량을 등록 가능합니다.
- 푸시 알림 서비스도 지원합니다.

## **개발 기간 및 사용 기술**

- 개발 기간: 2022.09.07 ~ 2022.09.28 (약 3주) - 기획안 작성 및 디자인, 앱 개발, 앱 출시 등
- 세부 개발 기간

| 진행 사항 | 진행 기간 | 세부 내역 |
| --- | --- | --- |
| 기획 및 디자인(초안) | 2022.09.07~2022.09.12 | 앱 아이디어 구상, 기존 앱 비교 분석, 기초 UI 구상, 전체 일정 구상, 기획 발표 |
| 경제 뉴스 탭, 복리 계산기 탭 구성 | 2022.09.13~2022.09.17 | 경제 뉴스 / 복리 계산기 UI 및 기능 구현, 네이버 뉴스 검색 API 호출 메서드 구현, Tabman을 이용한 경제뉴스 탭 구현, 복리 계산기 기능 구현 |
| 차트패턴/캔들패턴탭, 설정 메뉴 구성  | 2022.09.18~2022.09.22 | 차트패턴 Model 구성, 캔들패턴 Model 구성, 차트패턴탭 CollectionView UI 구성, 차트 검색 기능 구현, 셀 클릭 시 상세뷰 띄워주기 구현, 설정 TableView 구성 |
| 메인 매매일지 화면, 종목 추가 화면 구성 | 2022.09.23~2022.09.26 | 메인 매매일지 화면 UI 및 기능 구현, Realm 도입 및 데이터 Schema 구상, OpenWeather API 호출 메서드 구현, Kakao Address API 호출 메서드 구현, 종목 추가 화면 UI 및 기능 구현, 종목 검색 TableView UI 및 기능 구현, 공공데이터 API 호출 메서드 구현 |
| 버그 수정, 앱 출시 준비, 심사 | 2022.09.27~2022.09.28 | 버그 수정, mock up 이미지 준비, 앱 설명 등 준비, 개인정보 처리방침 준비 |
- 사용 기술:
    
    `Swift`, `UIKit`, `CodeBase UI`, `SnapKit`, `Then`, `Tabman`, `KingFisher`, `JGProgressHUD`, `Alamofire`, `SwiftyJSON`, `Realm`, `Firebase Crashlytics`, `Firebase Analytics`, `Firebase Cloud Message`, `MVC`
    

## **새로 배운 것**

- 앱 기획안 작성, UX/UI 디자인, 앱 개발, 앱 출시까지 경험
- Alamofire를 이용한 비동기 API 통신 및 SwiftyJSON를 이용한 데이터 처리
    - 공공데이터 API, Kakao Address API, OpenWeather API, 네이버 뉴스 검색 API 이용
- Realm을 이용한 local DB의 CRUD
- MVC 패턴의 기초 이해
- CodeBase UI 구성
- Firebase를 이용한 Crashlytics와 푸시 알림 서비스
- CutsomView를 이용한 UI 관리
- 지속적인 앱 업데이트로 인한 안정성 개선하기→ 코드 리펙토링
- Figma를 이용한 앱 아이콘 & 런치 스크린 디자인
- UIMenu를 이용한 목록 정렬하기

## **이슈**

1. Open API를 이용한 네트워크 통신 중 HTML 마크다운이 같이 출력되는 이슈 → htmlEncodedString를 이용해 HTML 마크다운을 지워줌으로써 해결.

```swift
extension String {
    
    init?(htmlEncodedString: String) {
        
        guard let data = htmlEncodedString.data(using: .utf8) else {
            return nil
        }
        
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        
        guard let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) else {
            return nil
        }
        
        self.init(attributedString.string)
    }
```

```swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.reusableIdentifier, for: indexPath) as? NewsTableViewCell else { return UITableViewCell() }
        
            cell.titleLabel.text = String(htmlEncodedString: "\(domesticNewsList[indexPath.row].title)")!
				
				return cell
}
```

2. 복리 계산기 탭에서 천의 자리마다 쉼표를 찍어주는데 계산할 때 쉼표를 빼고 Int값으로 변환하여 계산해야 하는 이슈
- extension String에 func replace 작성

```swift
extension String {

	 func replace( target: String,  withString: String) -> String {
        return self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literal, range: nil)
	 }

}
```

- TextField 값에 replace를 이용해 콤마를 없애주고 그 값을 Float형태로 변환한다.

```swift
var money = self.mainView.moneyTextField.text ?? ""
money = money.replace(target: ",", withString: "") //콤마 없애기
guard let moneyDouble = Float(money) else { return }
                   
var rate = self.mainView.rateTextField.text ?? ""
rate = rate.replace(target: ",", withString: "") //콤마 없애기
guard let rateDouble = Float(rate) else { return }
                    
var date = self.mainView.dateTextField.text ?? ""
date = date.replace(target: ",", withString: "") //콤마 없애기
guard let dateDouble = Float(date) else { return }
                
if self.mainView.selected == 0 {

		self.mainView.resultViewLabel.text = "₩ " + round((moneyDouble * pow(1 + (rateDouble / 100), dateDouble))).plusCommas()
		self.dismissNumberPad()

} else if self.mainView.selected == 1 {

		self.mainView.resultViewLabel.text = "₩ " + round((moneyDouble * pow(1 + (rateDouble / 100), dateDouble))).plusCommas()
		self.dismissNumberPad()

} else {

		self.mainView.resultViewLabel.text = "₩ " + round((moneyDouble * pow(1 + (rateDouble / 100), dateDouble))).plusCommas()
		self.dismissNumberPad()

}
```

3. CollectionView Section이 2개인데 SearchBar를 이용해 검색 기능 수행 시 Section Header 자리가 남아있는 이슈 → header.isHidden과 SnapKit updateConstraints를 이용해서 해결

```swift
if chartData.isEmpty {
		header.isHidden = true
		header.titleLabel.snp.updateConstraints { make in
		make.edges.equalToSuperview()
		make.height.equalTo(0)
	}
} else {
		header.isHidden = false
		header.titleLabel.text = Section.chartPattern.title
		header.titleLabel.snp.updateConstraints { make in
		make.edges.equalToSuperview()
		make.height.equalTo(44)
	}
}
```


## **기획 아이디어**

평소 주식 거래와 가상화폐 거래를 하고 있었습니다. 주식 거래를 하고 그 매매한 내용을 기록하면 좋을 것 같다는 아이디어에서 출발했습니다.

추가적인 기능으로는 차트패턴과 캔들패턴을 알아볼 수 있고, 증시 뉴스도 확인할 수 있으며, 복리 계산기를 이용한 계산도 가능합니다.

## **UI 초안**

![%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2022-08-30_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_6 17 39](https://user-images.githubusercontent.com/106153549/199047701-104931fc-40f6-4949-807b-139ea003d864.png)


기획이 개발 과정 중 수정 되었지만, 초안은 위와 같습니다.

## **UI**

![%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2022-10-04_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_11 06 01](https://user-images.githubusercontent.com/106153549/199048246-ab9622ab-3d13-441f-881c-e16755ae6720.png)

![%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2022-10-04_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_11 06 25](https://user-images.githubusercontent.com/106153549/199047874-bae12aa4-1899-4e86-b8f6-9ae2fc76538a.png)

![%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2022-10-04_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_11 06 41](https://user-images.githubusercontent.com/106153549/199047888-3fc2e541-a5df-4a10-b475-f42c157ac3b1.png)

![%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2022-10-04_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_11 06 48](https://user-images.githubusercontent.com/106153549/199047949-245f106d-55eb-4757-a9f6-bcd7536e4138.png)

![%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2022-10-04_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_11 07 00](https://user-images.githubusercontent.com/106153549/199047965-4570ff1a-7494-4e21-8da2-6cec9c981f06.png)

## **출시 정보**

### **v1.0**

- 2022.09.30 최종 출시 승인

### **v1.0.1**

- 2022.10.10 업데이트
    - 매일 아침 9시, Local Notification을 이용한 알림이 여러 개 오는 것 수정
    - 차트패턴 & 캔들패턴 데이터 추가
    - 버그 수정 및 코드 간소화

### **v1.0.2**

- 2022.10.12 업데이트
    - Firebase Crashlytics, Firebase Analytics를 이용해 앱 안정성을 위한 충돌 데이터 수집
    - Firebase Cloud Message를 이용한 푸시 알림으로 변경
    - 버그 수정 및 코드 간소화
