;; -*- coding: utf-8 -*-
;; Copyright (c) 2014-2015, Philip Xu <pyx@xrefactor.com>
;; License: BSD New, see LICENSE for details.
"hyer.macros.factory - factory DSL"

(defmacro defapplication [app &rest body]
  "define application object"
  (with-gensyms [Flask]
    `(do
       (import [flask [Flask :as ~Flask]])
       (def ~app (~Flask --name--))
       (doto ~app ~@body)
       ~app)))

(defmacro defblueprint [bp &rest body]
  "define blueprint object"
  (with-gensyms [Blueprint]
    `(do
       (import [flask [Blueprint :as ~Blueprint]])
       (def ~bp (~Blueprint ~(string bp) --name--))
       (doto ~bp ~@body)
       ~bp)))
