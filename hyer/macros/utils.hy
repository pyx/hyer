;;; -*- coding: utf-8 -*-
;;; Copyright (c) 2014-2016, Philip Xu <pyx@xrefactor.com>
;;; License: BSD New, see LICENSE for details.
"hyer.macros.utils - utility macros"

(import [hyer.utils [list->args/kwargs]])

(defmacro lisp-apply [function &rest arg-list]
  "true lisp style apply/funcall

  e.g
  (lisp-apply print 1 2 :end '$ 3 4)
  prints:
  1 2 3 4$

  (lisp-apply dict :a 1 :b 2)
  yields:
  {'a': 1, 'b': 2}
  "
  (def [args kwargs] (list->args/kwargs arg-list))
  `(apply ~function ~args ~kwargs))
