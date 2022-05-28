// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Pretendard"),
      home: const HttpCatListPage(),
    );
  }
}

class HttpCatListPage extends StatefulWidget {
  const HttpCatListPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HttpCatListState();
}

class _HttpCatListState extends State<HttpCatListPage> {
  final List<HttpStatusCode> _httpStatusCodes = [
    HttpStatusCode(
        statusCode: 100,
        statusTitle: "Continue",
        content:
            "This interim response indicates that the client should continue the request or ignore the response if the request is already finished."),
    HttpStatusCode(
        statusCode: 101,
        statusTitle: 'Switching Protocols',
        content:
            'This code is sent in response to an Upgrade request header from the client and indicates the protocol the server is switching to.'),
    HttpStatusCode(
        statusCode: 102,
        statusTitle: 'Processing',
        content:
            'This code indicates that the server has received and is processing the request, but no response is available yet.'),
    HttpStatusCode(
        statusCode: 200,
        statusTitle: 'OK',
        content:
            'The request succeeded. The result meaning of "success" depends on the HTTP method:'),
    HttpStatusCode(
        statusCode: 201,
        statusTitle: 'Created',
        content:
            'The request succeeded, and a new resource was created as a result. This is typically the response sent after POST requests, or some PUT requests.'),
    HttpStatusCode(
        statusCode: 202,
        statusTitle: 'Accepted',
        content:
            'The request has been received but not yet acted upon. It is noncommittal, since there is no way in HTTP to later send an asynchronous response indicating the outcome of the request. It is intended for cases where another process or server handles the request, or for batch processing. '),
    HttpStatusCode(
        statusCode: 203,
        statusTitle: 'Non-Authoritative Information',
        content:
            'This response code means the returned metadata is not exactly the same as is available from the origin server, but is collected from a local or a third-party copy. This is mostly used for mirrors or backups of another resource. Except for that specific case, the 200 OK response is preferred to this status. '),
    HttpStatusCode(
        statusCode: 204,
        statusTitle: 'No Content',
        content:
            'There is no content to send for this request, but the headers may be useful. The user agent may update its cached headers for this resource with the new ones. '),
    HttpStatusCode(
        statusCode: 206,
        statusTitle: 'Partial Content',
        content:
            'This response code is used when the Range header is sent from the client to request only part of a resource.'),
    HttpStatusCode(
        statusCode: 207,
        statusTitle: 'Multi-Status',
        content:
            'Conveys information about multiple resources, for situations where multiple status codes might be appropriate.'),
    HttpStatusCode(
        statusCode: 300,
        statusTitle: 'Multiple Choices',
        content:
            'The request has more than one possible response. The user agent or user should choose one of them. (There is no standardized way of choosing one of the responses, but HTML links to the possibilities are recommended so the user can pick.)'),
    HttpStatusCode(
        statusCode: 301,
        statusTitle: 'Moved Permanently',
        content:
            'The URL of the requested resource has been changed permanently. The new URL is given in the response.'),
    HttpStatusCode(
        statusCode: 302,
        statusTitle: 'Found',
        content:
            'This response code means that the URI of requested resource has been changed temporarily. Further changes in the URI might be made in the future. Therefore, this same URI should be used by the client in future requests. '),
    HttpStatusCode(
        statusCode: 303,
        statusTitle: 'See Other',
        content:
            'The server sent this response to direct the client to get the requested resource at another URI with a GET request.'),
    HttpStatusCode(
        statusCode: 304,
        statusTitle: 'Not Modified',
        content:
            'This is used for caching purposes. It tells the client that the response has not been modified, so the client can continue to use the same cached version of the response. '),
    HttpStatusCode(
        statusCode: 305,
        statusTitle: 'Use Proxy',
        content:
            'Defined in a previous version of the HTTP specification to indicate that a requested response must be accessed by a proxy. It has been deprecated due to security concerns regarding in-band configuration of a proxy. '),
    HttpStatusCode(
        statusCode: 307,
        statusTitle: 'Temporary Redirect',
        content:
            'The server sends this response to direct the client to get the requested resource at another URI with same method that was used in the prior request. This has the same semantics as the 302 Found HTTP response code, with the exception that the user agent must not change the HTTP method used: if a POST was used in the first request, a POST must be used in the second request. '),
    HttpStatusCode(
        statusCode: 308,
        statusTitle: 'Permanent Redirect',
        content:
            'This means that the resource is now permanently located at another URI, specified by the Location: HTTP Response header. This has the same semantics as the 301 Moved Permanently HTTP response code, with the exception that the user agent must not change the HTTP method used: if a POST was used in the first request, a POST must be used in the second request. '),
    HttpStatusCode(
        statusCode: 400,
        statusTitle: 'Bad Request',
        content:
            'The server cannot or will not process the request due to something that is perceived to be a client error (e.g., malformed request syntax, invalid request message framing, or deceptive request routing).'),
    HttpStatusCode(
        statusCode: 401,
        statusTitle: 'Unauthorized',
        content:
            'Although the HTTP standard specifies "unauthorized", semantically this response means "unauthenticated". That is, the client must authenticate itself to get the requested response. '),
    HttpStatusCode(
        statusCode: 402,
        statusTitle: 'Payment Required',
        content:
            'This response code is reserved for future use. The initial aim for creating this code was using it for digital payment systems, however this status code is used very rarely and no standard convention exists. '),
    HttpStatusCode(
        statusCode: 403,
        statusTitle: 'Forbidden',
        content:
            'The client does not have access rights to the content; that is, it is unauthorized, so the server is refusing to give the requested resource. Unlike 401 Unauthorized, the client\'s identity is known to the server. '),
    HttpStatusCode(
        statusCode: 404,
        statusTitle: 'Not Found',
        content:
            'The server can not find the requested resource. In the browser, this means the URL is not recognized. In an API, this can also mean that the endpoint is valid but the resource itself does not exist. Servers may also send this response instead of 403 Forbidden to hide the existence of a resource from an unauthorized client. This response code is probably the most well known due to its frequent occurrence on the web. '),
    HttpStatusCode(
        statusCode: 405,
        statusTitle: 'Method Not Allowed',
        content:
            'The request method is known by the server but is not supported by the target resource. For example, an API may not allow calling DELETE to remove a resource. '),
    HttpStatusCode(
        statusCode: 406,
        statusTitle: 'Not Acceptable',
        content:
            'This response is sent when the web server, after performing server-driven content negotiation, doesn\'t find any content that conforms to the criteria given by the user agent.'),
    HttpStatusCode(
        statusCode: 407,
        statusTitle: 'Proxy Authentication Required',
        content:
            'This is similar to 401 Unauthorized but authentication is needed to be done by a proxy.'),
    HttpStatusCode(
        statusCode: 408,
        statusTitle: 'Request Timeout',
        content:
            'This response is sent on an idle connection by some servers, even without any previous request by the client. It means that the server would like to shut down this unused connection. This response is used much more since some browsers, like Chrome, Firefox 27+, or IE9, use HTTP pre-connection mechanisms to speed up surfing. Also note that some servers merely shut down the connection without sending this message.'),
    HttpStatusCode(
        statusCode: 409,
        statusTitle: 'Conflict',
        content:
            'This response is sent when a request conflicts with the current state of the server.'),
    HttpStatusCode(
        statusCode: 410,
        statusTitle: 'Gone',
        content:
            'This response is sent when the requested content has been permanently deleted from server, with no forwarding address. Clients are expected to remove their caches and links to the resource. The HTTP specification intends this status code to be used for "limited-time, promotional services". APIs should not feel compelled to indicate resources that have been deleted with this status code.'),
    HttpStatusCode(
        statusCode: 411,
        statusTitle: 'Length Required',
        content:
            'Server rejected the request because the Content-Length header field is not defined and the server requires it.'),
    HttpStatusCode(
        statusCode: 412,
        statusTitle: 'Precondition Failed',
        content:
            'The client has indicated preconditions in its headers which the server does not meet.'),
    HttpStatusCode(
        statusCode: 413,
        statusTitle: 'Payload Too Large',
        content:
            'Request entity is larger than limits defined by server. The server might close the connection or return an Retry-After header field. '),
    HttpStatusCode(
        statusCode: 414,
        statusTitle: 'URI Too Long',
        content:
            'The URI requested by the client is longer than the server is willing to interpret.'),
    HttpStatusCode(
        statusCode: 415,
        statusTitle: 'Unsupported Media Type',
        content:
            'The media format of the requested data is not supported by the server, so the server is rejecting the request.'),
    HttpStatusCode(
        statusCode: 416,
        statusTitle: 'Range Not Satisfiable',
        content:
            'The client has asked for a portion of the file using the Range header, but the server cannot supply that portion.'),
    HttpStatusCode(
        statusCode: 417,
        statusTitle: 'Expectation Failed',
        content:
            'The server cannot meet the requirements of the Expect request header.'),
    HttpStatusCode(
        statusCode: 418,
        statusTitle: 'I\'m a teapot',
        content:
            'The server refuses the attempt to brew coffee with a teapot.'),
    HttpStatusCode(
        statusCode: 420,
        statusTitle: 'Enhance your calm',
        content: 'Enhance yourself'),
    HttpStatusCode(
        statusCode: 421,
        statusTitle: 'Misdirected Request',
        content:
            'The request was directed at a server that is not able to produce a response. This can be sent by a server that is not configured to produce responses for the combination of scheme and authority that are included in the request URI. '),
    HttpStatusCode(
        statusCode: 422,
        statusTitle: 'Unprocessable Entity',
        content:
            'The request was well-formed but was unable to be followed due to semantic errors.'),
    HttpStatusCode(
        statusCode: 423,
        statusTitle: 'Locked',
        content: 'The resource that is being accessed is locked.'),
    HttpStatusCode(
        statusCode: 424,
        statusTitle: 'Failed Dependency',
        content: 'The request failed due to failure of a previous request.'),
    HttpStatusCode(
        statusCode: 425,
        statusTitle: 'Too Early',
        content:
            'Indicates that the server is unwilling to risk processing a request that might be replayed.'),
    HttpStatusCode(
        statusCode: 426,
        statusTitle: 'Upgrade Required',
        content:
            'The server refuses to perform the request using the current protocol but might be willing to do so after the client upgrades to a different protocol. The server sends an Upgrade header in a 426 response to indicate the required protocol(s). '),
    HttpStatusCode(
        statusCode: 429,
        statusTitle: 'Too Many Requests',
        content:
            'The user has sent too many requests in a given amount of time ("rate limiting").'),
    HttpStatusCode(
        statusCode: 431,
        statusTitle: 'Request Header Fields Too Large',
        content:
            'The server is unwilling to process the request because its header fields are too large. The request may be resubmitted after reducing the size of the request header fields. '),
    HttpStatusCode(
        statusCode: 444,
        statusTitle: 'No Response',
        content:
            'A 444 No Response error indicates that the server has closed the connection with no returned information from a client request.'),
    HttpStatusCode(
        statusCode: 450,
        statusTitle: 'Blocked by Windows Parental Controls',
        content:
            'The 450 Block by Windows Parental Control response is a Microsoft-specific extension. It is an error given when the Windows Parental Controls are activated and are responding by blocking access to a certain site that does not qualify through the parameters set through the controls.'),
    HttpStatusCode(
        statusCode: 451,
        statusTitle: 'Unavailable For Legal Reasons',
        content:
            'The user agent requested a resource that cannot legally be provided, such as a web page censored by a government.'),
    HttpStatusCode(
        statusCode: 497,
        statusTitle: 'HTTP Request Sent to HTTPS Port',
        content:
            'Again, another expansion of the 400 Bad Request error response code, a 497 HTTP Request Sent to HTTPS Port is used when a client has made an HTTP request to a port that is listening for HTTPS requests specifically.'),
    HttpStatusCode(
        statusCode: 498,
        statusTitle: 'Invalid Token',
        content:
            'A 498 Invalid Token response is returned by ArcGIS for Server. This code indicates an invalid or expired token.'),
    HttpStatusCode(
        statusCode: 499,
        statusTitle: 'Client Closed Request',
        content:
            'A 499 Client Closed Request is used when the client has closed the request before the server could complete the task and send a response.'),
    HttpStatusCode(
        statusCode: 500,
        statusTitle: 'Internal Server Error',
        content:
            'The server has encountered a situation it does not know how to handle.'),
    HttpStatusCode(
        statusCode: 501,
        statusTitle: 'Not Implemented',
        content:
            'The request method is not supported by the server and cannot be handled. The only methods that servers are required to support (and therefore that must not return this code) are GET and HEAD.'),
    HttpStatusCode(
        statusCode: 502,
        statusTitle: 'Bad Gateway',
        content:
            'This error response means that the server, while working as a gateway to get a response needed to handle the request, got an invalid response.'),
    HttpStatusCode(
        statusCode: 503,
        statusTitle: 'Service Unavailable',
        content:
            'The server is not ready to handle the request. Common causes are a server that is down for maintenance or that is overloaded. Note that together with this response, a user-friendly page explaining the problem should be sent. This response should be used for temporary conditions and the Retry-After HTTP header should, if possible, contain the estimated time before the recovery of the service. The webmaster must also take care about the caching-related headers that are sent along with this response, as these temporary condition responses should usually not be cached. '),
    HttpStatusCode(
        statusCode: 504,
        statusTitle: 'Gateway Timeout',
        content:
            'This error response is given when the server is acting as a gateway and cannot get a response in time.'),
    HttpStatusCode(
        statusCode: 506,
        statusTitle: 'Variant Also Negotiates',
        content:
            'The server has an internal configuration error: the chosen variant resource is configured to engage in transparent content negotiation itself, and is therefore not a proper end point in the negotiation process.'),
    HttpStatusCode(
        statusCode: 507,
        statusTitle: 'Insufficient Storage',
        content:
            'The method could not be performed on the resource because the server is unable to store the representation needed to successfully complete the request.'),
    HttpStatusCode(
        statusCode: 508,
        statusTitle: 'Loop Detected',
        content:
            'The server detected an infinite loop while processing the request.'),
    HttpStatusCode(
        statusCode: 509,
        statusTitle: 'Bandwidth Limit is Exceeded',
        content:
            'In situations where a server has gone over the bandwidth quantified by a server administrator, users will receive a 509 Bandwidth Limit Exceeded error. This response is used by shared hosting providers to keep a limit on customer bandwidth.'),
    HttpStatusCode(
        statusCode: 510,
        statusTitle: 'Not Extended',
        content:
            'Further extensions to the request are required for the server to fulfill it.'),
    HttpStatusCode(
        statusCode: 511,
        statusTitle: 'Network Authentication Required',
        content:
            'Indicates that the client needs to authenticate to gain network access.'),
    HttpStatusCode(
        statusCode: 521,
        statusTitle: 'Web Server Is Down',
        content:
            'When the origin server has rejected the connection from Cloudflare, a 521 Web Server is Down error response will be given.'),
    HttpStatusCode(
        statusCode: 523,
        statusTitle: 'Origin Is Unreachable',
        content:
            'When Cloudflare cannot reach the origin server, a 523 Origin is Unreachable error response is given. For example, if the DNS files for the origin server are incorrect, a 523 error will be given.'),
    HttpStatusCode(
        statusCode: 525,
        statusTitle: 'SSL Handshake Failed',
        content:
            'A 525 SSL Handshake Failed error occurs when Cloudflare could not transfer a TLS/ SSL handshake with the server of origin.'),
    HttpStatusCode(
        statusCode: 599,
        statusTitle: 'Network Connect Timeout Error',
        content: 'Network Connect Timeout Error, literally.')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 62.0),
          child: ListView.builder(
            itemCount: _httpStatusCodes.length,
            itemBuilder: (_, index) {
              final statusCode = _httpStatusCodes.elementAt(index);
              return Hero(
                tag: '__cat_${statusCode.statusCode}',
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) =>
                                HttpCatPage(statusCode: statusCode)));
                  },
                  child: Image.network(
                    'https://http.cat/${statusCode.statusCode}',
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                    height: 300.0,
                    loadingBuilder: (_, child, loadingProgress) =>
                        loadingProgress == null
                            ? child
                            : Center(child: CupertinoActivityIndicator()),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class HttpCatPage extends StatefulWidget {
  const HttpCatPage({Key? key, required this.statusCode}) : super(key: key);

  final HttpStatusCode statusCode;

  @override
  State<StatefulWidget> createState() => _HttpCatPageState();
}

class _HttpCatPageState extends State<HttpCatPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      child: SafeArea(
          child: Container(
              padding: EdgeInsets.only(top: 56.0, bottom: 42.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Hero(
                        tag: '__cat_${widget.statusCode.statusCode}',
                        child: ImageWithLoading(
                          src:
                              'https://http.cat/${widget.statusCode.statusCode}',
                          fit: BoxFit.fill,
                        )),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                          padding: EdgeInsets.symmetric(
                              vertical: 28.0, horizontal: 32.0),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(widget.statusCode.statusTitle,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Pretendard",
                                          fontSize: 44.0,
                                          decoration: TextDecoration.none)),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 20.0),
                                    child: Text(
                                      widget.statusCode.content,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Pretendard",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.0,
                                          decoration: TextDecoration.none),
                                    ),
                                  )
                                ],
                              )))),
                ],
              ))),
    );
  }
}

class ImageWithLoading extends StatefulWidget {
  const ImageWithLoading({
    Key? key,
    required this.src,
    this.height = 300.0,
    this.fit = BoxFit.contain,
  }) : super(key: key);

  final String src;
  final double height;
  final BoxFit fit;

  @override
  State<StatefulWidget> createState() => _ImageWithLoadingState();
}

class _ImageWithLoadingState extends State<ImageWithLoading> {
  String src = 'NOT_LOADED';
  double height = 300.0;
  BoxFit fit = BoxFit.contain;

  @override
  void initState() {
    src = widget.src;
    height = widget.height;
    fit = widget.fit;
  }

  @override
  Widget build(BuildContext context) => Image.network(
        src,
        fit: fit,
        alignment: Alignment.center,
        height: height,
        loadingBuilder: (_, child, loadingProgress) => loadingProgress == null
            ? child
            : Center(child: CupertinoActivityIndicator()),
      );
}

class HttpStatusCode {
  final int statusCode;
  final String statusTitle;
  final String content;

  HttpStatusCode(
      {required this.statusCode,
      required this.statusTitle,
      required this.content});
}
