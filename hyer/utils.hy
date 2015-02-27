;; -*- coding: utf-8 -*-
;; Copyright (c) 2012-2014, Philip Xu <pyx@xrefactor.com>
;; License: BSD New, see LICENSE for details.
"hyer.utils - utility functions"

(import re
        [hy.models.symbol [HySymbol]])

(defn mangle-identifier [identifier]
  "mangle identifier as hy compiler does"
  (def mangled identifier)
  ;; *foo* -> FOO
  (when (and (.startswith mangled "*")
             (.endswith mangled "*")
             (not-in mangled ["*" "**"]))
    (setv mangled (-> mangled (slice 1 -1) .upper)))
  ;; foo-bar -> foo_bar
  (when (and (in "-" mangled)
             (!= "-" mangled))
    (setv mangled (.replace mangled "-" "_")))
  ;; foo? -> is_foo
  (when (and (.endswith mangled "?")
             (!= "?" mangled))
    (setv mangled (.format "is_{}" (slice mangled 0 -1))))
  mangled)

(defn rule->args [rule]
  "extract argument names from rule pattern"
  (->>
    rule
    (.findall (re.compile "<([a-zA-Z-:]+)>"))
    (map (fn [arg]
             (if (in ":" arg)
               (-> arg (.partition ":") (nth 2))
               arg)))
    (map mangle-identifier)
    (map HySymbol)
    list))
