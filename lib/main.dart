import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'font+test.dart';
import 'data.dart';
import 'dart:convert' as convert;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:mongol/mongol.dart';
import 'widget/mydialog.dart';
import 'widget/imagePage.dart';



import 'search_page.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    drawer: Drawer(
      child: Text("左侧边栏"),
    ),
    endDrawer: Drawer(
      child: Text("右侧边栏"),
    ),
    appBar: AppBar(
        title: const Text(
      "my test flutter",
    )),
    body:
        // Column(
        //   children: [
        // mycircular(),
        // Myapp(),
        // Mybutton(),
        // myimages(),
        // Test_icon(),
        // myclipimage(),
        // load_image()
        // list_view()
        // app_main(),
        // row_list(),  //水平列表
        // dynamic_list2(),  //动态列表
        // list_builder(),    //listview.builder
        // GridView_test()
        // Gridview_test2()
        // row_test()
        // flex_text()
        // flex_text2(),
        // stack_test()
        // stack_positioned()
        // algin_test()
        // AspectRatio_test()
        // card_test()
        // card_test2()
        // button_test()
        // wrap_test()
        // fulwidget(),
        // test9(),
        // pageview_test(),
        // search_page(),
        // dialog_test(),
        // page_view(),
        // infinite_pageview(),
    page_view_test3(),
    // test5()
    // ],
    floatingActionButton: FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add_circle_outline),
    ),
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: 2, //设置默认选择第几个，下标从0开始
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.access_alarm), label: "时间"),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined), label: "通讯录"),
        BottomNavigationBarItem(
            icon: Icon(Icons.add_a_photo_outlined), label: "相册")
      ],
    ),
  )));
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Center(
      child: Container(
        //相当于div
        width: 200,
        height: 100,
        transform: Matrix4.rotationX(0.2),
        // transform: Matrix4.translationValues(20, 0, 0),   //位移
        // transform: Matrix4.skewY(0.2),   //设置变换
        margin: EdgeInsets.fromLTRB(0, 200, 0, 20),
        alignment: Alignment.center, //设置内部组件的位置方式
        decoration: BoxDecoration(
          // image:AssetImage("images/bg.png"),
          // color: Color.fromRGBO(240, 230, 140, 1), //设置填充
          border: Border.all(color: Colors.deepOrange, width: 2), //设置边框以及变宽颜色
          borderRadius: BorderRadius.circular(5), //设置圆角边框效果
          gradient:
              LinearGradient(colors: [Colors.red, Colors.blue]), //设置线性渐变从蓝色到黄色
          boxShadow: const [
            BoxShadow(
              color: Colors.indigoAccent, //设置阴影颜色
              blurRadius: 20, //设置阴影效果
            )
          ],
        ),
        child: Text(
          //设置为文本控件
          "你好flutter!", //设置文字内容
          textDirection: TextDirection.ltr, //设置文字的方向
          style: TextStyle(
              color: Color.fromRGBO(0, 0, 255, 1), fontSize: 19), //设置文字样式属性
        ),
      ),
    );
  }
}

class Mybutton extends StatelessWidget {
  const Mybutton({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        width: 200,
        height: 40,
        margin: const EdgeInsets.all(21),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.cyan,
            borderRadius: BorderRadius.circular(40),
            boxShadow: const [
              BoxShadow(
                color: Colors.cyan,
                blurRadius: 20,
              )
            ]),
        child: const Text(
          "按钮5",
          style: TextStyle(fontSize: 15, color: Colors.red, fontFamily: "宋体"),
        ));
  }
}

//图片操作的练习
class myimages extends StatelessWidget {
  const myimages({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        height: 40,
        width: 200,
        decoration: const BoxDecoration(
          color: Colors.deepPurpleAccent,
        ),
        child: Image.network(
          "https://flutter.cn/assets/images/cn/flutter-cn-logo.png",
          width: 10,
        ),
      ),
    );
  }
}

//设置圆形图片的方式一
class mycircular extends StatelessWidget {
  const mycircular({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), //设置圆形边框
            image: const DecorationImage(
              image: NetworkImage(
                  "http://106.12.141.38:2333/upload/2022/11/4dffadc42c8c2eac3caf44d569b04cf.jpg"),
              fit: BoxFit.cover,
            )),
        // child: Image.network("http://106.12.141.38:2333/upload/2022/11/4dffadc42c8c2eac3caf44d569b04cf.jpg",),
      ),
    );
  }
}

//设置圆形图片的方式二
class myclipimage extends StatelessWidget {
  const myclipimage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ClipOval(
      child: Image.network(
        "http://106.12.141.38:2333/upload/2022/11/4dffadc42c8c2eac3caf44d569b04cf.jpg",
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
    );
  }
}

//加载本地图片
class load_image extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        width: 400,
        height: 1000,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg.png"),
            fit: BoxFit.cover,
          ),
        )
        // child: Image.asset("images/bg.png",fit: BoxFit.cover,),
        );
  }
}

//icon演示
class Test_icon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: const [
        Icon(Icons.abc),
        Icon(Icons.home),
        Icon(test_icon.zfb),
      ],
    );
  }
}

//list_view垂直列表演示
class app_main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      shrinkWrap: true,
      children: const <Widget>[
        ListTile(
          leading: Image(
            image: NetworkImage(
                "https://picx1.zhimg.com/80/v2-543f272e48de443345fc82a82713afcf_400x224.png"),
            fit: BoxFit.cover,
          ),
          title: Text("从入围赛到世界之巅，DRX 击败 T1 夺 S12 总冠军，对此你有什么想说的？"),
        ),
        Divider(
          color: Colors.blue,
        ),
        ListTile(
          leading: Image(
            image: NetworkImage(
                "https://pic1.zhimg.com/80/v2-c5129cebd7c2fff120ca65dfe6cef0ae_400x224.png"),
            fit: BoxFit.cover,
          ),
          title: Text("广州面临抗疫三年以来最复杂、最严峻的疫情，将开设临时医疗点 24 小时轮值，这意味着什么？"),
        ),
        Divider(
          color: Colors.blue,
        ),
        ListTile(
          leading: Image(
            image: NetworkImage(
                "https://pic3.zhimg.com/50/v2-840a2718e28c5483acd7d02ee24a21f7_400x224.jpg"),
            fit: BoxFit.cover,
          ),
          title: Text("S12 总决赛 Keria 赛后瘫坐椅子泪不成声，对此你有什么想说的？"),
        ),
        Divider(
          color: Colors.blue,
        ),
        ListTile(
          leading: Image(
              image: NetworkImage(
                  "https://pic3.zhimg.com/v2-641962231e7cbce40d8e7cce216fcf2a_400x224.jpg")),
          title: Text("美共和党议员称「要是我们赢了中期选举，乌克兰休想拿到一分钱」，如何看待这一表态？或将如何影响俄乌局势？"),
        ),
        Divider(
          color: Colors.blue,
        ),
        ListTile(
          leading: Image(
              image: NetworkImage(
                  "https://pic3.zhimg.com/v2-75c52ba2616c9048ef0f84c73bc7ac52_400x224.png")),
          title: Text("外媒曝光乌军 1300 个星链终端因欠费掉线，这会带来哪些影响？后续会如何发展？"),
        ),
        Divider(
          color: Colors.blue,
        ),
        ListTile(
          leading: Image(
              image: NetworkImage(
                  "https://pic4.zhimg.com/v2-7485df92384f7b5271dbfa0a505d820f_400x224.jpg")),
          title: Text("两架「歼 -20」降落珠海进行静态展示，亲眼见到「歼 -20」是一种什么样的感受？"),
        ),
        Divider(
          color: Colors.blue,
        ),
        ListTile(
          leading: Image(
              image: NetworkImage(
                  "https://pic1.zhimg.com/v2-8f00847435625b1f072794f46f257959_400x224.jpg")),
          title: Text("刘强东转让所持京东产发股份予京东集团副总裁缪钦，后者共持有 45%，此举透露了哪些信息？"),
        ),
        Divider(
          color: Colors.blue,
        ),
        ListTile(
          leading: Image(
              image: NetworkImage(
                  "https://pic3.zhimg.com/80/ee2e48e49dfe8c2783986adc9d5f2321_400x224.jpg")),
          title: Text("为什么不能说 20℃ 是 10℃ 的两倍？"),
        ),
        Divider(
          color: Colors.blue,
        ),
        ListTile(
          leading: Image(
              image: NetworkImage(
                  "https://pic2.zhimg.com/50/v2-d2cbc8494460524a2aeaadc8cb0d8cbd_400x224.jpg")),
          title: Text("如何看待 Faker 及 T1 时隔五年重回总决赛再次止步亚军？"),
        ),
        Divider(
          color: Colors.blue,
        ),
      ],
    );
  }
}

//listview水平列表演示
class row_list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: <Widget>[
          Container(
            height: 120,
            width: 120,
            decoration: const BoxDecoration(
              color: Colors.red,
            ),
          ),
          Container(
            height: 120,
            width: 120,
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
          ),
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.yellow,
            ),
          ),
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
            ),
          ),
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.amberAccent,
            ),
          ),
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.yellow,
            ),
          ),
        ],
      ),
    );
  }
}

//Listview动态列表演示
class dynamic_list extends StatelessWidget {
  List<Widget> _initListData() {
    List<Widget> list_1 = [];
    for (var i = 0; i < 20; i++) {
      list_1.add(
        ListTile(
          title: Text("我是第${i}列表"),
        ),
      );
    }
    return list_1;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: _initListData(),
    );
  }
}

//listview 动态列表演示二
class dynamic_list2 extends StatelessWidget {
  const dynamic_list2({super.key});

  List<Widget> _initlistdata() {
    List<Widget> tmplist = []; //创建一个存储widget的列表
    for (var i = 0; i < list.length; i++) {
      //list为接收到的数据,在头文件引入
      tmplist.add(ListTile(
        leading: Image.network(
          "${list[i]["cover"]}",
          fit: BoxFit.cover,
        ),
        title: Text("${list[i]["name"]}"),
        subtitle: Text("${list[i]["teacherName"]}"), //向list内依次添加widget
      ));
    }
    return tmplist;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: _initlistdata(),
    ); //children为_initlistdata()返回的列表,就是上面的tmplist
  }
}

//ListView.builder演示
class list_builder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          //可以理解为一个遍历函数,context为list内容,index为list的索引
          return ListTile(
            leading: Image.network("${list[index]["cover"]}"),
            title: Text("${list[index]["name"]}"),
            subtitle: Text("${list[index]["teacherName"]}"),
          );
        });
  }
}

//网格布局演示
class GridView_test extends StatelessWidget {
  List<Widget> _initlistdata() {
    List<Widget> tmplist = []; //创建一个存储widget的列表
    for (var i = 0; i < list.length; i++) {
      //list为接收到的数据,在头文件引入
      tmplist.add(
        Container(
          alignment: Alignment.bottomRight,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red, width: 2), //设置边框
            //设置图片填充方式
          ),
          child: Column(
            children: [
              Image(image: NetworkImage("${list[i]["cover"]}")), //设置显示图片
              const SizedBox(
                height: 10,
              ),
              Text(
                "${list[i]["name"]}",
              ) //设置文字
            ],
          ),
        ),
      );
    }
    return tmplist;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.count(
        crossAxisCount: 3, //设置一行的个数
        crossAxisSpacing: 10, //设置列间距
        mainAxisSpacing: 10, //设置行间距
        children: _initlistdata());
  }
}

//网格布局演示二
class Gridview_test2 extends StatelessWidget {
  Widget _initlistdata(context, index) {
    return Container(
      alignment: Alignment.bottomRight,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red, width: 2), //设置边框
        //设置图片填充方式
      ),
      child: Column(
        children: [
          Image(image: NetworkImage("${list[index]["cover"]}")), //设置显示图片
          const SizedBox(
            height: 10,
          ),
          Text(
            "${list[index]["name"]}",
          ) //设置文字
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
        itemCount: list.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: _initlistdata);
  }
}

//线性布局row
class row_test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.deepPurpleAccent, width: 2), //设置边框
            borderRadius: BorderRadius.circular(20), //设置圆角效果
            boxShadow: [
              BoxShadow(color: Colors.cyanAccent, blurRadius: 20)
            ], //设置阴影
          ),
        ),
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.deepPurpleAccent, width: 2), //设置边框
            borderRadius: BorderRadius.circular(20), //设置圆角效果
            boxShadow: [
              BoxShadow(color: Colors.cyanAccent, blurRadius: 20)
            ], //设置阴影
          ),
        ),
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.deepPurpleAccent, width: 2), //设置边框
            borderRadius: BorderRadius.circular(20), //设置圆角效果
            boxShadow: [
              BoxShadow(color: Colors.cyanAccent, blurRadius: 20)
            ], //设置阴影
          ),
        ),
      ],
    );
  }
}

//flex布局
class flex_text extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Flex(
      direction: Axis.horizontal, //设置主轴方向
      children: [
        Expanded(
            flex: 1, //设置空间占比
            child: Container(
              height: 100,
              decoration: BoxDecoration(color: Colors.red),
            )),
        Expanded(
            flex: 2, //设置空间占比
            child: Container(
                height: 100, decoration: BoxDecoration(color: Colors.blue)))
      ],
    );
  }
}

//flex布局二
class flex_text2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 500,
      child: Column(
        children: [
          const Expanded(
            flex: 2,
            child: Image(
              image: AssetImage("images/img1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 1,
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/img2.png"),
                              fit: BoxFit.cover)),
                    )),
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                            child: Image.asset(
                          "images/img3.jpg",
                          fit: BoxFit.cover,
                        )),
                        Expanded(
                            child: Image.asset(
                          "images/img4.jpg",
                          fit: BoxFit.cover,
                        ))
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

//stack布局 堆叠演示
class stack_test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Stack(
        children: [
          Container(
            width: 500,
            height: 500,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/bg.png"), fit: BoxFit.cover),
            ),
          ),
          Text(
            "你好flutter",
            style: TextStyle(color: Colors.cyanAccent, fontSize: 60),
          )
        ],
      ),
    );
  }
}

//stack布局与Positioned结合演示
class stack_positioned extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 500,
      height: 500,
      color: Colors.amber,
      child: Stack(
        children: [
          Positioned(
              left: 0,
              top: 250, //在左侧终中间左右
              child: Container(
                width: 20,
                height: 20,
                color: Colors.blue,
              ))
        ],
      ),
    );
  }
}

//align 容器
class algin_test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 500,
      height: 500,
      color: Colors.yellow,
      child: Align(
        // alignment: Alignment.bottomLeft,
        alignment: Alignment(0.2, 0.5),
        child: Container(
          width: 50,
          height: 50,
          color: Colors.cyanAccent,
        ),
      ),
    );
  }
}

//AspectRatio组件
class AspectRatio_test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AspectRatio(
      aspectRatio: 2 / 1, //相对于父容器，宽度是父容器的宽度，高度是父容器高度的一般
      child: Container(
        color: Colors.red,
      ),
    );
  }
}

//card卡片组件
class card_test extends StatelessWidget {
  List<Widget> _initdata() {
    List<Widget> tmplist = [];
    for (var i = 0; i < list.length; i++) {
      tmplist.add(Card(
        child: ListTile(
          leading: Image.network(
            "${list[i]["cover"]}",
            fit: BoxFit.cover,
          ),
          title: Text(
            "${list[i]["name"]}",
          ),
          subtitle: Text("${list[i]["teacherName"]}"),
        ),
      ));
    }
    return tmplist;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: _initdata(),
    );
  }
}

//card 实践二
class card_test2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: [
        SizedBox(
          height: 20,
        ),
        Card(
          elevation: 10, //配置阴影深度
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)), //配置边框效果
          shadowColor: Colors.cyanAccent, //配置阴影颜色,
          child: Column(children: const [
            ListTile(
              title: Text(
                "张三",
                style: TextStyle(fontSize: 28),
              ),
              subtitle: Text("高级软件工程师"),
            ),
            Divider(),
            ListTile(
              title: Text("电话：123456546"),
            ),
            ListTile(
              title: Text("地址：北京市海淀区"),
            )
          ]),
        ),
        SizedBox(
          height: 20,
        ),
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)), //配置边框
          elevation: 10, //配置阴影深度
          shadowColor: Colors.cyan, //配置阴影颜色
          child: Column(children: const [
            ListTile(
              title: Text(
                "李四",
                style: TextStyle(fontSize: 28),
              ),
              subtitle: Text("flutter高级开发工程师"),
            ),
            Divider(),
            ListTile(
              title: Text("电话：123456546"),
            ),
            ListTile(
              title: Text("地址：北京市海淀区"),
            )
          ]),
        ),
      ],
    );
  }
}

//按钮
class button_test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  card_test2();
                },
                child: Text("凸起按钮")), //凸起按钮
            SizedBox(
              height: 20,
            ),
            TextButton(onPressed: () {}, child: Text("文本按钮")), //文本按钮
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
                onPressed: () {},
                child: Text("OutlineButton")), //OutlineButton\
            const SizedBox(
              height: 20,
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.abc_sharp)), //图标按钮
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.send),
              label: Text("发送"),
            )
          ],
        ));
  }
}

//wrap组件
class wrap_test extends StatelessWidget {
  List<Widget> _initdata() {
    //定义一个方法,生成数据
    List<Widget> tmplist = [];
    for (int i = 0; i < list.length; i++) {
      tmplist.add(ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
              //设置按钮样式
              backgroundColor: MaterialStateProperty.all(Colors.grey) //设置按钮背景色
              ),
          child: Text("${list[i]["name"]}")));
    }
    return tmplist;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Wrap(
      spacing: 10, //设置主轴元素之间的间距
      runSpacing: 5, //设置副轴的对齐方式
      children: _initdata(), //调用上面的方法
    );
  }
}

//尝试无状态组件进行内容动态变化，未成功
class test5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int a = 1;
    // TODO: implement build
    return Center(
        child: Column(
      children: [
        Text("$a"),
        Align(
          // alignment: Alignment(1, 0.5),
          child: IconButton(
              onPressed: () {
                a += 1;
              },
              icon: const Icon(
                Icons.add_circle_outline,
                color: Colors.blue,
              )),
        )
      ],
    ));
  }
}

//StatefulElement有状态组件
class fulwidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Mystate();
  }
}

class Mystate extends State<fulwidget> {
  int a = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        children: [
          Text(
            "$a",
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(
            height: 30,
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  //设置内容变化
                  a++;
                });
              },
              icon: Icon(Icons.add_circle_outline))
        ],
      ),
    );
  }
}

// PageView滑动页面
class pageview_test extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return pageView();
  }
}

class pageView extends State<pageview_test> {
  Future<Stack> _intdata() async {
    var url = Uri.https("www.iamwawa.cn", "/home/shici/ajax");
    var res = await http.get(url);
    var data = json.decode(res.body);
    return Stack(
      children: [
        Positioned(
            child: Text("${data["content"]}", textDirection: TextDirection.ltr))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView(children: [
      Stack(
        children: [
          Container(
            // width: 80,height: 80,
            color: Colors.blue,
          ),
          Positioned(
              right: 10,
              child: Column(
                children: <Widget>[MongolText("莫愁前路无知己")],
              ))
        ],
      ),
      Container(
        width: 80,
        height: 80,
        color: Colors.amber,
      )
    ]);
  }
}

class test9 extends StatelessWidget {
  Future<String> _initdata(var con) async {
    String url = "https://www.iamwawa.cn/home/shici/ajax";
    HttpClient client = HttpClient(); //创建一个http客户端
    HttpClientRequest res = await client.getUrl(Uri.parse(url)); //访问url
    // ignore: unused_local_variable
    HttpClientResponse response = await res.close();
    var sult = await response.transform(utf8.decoder).join();
    // print(json.decode(sult));
    client.close();
    con = await json.decode(sult);
    return sult;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var data;
    _initdata(data);
    print(data); //未输出正常内容待解决

    // print(json.decode(data));
    return const Center(
      child: RotatedBox(quarterTurns: 3, child: Text("1111")),
    );
  }
}

//路由实践
class search_page extends StatefulWidget {
  State<StatefulWidget> createState() {
    return search();
  }
}

class search extends State<search_page> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: Stack(
      //采用stack可以对内元素进行堆叠和排列
      children: [
        Positioned(
            //采用positioned标签对输入框进行相对定位
            top: 10, //设置输入框位置
            left: 50,
            right: 50,
            child: Container(
              //设置元素主体，包含图标文字
              width: 350, //设置主题尺寸
              height: 30,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(20)),
              child: CupertinoButton(
                //采用透明按钮
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => search_page()),
                  );
                },
                padding: EdgeInsets.all(1),
                // borderRadius: BorderRadius.circular(50),
                // color: Colors.cyan,
                child: Flex(
                  direction: Axis.horizontal, //flex组件可以对图标和文字进行按比例分割
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.search,
                        color: Color.fromRGBO(192, 192, 192, 2),
                      ),
                    ), //设置图标
                    Expanded(
                        flex: 6,
                        child: Text(
                          "搜索话题/用户/帖子",
                          style: TextStyle(
                              color: Color.fromRGBO(211, 211, 211, 5)),
                        )) //设置文字
                  ],
                ),
              ),
            ))
      ],
    ));
  }
}

//dialog

class dialog_test extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return dialog_1();
  }
}

class dialog_1 extends State<dialog_test> {
  void _dialog_2() async {
    //弹窗
    var result = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("删除"), //窗口标题
            content: Text("你确定要删除吗？"), //窗口显示的内容
            actions: [
              TextButton(
                  onPressed: () {
                    print("ok");
                    Navigator.of(context)
                        .pop("ok"); //关闭对话框,pop里面的内容为对话框向外界传递的数据
                  },
                  child: Text("取消")),
              TextButton(
                  onPressed: () {
                    print("取消");
                    Navigator.of(context).pop("no");
                  },
                  child: Text("确定"))
            ],
          );
        });
    print(result);
  }

  void _simpledialog() {
    showDialog(
        context: context,
        barrierDismissible: false, //该参数表示点击非弹窗区域，弹窗是否消失，默认是true，该参数不仅仅在这个弹窗中生效
        builder: (context) {
          return SimpleDialog(
            title: Text("选择语言"),
            children: [
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop("汉语");
                },
                child: Text("汉语"),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop("英语");
                },
                child: Text("英语"),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop("日语");
                },
                child: Text("日语"),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop("法语");
                },
                child: Text("法语"),
              ),
            ],
          );
        });
  }

  void _modelbottomsheet() {
    showBottomSheet(
        context: context,
        builder: (context) {
          return Text("底部弹出框"); //可以弹出任意组件
        });
  }

  void _mydialog() {
    showDialog(
        context: context,
        builder: (context) {
          return Mydialog();
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        children: [
          ElevatedButton(onPressed: _dialog_2, child: Text("alert 弹窗")),
          ElevatedButton(onPressed: _simpledialog, child: Text("simple弹窗")),
          ElevatedButton(onPressed: _modelbottomsheet, child: Text("底部弹出式对话框")),
          ElevatedButton(onPressed: _mydialog, child: Text("自定义dialog"))
        ],
      ),
    );
  }
}

//pageviewbuilder

class page_view extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return test_page_view();
  }
}

class test_page_view extends State<page_view> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical, //配置方向，垂直方向
        itemCount: 10, //配置页面数量
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: Text(
              "第$index页",
              style: Theme.of(context).textTheme.headline1,
            ),
          );
        },
      ),
    );
  }
}
//pageview无限加载

class infinite_pageview extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return infinite_page();
  }
}

class infinite_page extends State<infinite_pageview> {
  List<Widget> list = [];
  @override
  void initState() {     //组件的初始化过程中被调用，并且只会被调用一次。
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < 10; i++) {
      list.add(Center(
        child: Text(
          "第${i + 1}页",
          style: TextStyle(fontSize: 60),
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView(
      onPageChanged: (index){
          if(index+2==list.length){
            setState(() {
              for (var i = 0; i < 10; i++) {
                list.add(Center(
                  child: Text(
                    "第${index + 1}页",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ));
              }
            });
          }
      },
      scrollDirection: Axis.vertical,  //配置滚动方向
      children: list,
    );
  }
}
//pageview无限加载尝试三

class page_view_test3 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return view_test3();
  }

}
class view_test3 extends State<page_view_test3>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Image_widget(src: "http://106.12.141.38:2333/upload/2022/12/%E6%98%A5%E8%8A%82.jpg");
  }

}


//对内容重新加载排序
class Box extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Box_con();
  }
}
class Box_con extends State<Box>{
  int a=0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 100,
      height: 100,
      child: ElevatedButton(onPressed: () {
        setState(() {
          a++;
        });
      },
      child: Text("$a"),),
    );
  }
}

//flutter 隐式动画

