import Foundation

struct DataModel {
    let monthsLabel: String
    let priceLabel: String
    let subscriptionLabel: String
}

let itemsModel: [DataModel] = [
    DataModel(monthsLabel: "6 месяцев", priceLabel: "1990 руб.", subscriptionLabel: "Пробный период 3 дня,бесплатная \n отмена"),
    DataModel(monthsLabel: "1 месяц", priceLabel: "499 руб.", subscriptionLabel: "Ежемесячная подписка"),
    DataModel(monthsLabel: "Навсегда", priceLabel: "4990 руб.", subscriptionLabel: "Один платеж")
]
