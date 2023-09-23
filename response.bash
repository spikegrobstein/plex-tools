#! /usr/bin/env bash

send_body() {
  local body="$1"
  local len="${#body}"

  echo "HTTP/1.1 200 OK"
  echo "content-type: text/html"
  echo "content-length: $len"
  echo ""
  echo "$body"
}

send_body "<html><h2>You are authed. close the window.</h2></html>"
