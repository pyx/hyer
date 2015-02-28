#!/usr/bin/env hy
;; -*- coding: utf-8 -*-
;; Copyright (c) 2014-2015, Philip Xu <pyx@xrefactor.com>
;; License: BSD New, see LICENSE for details.
"Hello world example"

(import [flask [Flask]])

(require hyer.dsl)

(defn create-app []
  "application factory"
  (defapplication app
    (GET "/" index
      "Hello world")
    (GET "/<username>/" greeting
      (.format "Hello, {}!" username))
    (GET "/<int:a>+<int:b>/" addition
      (.format "{} + {} = {}" a b (+ a b)))))

(defmain [&rest args]
  (-> create-app apply .run))
