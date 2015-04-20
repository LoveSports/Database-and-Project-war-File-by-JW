# lovesports

Update on 4/19/2015

修改

1.User表里加了一个frozen域，置1表示用户被冻结，不能登录，其他人进入被冻结的User的Profile也会有此用户被冻结的提示；置0表示正常。

2.admin登录后在Hello xxx！的旁边会有一个Manage User按钮，点进去可以冻结或激活用户。多个admin之间不能互相操作。因为admin拥有网站的最高权限，所以没有设计一个专门的网页可以添加或删除admin，要在数据库添加。

3.登录后Hello xxx！设置成连接，连到这个人的Profile（或者之后连到别处）

后续

1.admin对blog可以有类似的权限

2.admin对comment可以有类似的权限





Update on 4/18/2015

添加

1.FollowingDAO中加入read()方法，方便查找Following是否存在

2.Profile.jsp加入follow和改信息、密码功能

3.SignUp.jsp界面，用户名必须是有效的email地址

4.Following里加入了equals()方法，开始用到了，后来没有用，留下没有关系

修改

1.UserDAO中read()加入refresh(user)

问题

1.密码大小写问题

2.密码限制问题

Update on 4/16/2015

This file will contain database only.

Update on 4/10/2015

Rest of DAO has been created. Please update the database as well.

Create on 4/8/2015

Please Update your database with attached sql file. 

Some One to One class in java orm file is pendding to resolved. I will figure it out soon.

I couldn't upload orignal eclipse file of JAVA code to this account. So if you guys need orignal eclipse file of JAVA code, 

feel free to visit my github account steven05jiang to get the code in LoveSportsORM file.
