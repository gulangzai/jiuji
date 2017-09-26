# 啾唧电子商务平台
## 平台简介

## 技术选型
1、 后端
* 核心框架：Spring Framework 4.1
* 安全框架：Apache Shiro 1.2
* 视图框架：Spring MVC 4.1
* 服务端验证：无
* 布局框架：无
* 工作流引擎：Activiti 5.21
* 任务调度：无
* 持久层框架：MyBatis 3.2 , mybatis
* 数据库连接池：Alibaba Druid 1.0
* 缓存框架：Ehcache 2.6 , hibernate 二级缓存， mybatis 缓存
* 日志管理：SLF4J 1.7、Log4j
* 工具类：Apache Commons、POI 3.9
* 项目管理工具： maven git

2、前端 
* JS框架：jQuery 1.9。
* CSS框架：Twitter Bootstrap 2.3.1 
* 客户端验证：JQuery Validation Plugin 1.11。
* 富文本在线编辑：CKEditor
* 在线文件管理：CKFinder
* 动态页签：Jerichotab
* 手机端框架：Jingle
* 数据表格：jqGrid
* 对话框：jQuery jBox
* 下拉选择框：jQuery Select2
* 树结构控件：jQuery zTree
* 日期控件： My97DatePicker


3、平台

* 服务器中间件：在Java EE 6规范（Servlet 2.5、JSP 2.1）下开发，支持应用服务器中间件
有Tomcat 8+。
* 数据库支持：目前仅提供MySql5.7
* 开发环境：Java、Eclipse Java EE 4.3、Maven 3.1、Git


## 安全考虑

1. 开发语言：系统采用Java 语言开发，具有卓越的通用性、高效性、平台移植性和安全性。
2. 分层设计：（数据库层，数据访问层，业务逻辑层，展示层）层次清楚，低耦合，各层必须通过接口才能接入并进行参数校验
（如：在展示层不可直接操作数据库），保证数据操作的安全。
3. 双重验证：用户表单提交双验证：包括服务器端验证及客户端验证，防止用户通过浏览器恶意修改（如不可写文本域、隐藏变量篡改、上传非法文件等），跳过客户端验证操作数据库。
4. 安全编码：用户表单提交所有数据，在服务器端都进行安全编码，防止用户提交非法脚本及SQL注入获取敏感数据等，确保数据安全。
5. 密码加密：登录用户密码进行SHA1散列加密，此加密方法是不可逆的。保证密文泄露后的安全问题。
6. 强制访问：系统对所有管理端链接都进行用户身份权限验证，防止用户直接填写url进行访问。


## 如何交流、反馈、参与贡献？

* QQ Group：180813651 &nbsp; 苹果版QQ若不能加入请使用手机QQ最新版
* E-mail： 1871710810@qq.com
* GitHub：<https://github.com/gulangzai/jiuji>
* 个人博客   <https://www.jiujichina.com/blog/> 
* 官方网址：<https://www.jiujichina.com/jiuji/>   
* 支持啾唧在线电子商务发展：（加我好友）支付宝：18855953679 &nbsp; 微信：gulangzai_123

