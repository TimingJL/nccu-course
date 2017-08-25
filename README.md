# NCCU Course
https://nccu-course.herokuapp.com/users/sign_in

# README


# Reference
* Deploy to Heroku
https://ihower.tw/rails/heroku.html

* Freebie: 5 Responsive Footer Templates
https://demo.tutorialzine.com/2015/01/freebie-5-responsive-footer-templates/footer-distributed-with-address-and-phones.html

* CSS濾鏡效果
http://blog.shihshih.com/css-filter/

* JSON Parsing
http://kaochenlong.com/2016/04/23/different-hash-format/
http://www.jsoneditoronline.org/
https://railsrubyblog.wordpress.com/2016/08/31/rails%E6%8E%A5%E6%94%B6json%E6%A0%BC%E5%BC%8F%E8%B3%87%E6%96%99/
https://mgleon08.github.io/blog/2016/01/09/ruby-on-rails-json/
https://github.com/rest-client/rest-client

* Make table clickable
https://stackoverflow.com/questions/4632738/how-to-add-hyperlink-to-table-row-tr

* Ruby on Rails - 整合 Devise 實作 Facebook 登入機制
http://fisherliang.logdown.com/posts/301654-ruby-on-rails-real-facebook-login-mechanism

* Add name field to devise
https://github.com/TimingJL/raddit

* Rails - How To Destroy Users Created Under Devise?
https://stackoverflow.com/questions/16289299/rails-how-to-destroy-users-created-under-devise

* Devise Tutorials
https://github.com/danweller18/devise/wiki

* RailsAdmin
https://github.com/rails-admin/rails_admin

* 如何限制只有admin身份的人進 /admin
http://railsfun.tw/t/admin-admin/963
https://www.youtube.com/watch?v=agzm_O-pZFE

* Authorization
https://ihower.tw/rails/auth.html

* JDENTICON(Open source library for generating identicons)隨機大頭貼
https://jdenticon.com/js-get-started.html

* Using Google Analytics in Rails 4
https://richonrails.com/articles/adding-google-analytics-to-your-rails-app-the-right-way

* 分頁外掛
https://ihower.tw/rails/basic.html#sec10

* Bootstrap 4 styling for Kaminari gem
https://github.com/KamilDzierbicki/bootstrap4-kaminari-views

* 國立政治大學通識課程架構表
http://aca.nccu.edu.tw/download/formDownload/QP-T04-19-03.pdf

* 政大課程查詢系統
http://wa.nccu.edu.tw/QryTor/
------------------------------


def class //定義一堂課的欄位
	semaster:string(or integer? ex:10601, 10602, 10501, 10502...)

	language_chinese:boolean //授課語言(一堂課是否使用兩種語言以上？)
	language_english:boolean //授課語言
	language_others:boolean //授課語言

	//教師可能要自己一個類別
	courseTeacherName_chinese:string // Instructor任課教師中文姓名(ex: 姜世明)(是否有可能一堂課兩個教師以上？ => yes)
	courseTeacherName_english:string // 任課教師英文姓名(ex: CHIANG SHYH-MING)
	teacherExpertise_chinese:string // 教師專長 中文
	teacherExpertise_english:string // 教師專長 英文

	courseCode:integer (ex:911920005, 912862005...) //科目代號
	CourseName_chinese:string// 科目中文名稱(ex: 學校科技領導與管理)
	CourseName_english:string// 科目英文名稱(ex: Selections of Research in Ancient Chinese Literature)
	academicCredit:integer // 學分(ex: 2.0, 3.0)
	Session: //上課時間(ex: 星期一、三，13:30-16:40; 星期二、四9:00-12:10)
	classroom:string //上課地點(ex: 井塘樓020110, 330306教室, 研究大樓250307...)
	:boolean//得充抵通識
	generalCoursesCategory:string//通識類別
	isCharged:boolean//收費
	IsMinorExpand:boolean//擴大輔系
	//系所年級/開課院系(ex: 	學行碩二,學行碩三;國教碩一,國教碩二)
	:interger//期數(1:學期課 2:學年課)
	//修別(ex: 	選/Elective; 群/Partially Required)
	IsCoreGeneralCourse:boolean//核心通識

	開課系級(ex: 傳播學院Communication, 法學院College of Law, 理學院Science...)
	大學部/研究所/整合分組(ex:學士班Undegraduate Program, 碩士班MA Program, 博士班Ph.D Program)
	系所/整合分組清單(ex: 外交學系Diplomacy, 東亞研究所East Asia Studies...)


	Note:string //備註
end