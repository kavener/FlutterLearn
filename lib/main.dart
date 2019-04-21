// 一些汇总总结，迫在眉睫的需求，比如英文文档阅读能力（Dart文档，Flutter文档，外国社区等必须的能力要求，甚至文档翻译能力）
// Dart、Flutter 中需多的类思想，函数式编程等思想
// 不断实践，思考，理解其本质，即尝试源码的阅读，尤其是Dart和Flutter的源码极其优秀，再加之注释的完美搭配

// 导入Material UI组件库
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

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
        /*
         开始页面 容器类Widget 的学习： 
         */
        // 添加一个页面布局总页面
        "container_page": (context) => ContainerRoute(),
        // 学习Padding
        "padding_page": (context) => NewPadding(),
        // 学习 ConstrainedBox
        "constrained_box_page": (context) => NewConstrainedBox(),
        // 学习DecoraedBox
        "decorated_box_page": (context) => NewDecoratedBox(),
        // Transform变换和Container
        "transform_page": (context) => NewTransformAndContainer(),
        // Scaffold 导航等
        "scaffold_page": (context) => ScaffoldRoute(),
        /*
        开始页面 可滚动Widgets 的学习：
        */
        // 添加一个页面布局总页面
        'NewScrollable_page': (context) => NewScrollable(),
        // 学习SingleChildScrollView
        'SingleChildScrollView_page': (context) => NewSingleChildScrollView(),
        //  InfiniteListView InfiniteGridView CustomScrollViewTestRoute
        'InfiniteListView_page': (context) => CustomScrollViewTestRoute(),
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
              child: Text('布局类Widgets'),
              textColor: Colors.blue,
              onPressed: () => Navigator.pushNamed(context, 'row_column_page'),
            ),
            RaisedButton(
              child: Text('容器类Widgets'),
              textColor: Colors.blue,
              onPressed: () => Navigator.pushNamed(context, 'container_page'),
            ),
            RaisedButton(
              child: Text('可滚动Widgets'),
              textColor: Colors.blue,
              onPressed: () =>
                  Navigator.pushNamed(context, 'NewScrollable_page'),
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
              Positioned(
                left: 18.0,
                child: Text("I'm Jack"),
              ),
              Positioned(
                top: 18.0,
                child: Text("Your Friend"),
              ),
            ],
          )),
    );
  }
}
// 容器类Widgetsx 学习

class ContainerRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: Text("容器类学习")),
        body: new Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Padding'),
              textColor: Colors.blue,
              onPressed: () => Navigator.pushNamed(context, 'padding_page'),
            ),
            RaisedButton(
              child: Text('ConstrainedBox'),
              textColor: Colors.blue,
              onPressed: () =>
                  Navigator.pushNamed(context, 'constrained_box_page'),
            ),
            RaisedButton(
              child: Text("DecoratedBox"),
              textColor: Colors.blue,
              onPressed: () =>
                  Navigator.pushNamed(context, "decorated_box_page"),
            ),
            RaisedButton(
              child: Text("Transform"),
              textColor: Colors.blue,
              onPressed: () => Navigator.pushNamed(context, "transform_page"),
            ),
            RaisedButton(
              child: Text('Scaffold'),
              textColor: Colors.blue,
              onPressed: () => Navigator.pushNamed(context, 'scaffold_page'),
            ),
          ],
        ));
  }
}

// Padding
class NewPadding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('Padding学习')),
      body: new Padding(
          // 上下左右各添加16像素空白
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                // 左边添加8像素补白
                padding: const EdgeInsets.only(left: 8.0),
                child: Text('Hello world'),
              ),
              Padding(
                //上下各添加8像素补白
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text("I am Jack"),
              ),
              Padding(
                // 分别指定四个方向的补白
                padding: const EdgeInsets.fromLTRB(20.0, .0, 20.0, 20.0),
                child: Text("Your friend"),
              )
            ],
          )),
    );
  }
}

// 布局限制类容器 ConstrianedBox、SizeBox
// 预先定义一个redBox，一个红色背景的盒子
Widget redBox = DecoratedBox(
  decoration: BoxDecoration(color: Colors.red),
);

class NewConstrainedBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: Text("ConstrianedBox、SizeBox学习")),
        body: new Column(
          children: <Widget>[
            new Text('ConstrainedBox：'),
            new ConstrainedBox(
              // 最小高度50，宽度尽可能大的红色容器
              constraints:
                  BoxConstraints(minWidth: double.infinity, minHeight: 50.0),
              // 虽然container高度为5但是，容器的最小高度为50，所以最终生效的是50
              child: Container(height: 5.0, child: redBox),
            ),
            // SizedBox用于给子Widget指定固定的宽高
            new Text('SizedBox：'),
            SizedBox(
              width: 80.0,
              height: 80.0,
              child: redBox,
            ),
            new Text('多重限制案例：'),
            // 多重限制案例
            ConstrainedBox(
                // 父
                constraints: BoxConstraints(minWidth: 60.0, minHeight: 60.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),
                  child: redBox,
                )),
            new Text('调换限制条件：'),
            ConstrainedBox(
                // 父
                constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 60.0, minHeight: 60.0),
                  child: redBox,
                )),
            new Text("'去除'多重限制"),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 60, minHeight: 100),
              child: UnconstrainedBox(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 90, minHeight: 20),
                  child: redBox,
                ),
              ),
            ),
          ],
        ));
  }
}

// 装饰容器DecoratedBox 漂亮警告
class NewDecoratedBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('NewDecoratedBox学习')),
      body: new DecoratedBox(
          decoration: BoxDecoration(
            // 背景渐变
            gradient: LinearGradient(colors: [Colors.red, Colors.orange[700]]),
            // 像素圆角
            borderRadius: BorderRadius.circular(3.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.black54,
                  offset: Offset(2.0, 2.0),
                  blurRadius: 4.0),
            ],
          ),
          child: new Padding(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
            child: Text(
              "Login",
              style: TextStyle(color: Colors.white),
            ),
          )),
    );
  }
}

class NewTransformAndContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: Text("Transform学习")),
        body: new Column(
          children: <Widget>[
            Container(
              color: Colors.black,
              child: new Transform(
                alignment: Alignment.topRight,
                transform: new Matrix4.skewY(0.3),
                child: new Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.deepOrange,
                  child: const Text("Apartment for rent!"),
                ),
              ),
            ),
            DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
                child: Transform.translate(
                  offset: Offset(-20.0, -5.0),
                  child: Text("Hello world"),
                )),
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Transform.rotate(
                //旋转90度
                angle: math.pi / 2,
                child: Text("Hello world"),
              ),
            ),
            DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
                child: Transform.scale(
                    scale: 1.5, //放大到1.5倍
                    child: Text("Hello world"))),
            Container(
              margin: EdgeInsets.all(20.0), //容器外补白
              color: Colors.orange,
              child: Text("Hello world!"),
            ),
            Container(
              padding: EdgeInsets.all(20.0), //容器内补白
              color: Colors.orange,
              child: Text("Hello world!"),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.orange),
                child: Text("Hello world!"),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.orange),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Hello world!"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50.0, left: 120.0), //容器外补白
              constraints:
                  BoxConstraints.tightFor(width: 200.0, height: 150.0), //卡片大小
              decoration: BoxDecoration(
                  //背景装饰
                  gradient: RadialGradient(
                      //背景径向渐变
                      colors: [Colors.red, Colors.orange],
                      center: Alignment.topLeft,
                      radius: .98),
                  boxShadow: [
                    //卡片阴影
                    BoxShadow(
                        color: Colors.black54,
                        offset: Offset(2.0, 2.0),
                        blurRadius: 4.0)
                  ]),
              transform: Matrix4.rotationZ(.2), //卡片倾斜变换
              alignment: Alignment.center, //卡片内文字居中
              child: Text(
                //卡片文字
                "5.20", style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
            ),
          ],
        ));
  }
}

// Scaffold、TabBar、底部导航
class ScaffoldRoute extends StatefulWidget {
  @override
  _ScaffoldRouteState createState() => new _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //导航栏
        title: Text("App Name"),
        // 手动设置leading自定义菜单图标
        // leading: Builder(builder: (context){
        //   return IconButton(icon: Icon(Icons.dashboard), color: Colors.white,
        //     onPressed: (){
        //       Scaffold.of(context).openDrawer();
        //     },
        //   );
        // },),
        actions: <Widget>[
          //导航栏右侧菜单
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
        ],
      ),
      // drawer: new MyDrawer(), //抽屉
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text('business')),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), title: Text("school")),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.ac_unit),
        onPressed: _onAdd,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {}
}

// 可滚动Widgets
class NewScrollable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('可滚动Widgets')),
      body: new Column(
        children: <Widget>[
          RaisedButton(
              child: Text('SingleChildScrollView'),
              textColor: Colors.blue,
              onPressed: () =>
                  Navigator.pushNamed(context, 'SingleChildScrollView_page')),
          RaisedButton(
            child: Text('InfiniteListView'),
            textColor: Colors.blue,
            onPressed: () =>
                Navigator.pushNamed(context, 'InfiniteListView_page'),
          ),
        ],
      ),
    );
  }
}

// SingleChildScrollView
class NewSingleChildScrollView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return new Scaffold(
      appBar: AppBar(title: Text('SingleChildScrollView学习')),
      body: Scrollbar(
          child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            // 动态创建一个 List<Widget>
            children: str
                .split('')
                // 每个字母都用一个Text显示，设置字体大小为原来的两倍
                .map((c) => Text(
                      c,
                      textScaleFactor: 2.0,
                    ))
                .toList(),
          ),
        ),
      )),
    );
  }
}

// ListView 一个无限加载实例 
class InfiniteListView extends StatefulWidget {
  @override
  _InfiniteListViewState createState() => new _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];

  @override
  void initState() {
    _retrieveData();
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(
          _words.length - 1,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      setState(() {
        //重新构建列表
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: Text("ListView学习")),
        body: ListView.separated(
          itemCount: _words.length,
          itemBuilder: (context, index) {
            //如果到了表尾
            if (_words[index] == loadingTag) {
              //不足100条，继续获取数据
              if (_words.length - 1 < 100) {
                //获取数据
                _retrieveData();
                //加载时显示loading
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: SizedBox(
                      width: 24.0,
                      height: 24.0,
                      child: CircularProgressIndicator(strokeWidth: 2.0)),
                );
              } else {
                //已经加载了100条数据，不再获取数据。
                return Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "没有更多了",
                      style: TextStyle(color: Colors.grey),
                    ));
              }
            }
            //显示单词列表项
            return ListTile(title: Text(_words[index]));
          },
          separatorBuilder: (context, index) => Divider(height: .0),
        ));
  }
}

// 模拟异步获取数据并利用GirdView展示
class InfiniteGridView extends StatefulWidget {
  @override
  _InfiniteGridViewState createState() => new _InfiniteGridViewState();
}

class _InfiniteGridViewState extends State<InfiniteGridView> {
  List<IconData> _icons = []; //保存Icon数据

  @override
  void initState() {
    // 初始化数据
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('GridView')),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, //每行三列
              childAspectRatio: 1.0 //显示区域宽高相等
              ),
          itemCount: _icons.length,
          itemBuilder: (context, index) {
            //如果显示到最后一个并且Icon总数小于200时继续获取数据
            if (index == _icons.length - 1 && _icons.length < 200) {
              _retrieveIcons();
            }
            return Icon(_icons[index]);
          }),
    );
  }

  //模拟异步获取数据
  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access,
          Icons.cake,
          Icons.free_breakfast
        ]);
      });
    });
  }
}

class CustomScrollViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //因为本路由没有使用Scaffold，为了让子级Widget(如Text)使用
    //Material Design 默认的样式风格,我们使用Material作为本路由的根。
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          //AppBar，包含一个导航栏
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Demo'),
              background: Image.asset(
                "./images/avatar.png",
                fit: BoxFit.cover,
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: new SliverGrid(
              //Grid
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //Grid按两列显示
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  //创建子widget
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: new Text('grid item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
          //List
          new SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              //创建列表项
              return new Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: new Text('list item $index'),
              );
            }, childCount: 50 //50个列表项
                ),
          ),
        ],
      ),
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
