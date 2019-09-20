import 'package:dio/dio.dart';

const baseUrl = "https://api.iclient.ifeng.com/";
const webUrl = "https://fhxw.iyc.ifeng.com/?";
const configUrl =
    "&gv=6.6.5&av=6.6.5&uid=276130dd7d659baa&deviceid=276130dd7d659baa&proid=ifengnews&os=android_25&df=androidphone&vt=5&screen=720x1280&publishid=2011&nw=wifi&loginid=";

const kindUrl = {
  //新闻-搜索框内容
  "newsSearch": baseUrl +
      "client_search_hotword?st=15669847706867&sn=b7c6626b7d5a389f404edaa5cf450bd7" +
      configUrl,
  //新闻-链接
  "newsItems": baseUrl +
      "nlist?st=15669845414595&sn=fa04f09c96f0d4136509a4766993f016" +
      configUrl,
  //新闻-小说
  "newsFiction": webUrl +
      "cid=70004&gv=6.6.5&av=6.6.5&uid=276130dd7d659baa&deviceid=276130dd7d659baa&proid=ifengnews&os=android_25&df=androidphone&vt=5&screen=720x1280&publishid=2011&nw=disconnected&loginid=&st=15669849217573&sn=57b09bea2c72782b5fdf3d5fd6757770",
  //广场-数据
  "squareItems": baseUrl +
      "news_square?st=15689602573665&sn=2078a612e1a9de11a0eeb53d70cb101b" +
      configUrl,
};

Future getRequset(String url,
    {String id = "", int pullNum = 1, String action = "", int page = 0}) async {
  String otherUrl = "";

  if (pullNum != 0) {
    otherUrl = "&pullNum=$pullNum";
  }
  if (id != "") {
    otherUrl = otherUrl + "&id=$id";
  }
  if (action != "") {
    otherUrl = otherUrl + "&action=$action";
  }
  if (page != 0) {
    otherUrl = otherUrl + "&page=$page";
  }

  Dio dio = Dio();
  dio.options.responseType = ResponseType.plain;
  dio.options.connectTimeout = 5000;
  dio.options.receiveTimeout = 3000;
  print("------------------${kindUrl[url]}$otherUrl");
  try {
    Response response = await dio.get("${kindUrl[url]}$otherUrl");
    if (response.statusCode == 200) {
      return response.data;
    } else
      throw Exception("请求出错");
  } catch (DioError) {
    print(DioError.message);
  } catch (e) {
    return print("错误原因====" + e);
  }
}

Future postRequest(url, {formData}) async {
  try {
    print(kindUrl[url]);

    Response response;
    Dio dio = Dio();
    if (formData == null) {
      response = await dio.post(kindUrl[url]);
    } else {
      response = await dio.post(kindUrl[url], data: formData);
    }

    if (response.statusCode == 200) {
      return response.data;
    } else
      throw Exception("请求出错");
  } catch (e) {
    return print("错误原因====" + e);
  }
}
