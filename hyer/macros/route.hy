;; -*- coding: utf-8 -*-
;; Copyright (c) 2014-2015, Philip Xu <pyx@xrefactor.com>
;; License: BSD New, see LICENSE for details.
"hyer.macros.route - routing DSL"

(import [hyer.utils [rule->args]])

(defmacro defroute [app rule methods route-name &rest body]
  "define url routing, construct argument list from rule"
  `(with-decorator (apply .route [~app ~rule] {'methods ~methods})
     (defn ~route-name [~@(rule->args rule)]
       ~@body)))

(defmacro GET [app rule route-name &rest body]
  "define GET handler"
  `(defroute ~app ~rule '[GET] ~route-name ~@body))

(defmacro POST [app rule route-name &rest body]
  "define POST handler"
  `(defroute ~app ~rule '[POST] ~route-name ~@body))

(defmacro GET/POST [app rule route-name &rest body]
  "define GET/POST handler"
  `(defroute ~app ~rule '[GET POST] ~route-name ~@body))
