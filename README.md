# PushRouteFactory
推送跳转封装，类似于组件化路由跳转

# 示例
![gif](https://github.com/Benight/PushRouteFactory/blob/master/pushRouteGIF.gif)


# 使用方法

### 推送过来的数据格式：
       @"route://test3?userID=123&testProperty2=345"
       如果后台的格式和这个不一样，就需要改下pushRouteFactorWithExtrasCustomStr方法，不然用不了


### 在"RouteRegisterHelper"注册类
    [RouteRegister registerName:RouteCustomMsg_testVC_3 withClassName:@"TestViewController" withPropertyDic:@{@"userID":@"testProperty1",@"testProperty2":@"testProperty2"} AppendingPropertyKeyValueDic:@{@"testType":@1}];
    
    注册的时候看Demo里面的注释
