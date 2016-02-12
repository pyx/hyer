;;; -*- coding: utf-8 -*-
;;; Copyright (c) 2014-2016, Philip Xu <pyx@xrefactor.com>
;;; License: BSD New, see LICENSE for details.
"hyer.macros.route - routing DSL"

(import [hyer.utils [rule->args]])

(defmacro defroute [app route-name rule methods &rest body]
  "define url routing, construct argument list from rule"
  `(with-decorator (apply .route [~app ~rule] {'methods ~methods})
     (defn ~route-name [~@(rule->args rule)]
       ~@body)))

(defmacro GET [app route-name rule &rest body]
  "define GET handler"
  `(defroute ~app ~route-name ~rule '[GET] ~@body))

(defmacro POST [app route-name rule &rest body]
  "define POST handler"
  `(defroute ~app ~route-name ~rule '[POST] ~@body))

(defmacro GET/POST [app route-name rule &rest body]
  "define GET/POST handler"
  `(defroute ~app ~route-name ~rule '[GET POST] ~@body))
