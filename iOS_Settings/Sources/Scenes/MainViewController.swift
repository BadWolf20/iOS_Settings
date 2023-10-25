//
//  MainViewController.swift
//  iOS_Settings
//
//  Created by Roman on 24.10.2023.
//

import UIKit
import SnapKit
import NotificationManager

class MainViewController: UIViewController {
    // MARK: - Properties
    var set = [Setting]()


    // MARK: - Components
    // Таблица для отображения настроек
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)

        tableView.register(DefaultTableViewCell.self, forCellReuseIdentifier: DefaultTableViewCell.reuseIdentifier)
        let nib = UINib(nibName: "NibTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "NibCellIdentifier")
        tableView.register(ProgrammaticTableViewCell.self, forCellReuseIdentifier: ProgrammaticTableViewCell.reuseIdentifier)


        tableView.frame = CGRect.init(origin: .zero, size: view.frame.size)
        tableView.rowHeight = 50
        tableView.dataSource = self
        tableView.delegate = self

        return tableView
    }()




    // MARK: - Initializers



    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }


    // MARK: - Setup
    private func setupUI() {

        setupHierarchy()
        setupConstraints()
        setupComponents()
        setupText()
    }

    private func setupHierarchy() {
        view.addSubview(tableView)
    }

    private func setupComponents() {
        self.navigationController?.navigationBar.prefersLargeTitles = true

        self.title = "Settings"
        view.backgroundColor = .systemBackground

    }

    private func setupText() {

    }

    private func setupConstraints() {
        tableView.snp.remakeConstraints { make in
            make.bottom.top.left.right.equalTo(view.safeAreaLayoutGuide)
        }

    }

    // MARK: - Update



    // MARK: - Actions
    // Обработка переключения свитча
    @objc private func tog(_ toggle: UISwitch) {
        NotificationManager.shared.sendNotification(withTitle: "Airplane mode is \(toggle.isOn ? "on" : "off")")
    }


    // MARK: - Functions
    // Переход к экрану настроек на основе выбранной строки
    func moveToSetttingView(_ pageName: String) {
        switch pageName{
        case "Wi-Fi", "General":
            navigationController?.pushViewController(DetailViewController(screenName: pageName), animated: true)
        default:
            print("No page")
        }
    }

}

//  Добавление таблицы
extension MainViewController: UITableViewDataSource, UITableViewDelegate {

    // Обработка выбора строки в таблице
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        // Отправка уведомления о выборе настройки
        NotificationManager.shared.sendNotification(withTitle: "You push '\(settingsList[getSelectedRowNumber()].name)' button")

        // Переход к экрану настроек
        moveToSetttingView(settingsList[getSelectedRowNumber()].name)

        // Получение номера выбранной строки
        func getSelectedRowNumber() -> Int {
            var selectedRowNumber = Int()
            switch indexPath.section {
            case 0:
                selectedRowNumber = indexPath.row
            case 1...:
                selectedRowNumber = cot(indexPath.section) + indexPath.row
            default:
                selectedRowNumber = 666
            }
            return selectedRowNumber
        }

        // Вспомогательная функция для определения количества строк
        func cot(_ sectionNum: Int) -> Int {
            var c = Int()
            var out = Int()
            for i in Block.allValues {
                out += Setting.getSettingsSectionLenght(block: i)
                if c == sectionNum - 1 {
                    break
                }
                c += 1
            }
            return out
        }

    }

    // При момент до выбора строки (собираемся выбрать)
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.row == 0 && indexPath.section == 0 {
            return nil
        }
        return indexPath
    }

    // Количество секций
    func numberOfSections(in tableView: UITableView) -> Int {
        return Setting.getSectionsCount()
    }

    // Количество ячеек в каждой секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return Setting.getSettingsSectionLenght(block: .fast)
        case 1:
            return Setting.getSettingsSectionLenght(block: .notifications)
        case 2:
            return Setting.getSettingsSectionLenght(block: .main)
        default:
            return 0
        }
    }

    // Определение содержимого ячейки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        switch indexPath.section {
        case 0:
            set = Setting.getSettingsList(block: .fast)
        case 1:
            set = Setting.getSettingsList(block: .notifications)
        case 2:
            set = Setting.getSettingsList(block: .main)
        default:
            set = Setting.getSettingsList(block: .fast)
        }

        let setChose = set[indexPath.row]

        switch indexPath.section {
        case 0:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: DefaultTableViewCell.reuseIdentifier, for: indexPath) as! DefaultTableViewCell
            // Присвоение значений в ячейки
            var content = cell.defaultContentConfiguration()
            content.text = setChose.name
            content.image = setChose.imageMain
            content.imageProperties.maximumSize = CGSize(width: 30, height: 30)
            cell.contentConfiguration = content

            // Создание переключателя
            lazy var switchObj: UISwitch = {
                let switchObj = UISwitch(frame: CGRect(x: 1, y: 1, width: 20, height: 20))
                switchObj.isOn = false
                switchObj.addTarget(self, action: #selector(tog(_:)), for: .valueChanged)

                return switchObj
            }()

            // Определение стиля
            switch setChose.style {
            case .check:
                cell.accessoryView = switchObj
            case .move:
                cell.accessoryType = .disclosureIndicator
            }

            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NibCellIdentifier", for: indexPath) as! NibTableViewCell
            cell.configure(with: setChose)
            return cell
        case 2:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: ProgrammaticTableViewCell.reuseIdentifier, for: indexPath) as! ProgrammaticTableViewCell
            cell.configure(with: setChose)
            cell.switchAction = { isOn in
                NotificationManager.shared.sendNotification(withTitle: "You changed state to \(isOn ? "on" : "off")")
            }
            return cell
        default:
            return UITableViewCell()

        }

    }


}

