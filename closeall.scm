; This program is free software
; you can redistribute it and/or modify 
; it under the terms of the GNU General Public 
; License as published by 
; the Free Software Foundation
; either version 2 of the License, or 
; (at your option) any later version. 
; 
; This program is distributed in the hope that it will be useful, 
; but WITHOUT ANY WARRANTY; without even the implied warranty of 
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the 
; GNU General Public License for more details. 


(define (script-fu-close-all-images) 
  (let* ((i (car (gimp-image-list))) 
         (image)) 
    (while (> i 0) 
      (set! image (vector-ref (cadr (gimp-image-list)) (- i 1))) 
      ;(gimp-image-undo-disable image)
      ;(gimp-image-clean-all image)
      (gimp-image-delete image)
      (set! i (- i 1))))) 

(script-fu-register "script-fu-close-all-images" 
 "<Image>/File/Close ALL" 
 "Close all opened images" 
 "Saul Goode" 
 "Saul Goode" 
 "11/21/2006" 
 "" 
 ) 