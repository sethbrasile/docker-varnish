#define servers
backend web1 {
    .host = "162.243.155.136";
    .port = "80";
}

backend web2 {
    .host = "104.131.136.18";
    .port = "80";
}



#load balancer
director nginx round-robin {
    { .backend = web1; }
    { .backend = web2; }
}


# When a request is made set the backend to the round-robin director named nginx
sub vcl_recv {
  if (req.http.host == "sethbrasile.geekedout.biz") {
    set req.http.host = "sethbrasile.geekedout.biz";
    set req.backend = web1;
  }
  if (req.http.host ~ "^(www\.)?bringingdownbroadway\.com$") {
    set req.http.host = "www.bringingdownbroadway.com";
    set req.backend = web2;
  }

}
