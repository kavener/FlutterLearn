// 一些汇总总结，迫在眉睫的需求，比如英文文档阅读能力（Dart文档，Flutter文档，外国社区等必须的能力要求，甚至文档翻译能力）
// Dart、Flutter 中需多的类思想，函数式编程等思想
// 不断实践，思考，理解其本质，即尝试源码的阅读，尤其是Dart和Flutter的源码极其优秀，再加之注释的完美搭配

// 导入Material UI组件库
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';

// 应用程序入口，runApp功能即启动Flutter应用，接收的参数为Widget参数
void main() => runApp(new MyApp());

// 继承一个无状态Widget组件，MyApp类代表Flutter应用
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MaterialApp 设置应用名称、主题、语言、首页及路由列表等，其本身也是个Widget组件
    return new MaterialApp(
      // 应用名称
      title: 'Flutter Demos',
      // 应用主题
      theme: new ThemeData(
        // 蓝色主题
        primarySwatch: Colors.blue,
      ),
      // 使用命名路由管理route，首先注册路由表
      routes: {
        "new_page": (context) => NewRoute(),
        // 使用新路由来学习 文本及样式
        /*
         开始 基础Widget 的学习： 
         */
        // 添加一个 基础Widget总页面：
        "base_widget_page": (context) => BaseWidget(),

        "text_page": (context) => NewText(),
        // 学习 按钮
        "button_page": (context) => NewButton(),
        //  学习图片组件及ICON
        'image_page': (context) => NewImage(),
        // 学习单选开关和复选框
        "switch_and_checkbox": (context) => NewSwitchAndCheckBox(),
        // 学习输入框及表单
        "text_field_page": (context) => NewTextField(),
        // Form表单
        "form_page": (context) => FormTestRoute(),
        /*
         开始页面 布局类Widget 的学习： 
         */
        // 添加一个页面布局总页面
        "row_column_page": (context) => RowAndColumnRoute(),
        // 学习纵向Row布局
        "row_page": (context) => NewRow(),
        // 学习Flex弹性布局
        "flex_page": (context) => NewFlex(),
        // 学习流式布局Wrap
        "wrap_page": (context) => NewWrap(),
        // 学习层叠布局Stack
        "stack_page": (context) => NewStack(),
      },
      // 应用首页路由
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// 即继承一个有状态Widget组件
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  // 对应该类的状态类
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // “+” 次数记录
  int _counter = 0;

  // 设置状态的自增函数
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  // 构建UI界面的逻辑build方法
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: Wrap(
          spacing: 8.0, // 主轴(水平)方向间距
          runSpacing: 4.0, // 纵轴（垂直）方向间距
          alignment: WrapAlignment.center, //沿主轴方向居中
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter                  ',
              style: Theme.of(context).textTheme.display1,
            ),
            new Text('''基础显示'''),
            // 添加一个按钮组件，用于跳转新路由（新页面）
            // 跳转至新路由的按钮
            FlatButton(
                child: Text('open new route'),
                textColor: Colors.blue,
                // 导航至新路由
                onPressed: () {
                  // 推至路由栈，路由管理Widget组件，通过栈来管理一个路由widget集合 即先进先出管理原则，这样好理解多了
                  // Navigator.push(context,
                  //   new MaterialPageRoute(builder: (context){
                  //     return new NewRoute();
                  // // 通过路由名称也可以打开新的路由页

                  //   },
                  //   )
                  // );
                  Navigator.pushNamed(context, "new_page");
                }),

            // 添加文本及样式路由按钮
            RaisedButton(
              child: Text('基础Widgets'),
              textColor: Colors.blue,
              onPressed: () => Navigator.pushNamed(context, "base_widget_page"),
            ),
            RaisedButton(
              child: Text('布局学习'),
              textColor: Colors.blue,
              onPressed: () => Navigator.pushNamed(context, 'row_column_page'),
            ),
            // 通过english_words包随机显示一个英文单词
            new RandomWordsWidget(),
            // 打印文字的组件
            Echo(
              text: "大致学习过程",
            )
          ],
        ),

        // 右下角的按钮
        floatingActionButton: new FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: new Icon(Icons.add),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

// 根据路由管理，尝试新的页面构建：
class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: Text('This is new route.')),
        body: Center(child: Text('nice route.')));
  }
}

// 基础Weight学习
class BaseWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('基础Widgets')),
      body: new Column(
        children: <Widget>[
          FlatButton(
            child: Text('文本及样式',
                style: TextStyle(
                  background: new Paint()..color = Colors.yellow,
                )),
            textColor: Colors.blue,
            onPressed: () => Navigator.pushNamed(context, "text_page"),
          ),
          // 添加按钮路由按钮，该button有阴影效果
          RaisedButton(
            child: Text('按钮'),
            textColor: Colors.blue,
            onPressed: () => Navigator.pushNamed(context, "button_page"),
          ),
          RaisedButton(
            child: Text('图片及ICON'),
            textColor: Colors.blue,
            onPressed: () => Navigator.pushNamed(context, "image_page"),
          ),
          RaisedButton(
            child: Text('单选开关及复选框'),
            textColor: Colors.blue,
            onPressed: () =>
                Navigator.pushNamed(context, "switch_and_checkbox"),
          ),
          RaisedButton(
            child: Text("输入框及表单"),
            textColor: Colors.blue,
            onPressed: () => Navigator.pushNamed(context, 'text_field_page'),
          ),
          RaisedButton(
            child: Text('表单Form'),
            textColor: Colors.blue,
            onPressed: () => Navigator.pushNamed(context, 'form_page'),
          ),
        ],
      ),
    );
  }
}

// 文本及样式
class NewText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var scaffold = new Scaffold(
      appBar: AppBar(
        title: Text('文本及样式'),
      ),
      body: new Center(
          child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "文本居中对齐." * 7,
            // 文本居中对齐
            textAlign: TextAlign.center,
          ),
          Text(
            "文本显示的最大行数." * 4,
            // 文本显示的最大行数
            maxLines: 1,
            // 指定若文本超过一行的戒断方式，ellipsis 表示截断为省略号
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "字体大小的缩放因子，类似于大小调节",
            textScaleFactor: 1.5,
          ),
          Text("TextStyle用于指定文本显示的样式",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18,
                height: 1.2,
                fontFamily: "Courier",
                background: new Paint()..color = Colors.yellow,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed,
              )),
          // 对不同片段设置不同的样式，可以不断嵌套设置
          Text.rich(TextSpan(children: [
            TextSpan(
              text: 'Home ',
            ),
            TextSpan(
              text: "https://flutterchina.club",
              style: TextStyle(
                color: Colors.blue,
              ),
              // recognizer: _tapRecognizer,
            ),
          ])),
          // 设置默认样式，这种样式是可以继承的
          DefaultTextStyle(
            style: TextStyle(
              color: Colors.red,
              fontSize: 20.0,
            ),
            textAlign: TextAlign.start,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("hello word!"),
                Text('多行测试'),
                // 尝试再次编辑文本样式，查看是否会覆盖默认样式
                Text(
                  '尝试再次编辑文本样式，查看是否会覆盖默认样式，结果：成功覆盖默认设置的样式',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14.0,
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
    return scaffold;
  }
}

// 按钮
class NewButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('按钮')),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('RaiseButton'),
              onPressed: () {},
            ),
            FlatButton(
              child: Text("FlatButton"),
              onPressed: () {},
            ),
            OutlineButton(
              child: Text("OutlineButton"),
              onPressed: () {},
            ),
            // 可点击的Icon
            IconButton(
              icon: Icon(Icons.thumb_up),
              onPressed: () {},
            ),
            // 设置按钮样式，阴影风格真的不错。
            RaisedButton(
              child: Text("按钮样式"),
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

// 图片和Icon
class NewImage extends StatelessWidget {
  // 预定义一组字体图标：

  @override
  Widget build(BuildContext context) {
    String icons = "";
    // accessible: &#xE914; or 0xE914 or E914
    icons += "\uE914";
    // error: &#xE000; or 0xE000 or E000
    icons += " \uE000";
    // fingerprint: &#xE90D; or 0xE90D or E90D
    icons += " \uE90D";
    return new Scaffold(
      appBar: AppBar(title: Text('图片及ICON')),
      body: Center(
        child: Column(
          children: <Widget>[
            // 本地图片组建
            Image.asset(
              "images/avatar.png",
              width: 100.0,
            ),
            // 显示网络图片
            Image.network(
              "https://avatars1.githubusercontent.com/u/20992063?s=460&v=4",
              width: 200.0,
            ),
            //简单设置图片属性
            Image(
              image: NetworkImage(
                  'https://avatars1.githubusercontent.com/u/20992063?s=460&v=4'),
              width: 100,
              height: 100.0,
              color: Colors.blue,
              colorBlendMode: BlendMode.difference,
              // 图片空间小于显示空间，设置图片显示的重复规则
              repeat: ImageRepeat.repeatY,
            ),
            // 字体图标的使用
            Text(
              icons,
              style: TextStyle(
                  fontFamily: "MaterialIcons",
                  fontSize: 24.0,
                  color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}

// 单选开关和复选框
class NewSwitchAndCheckBox extends StatefulWidget {
  @override
  _NewSwitchAndCheckBoxState createState() => new _NewSwitchAndCheckBoxState();
}

class _NewSwitchAndCheckBoxState extends State<NewSwitchAndCheckBox> {
  bool _switchSelected = true;
  bool _checkboxSelected = true;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('单选开关和复选框')),
      body: new Center(
          child: Column(
        children: <Widget>[
          Switch(
            value: _switchSelected, //当前状态
            onChanged: (value) {
              //重新构建页面
              setState(() {
                _switchSelected = value;
              });
            },
          ),
          Checkbox(
            value: _checkboxSelected,
            // 选中时的颜色
            activeColor: Colors.red,
            onChanged: (value) {
              setState(() {
                _checkboxSelected = value;
              });
            },
          ),
        ],
      )),
    );
  }
}

// 简单输入
class NewTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 定义一个controller，可以获取内容，也可以监听文本变化
    TextEditingController _selectionControlle = new TextEditingController();
    _selectionControlle.text = "Hello world";
    _selectionControlle.selection = TextSelection(
      baseOffset: 2,
      extentOffset: _selectionControlle.text.length,
    );
    return new Scaffold(
      appBar: AppBar(title: Text('输入框及表单')),
      body: new Center(
        child: new Column(
          children: <Widget>[
            // 登陆输入框
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                labelText: "用户名",
                hintText: "用户名或邮箱",
                prefixIcon: Icon(Icons.person),
              ),
              // 可以通过onChanged获取输入的内容，也可以监听文本变化
              // onChanged: (context){
              //   print(context);
              // },
              // 比如通过controller获取输入的内容，监听文本变化，除了这两种功能，还可以设置默认值、选择文本
              controller: _selectionControlle,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "密码",
                hintText: "您的登陆密码",
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
          ],
        ),
      ),
    );
  }
}

// 表单Form测试
class FormTestRoute extends StatefulWidget {
  @override
  _FormTestRouteState createState() => new _FormTestRouteState();
}

class _FormTestRouteState extends State<FormTestRoute> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // 此处不能使用PageScaffold 尝试普通布局
    // return PageScaffold(
    // ......
    // );
    return new Scaffold(
      appBar: AppBar(title: Text('表单Form')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Form(
            key: _formKey,
            autovalidate: true,
            child: Column(
              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  controller: _unameController,
                  decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: '用户名或邮箱',
                    icon: Icon(Icons.person),
                  ),
                  // 校验用户名
                  validator: (v) {
                    return v.trim().length > 0 ? null : "用户名不能为空";
                  },
                ),
                TextFormField(
                  controller: _pwdController,
                  decoration: InputDecoration(
                    labelText: "密码",
                    hintText: '您的登陆密码',
                    icon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                  validator: (v) {
                    return v.trim().length > 5 ? null : "密码不能少于6位";
                  },
                ),
                // 登陆按钮
                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          padding: EdgeInsets.all(15.0),
                          child: Text('登陆'),
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onPressed: () {
                            if ((_formKey.currentState as FormState)
                                .validate()) {
                              //验证通过提交数据
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

// 布局类Widgets 学习
class RowAndColumnRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: Text("布局类Widgets 学习")),
        body: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('ROw纵向布局'),
              textColor: Colors.blue,
              onPressed: () => Navigator.pushNamed(context, 'row_page'),
            ),
            RaisedButton(
              child: Text('Flex弹性布局'),
              textColor: Colors.blue,
              onPressed: () => Navigator.pushNamed(context, 'flex_page'),
            ),
            RaisedButton(
              child: Text('Wrap流式布局'),
              textColor: Colors.blue,
              onPressed: () => Navigator.pushNamed(context, 'wrap_page'),
            ),
            RaisedButton(
              child: Text("Stack层叠布局"),
              textColor: Colors.blue,
              onPressed: () => Navigator.pushNamed(context, 'stack_page'),
            ),
          ],
        ));
  }
}

// Row纵向布局
class NewRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: Text('纵轴Row')),
        body: Column(
          //测试Row对齐方式，排除Column默认居中对齐的干扰
          crossAxisAlignment: CrossAxisAlignment.start,
          // Widge子数组
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text('水平方向对齐方式.'), Text('现在是居中对齐.')],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(" hello world "),
                Text(" I am Jack "),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              textDirection: TextDirection.rtl,
              children: <Widget>[
                Text(" hello world "),
                Text(" I am Jack "),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              verticalDirection: VerticalDirection.up,
              children: <Widget>[
                Text(
                  " hello world ",
                  style: TextStyle(fontSize: 30.0),
                ),
                Text(" I am Jack "),
              ],
            ),
          ],
        ));
  }
}

// 弹性布局Flex
class NewFlex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: Text('Flex弹性布局')),
        body: new Column(
          children: <Widget>[
            Flex(
              //Flex的两个子widget按1：2来占据水平空间
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Container(
                      height: 30.0,
                      color: Colors.red,
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      height: 30.0,
                      color: Colors.green,
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                height: 100.0,
                child: Flex(
                  //Flex的三个子widget，在 垂直 方向按2：1：1来占用100像素的空间
                  direction: Axis.vertical,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 30.0,
                        color: Colors.red,
                      ),
                    ),
                    // 一个Flex的简单包装
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 30.0,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

// 流式布局Wrap、Flow
class NewWrap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('流式布局Wrap')),
      body: Wrap(
        // 主轴水平方向间距
        spacing: 8.0,
        // 纵轴垂直方向间距
        runSpacing: 4.0,
        // 沿主轴方向居中
        alignment: WrapAlignment.center,
        children: <Widget>[
          new Chip(
              avatar: new CircleAvatar(
                  backgroundColor: Colors.blue, child: Text('A')),
              label: new Text('Hamilton')),
          new Chip(
            avatar: new CircleAvatar(
                backgroundColor: Colors.blue, child: Text('M')),
            label: new Text('Lafayette'),
          ),
          new Chip(
            avatar: new CircleAvatar(
                backgroundColor: Colors.blue, child: Text('H')),
            label: new Text('Mulligan'),
          ),
          new Chip(
            avatar: new CircleAvatar(
                backgroundColor: Colors.blue, child: Text('J')),
            label: new Text('Laurens'),
          ),
        ],
      ),
    );
  }
}

// 层叠布局 Stack、Positioned
class NewStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('层叠布局Stack')),
      body: new ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            // 指定未定位或部分定位widget的对齐方式
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                child: Text('Hello world',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                color: Colors.red,
              ),
            ],
          )),
    );
  }
}

class CuoertinoTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Cupertino Demo"),
      ),
      child: Center(
        child: CupertinoButton(
          color: CupertinoColors.activeBlue,
          child: Text("Press"),
          onPressed: () {},
        ),
      ),
    );
  }
}

class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return new Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Text(wordPair.toString()));
  }
}

class Echo extends StatelessWidget {
  const Echo({
    Key key,
    @required this.text,
    this.backgroundColor: Colors.grey,
  }) : super(key: key);
  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      color: backgroundColor,
      child: Text(text),
    ));
  }
}
