;;; -*- coding: utf-8 -*-
;;; Copyright (c) 2014-2016, Philip Xu <pyx@xrefactor.com>
;;; License: BSD New, see LICENSE for details.
"hyer.macros.flask_wtf - macros for extension flask-wtf"

;;; NOTE: for performance's sake, these macros assume certain functions being
;;; imported before calling site

;;; helper macro for import
(defmacro import-flask-wtf []
  `(do
     (import [flask [render-template]])))

(defmacro process-form [form template &rest actions]
  (when (symbol? form)
    (setv form `(~form)))
  (when (string? template)
    (setv template `(~template)))
  (with-gensyms [response]
    `(let [[form ~form]
          [~response nil]]
       (when (.validate-on-submit form)
         (setv ~response (do ~@actions)))
       (or ~response (render-template ~@template :form form)))))
