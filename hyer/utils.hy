;; -*- coding: utf-8 -*-
;; Copyright (c) 2012-2014, Philip Xu <pyx@xrefactor.com>
;; License: BSD New, see LICENSE for details.
"hyer.utils - utility functions"

(import re
        [hy.macros [_wrap_value]]
        [hy.models.symbol [HySymbol]])

(defn list->args/kwargs [arg-list]
  "return a tuple of [args] and {kw: arg} parsed from arg-list

  e.g
  => (list->args/kwargs [1 2 :foo 8 3 :bar 9])
  ([1 2 3], {:foo 8 :bar 9})
  "
  (def args [])
  (def kwargs {})
  (def key nil)
  (for [arg arg-list]
       (unless (nil? key)
         (assoc kwargs key arg)
         ; done with key, reset
         (setv key nil)
         (continue))
       (if (keyword? arg)
         ; got a key, needs a value
         (setv key (-> arg name mangle-identifier))
         ; else, save it into args list
         (.append args arg)))
  (unless (nil? key)
    (raise (KeyError (.format "keyword {!r} missing a value" key))))
  (, (_wrap_value args) (_wrap_value kwargs)))

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
