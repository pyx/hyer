;; -*- coding: utf-8 -*-
;; Copyright (c) 2014-2015, Philip Xu <pyx@xrefactor.com>
;; License: BSD New, see LICENSE for details.
"hyer.macros.factory - factory DSL"

(defmacro defapplication [app args &rest body]
  "define application object"
  (with-gensyms [Flask]
    `(do
       (import [flask [Flask :as ~Flask]])
       (def ~app (~Flask --name-- ~@args))
       (doto ~app ~@body)
       ~app)))

(defmacro defblueprint [bp args &rest body]
  "define blueprint object"
  (with-gensyms [Blueprint]
    `(do
       (import [flask [Blueprint :as ~Blueprint]])
       (def ~bp (~Blueprint ~(string bp) --name-- ~@args))
       (doto ~bp ~@body)
       ~bp)))
