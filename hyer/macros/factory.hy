;; -*- coding: utf-8 -*-
;; Copyright (c) 2014-2015, Philip Xu <pyx@xrefactor.com>
;; License: BSD New, see LICENSE for details.
"hyer.macros.factory - factory DSL"

(defmacro defapplication [app &rest body]
  "define application object"
  `(do
     (def ~app (Flask --name--))
     (doto ~app ~@body)
     ~app))

(defmacro defblueprint [bp name &rest body]
  "define blueprint object"
  `(do
     (def ~bp (Blueprint ~name --name--))
     (doto ~bp ~@body)
     ~bp))
