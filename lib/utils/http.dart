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
  //新闻-头条
  "newsHeadlines": baseUrl +
      "nlist?st=15669750697688&sn=9b26d94cc1671ad9fc2f23e1b11a5465" +
      configUrl,
  //新闻-视频
  "newsVideo": baseUrl +
      "nlist?id=RECOMVIDEO&action=default&st=15669759506571&sn=e358b5be9495b3eb52a562fa8a0a28d0" +
      configUrl,
  //新闻-"": baseUrl + "",
  //新闻-财经
  "newsFinance": baseUrl +
      "nlist?id=CJ33,FOCUSCJ33&action=down&pullNum=1&st=15669756488660&sn=91c7e68b94fae7a41eecf857710f76a2" +
      configUrl,
  //新闻-娱乐
  "newsEntertainment": baseUrl +
      "nlist?id=YL53,FOCUSYL53,SECNAVYL53&action=default&st=15669838796625&sn=0780eedb18da58532e8da7687ec937c3" +
      configUrl,
  //新闻-美食
  "newsFood": baseUrl +
      "nlist?id=DELIC,FOCUSDELIC&action=default&st=15669845414595&sn=fa04f09c96f0d4136509a4766993f016" +
      configUrl,
  //新闻-科技
  "newsTechnology": baseUrl +
      "nlist?id=KJ123,FOCUSKJ123,SECNAVKJ123&action=default&st=15669845768647&sn=714005c438e2b2e1a8dd954644c7feae" +
      configUrl,
  //新闻-5G
  "news5G": baseUrl +
      "nlist?id=KJ5G,FOCUSKJ5G&page=1&st=15669847708095&sn=83cc258621610127fdc6c3d7741a3d90" +
      configUrl,
  //新闻-小说
  "newsFiction": webUrl +
      "cid=70004&gv=6.6.5&av=6.6.5&uid=276130dd7d659baa&deviceid=276130dd7d659baa&proid=ifengnews&os=android_25&df=androidphone&vt=5&screen=720x1280&publishid=2011&nw=disconnected&loginid=&st=15669849217573&sn=57b09bea2c72782b5fdf3d5fd6757770",
};

Future getRequset(String url,
    {String id = "", int pullNum = 1, String action = ""}) async {
  String otherUrl = "&pullNum=$pullNum";
  if (id != "") {
    otherUrl = otherUrl + "&id=$id";
  }
  if (action != "") {
    otherUrl = otherUrl + "&action=$action";
  }

  Dio dio = Dio();
  dio.options.responseType = ResponseType.plain;
  dio.options.connectTimeout=5000;
  dio.options.receiveTimeout=3000;
  try {
    Response response = await dio.get("${kindUrl[url]}${otherUrl}");
    if (response.statusCode == 200) {
      return response.data;
    } else
      throw Exception("请求出错");
  }catch(DioError ){
    print(DioError.gaibianmessage);
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
