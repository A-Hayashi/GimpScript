
(define (add-mosaic-all)
  (let* ((i (car (gimp-image-list))) 
         (image)
         (drawable)
         (copy-layer)
         (width)
         (height)		
         (long)) 
    (while (> i 0) 
      (set! image (vector-ref (cadr (gimp-image-list)) (- i 1))) 
      (set! drawable (car (gimp-image-get-active-drawable image)))
        ;; 既存のレイヤにアルファチャンネルを追加
        (gimp-layer-add-alpha drawable)
        
        ;; 既存のレイヤをコピーして新しいレイヤにモザイクをかける
		(set! copy-layer (car (gimp-layer-copy drawable 1)))
		(gimp-image-insert-layer image copy-layer 0 1)
        
        
        ; apply effects
        ;(plug-in-gauss-rle 1 image copy-layer 32 32 0)
        
		(set! width  (car (gimp-drawable-width drawable)))
		(set! height (car (gimp-drawable-height drawable)))
				
		(if (< width height)
			(set! long height)
			(set! long width))

		(display "width:")
		(display width)
		(display "\nheight:")
		(display height)
		(display "\nlong:")
		(display long)
		(display "\npixcel:")
		(display (/ long 100))

        (plug-in-pixelize2 RUN-NONINTERACTIVE image copy-layer (/ long 100) (/ long 100))
		
        ;; 既存のレイヤを選択する       
        (gimp-image-set-active-layer image drawable)

        (gimp-displays-flush)
        (set! i (- i 1)))))
   
(script-fu-register "add-mosaic-all" 
 "<Image>/File/Mosaic ALL" 
 "Mosaic all opened images" 
 "A. Hayashi" 
 "A. Hayashi" 
 "06/04/2023" 
 "" 
 ) 