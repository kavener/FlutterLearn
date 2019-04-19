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
        "text_page": (context) => NewText(),
        // 学习 按钮
        "button_page": (context) => NewButton(),
        //  学习图片组件及ICON
        'image_page': (context) => NewImage(),
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
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // 泛型Widget，即接受Widget组件类型构建列表
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            new Text('''显示文字
            可以多行
              书写
            '''),
            // 添加一个按钮组件，用于跳转新路由（新页面）
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
            // 跳转至新路由的按钮
            FlatButton(
              child: Text('open new counter'),
              textColor: Colors.blue,
              onPressed: () => Navigator.pushNamed(context, "cuper_page"),
            ),
            // 添加文本及样式路由按钮
            FlatButton(
              child: Text('文本及样式',
                style: TextStyle(
                  background: new Paint()..color = Colors.yellow,
                )
              ),
              
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
              child: Text('图片组建及按钮'),
              textColor: Colors.blue,
              onPressed: () => Navigator.pushNamed(context, "image_page"),
            ),
            // 通过english_words包随机显示一个英文单词
            new RandomWordsWidget(),
            // 打印文字的组件
            Echo(
              text: "接收输入文字并回显",
            )
          ],
        ),
      ),
      // 右下角的按钮
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
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
              onPressed: (){},
              ),
            FlatButton(
              child: Text("FlatButton"),
              onPressed: (){},
            ),
            OutlineButton(
              child: Text("OutlineButton"),
              onPressed: (){},
            ),
            // 可点击的Icon
            IconButton(
              icon: Icon(Icons.thumb_up),
              onPressed: (){},
            ),
            // 设置按钮样式，阴影风格真的不错。
            RaisedButton(
              child: Text("按钮样式"),
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: (){},
            ),
          ],
        ),
      ),
    );
  }
}

class NewImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title:Text('图片及ICON')),
      body: Center(
        child: Column(
          children: <Widget>[
            
          ],
        ),

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
